-- ==================== MINH TRÍ TRÙM TOOL UI ====================
-- Tạo UI đẹp ngầu với nhiều hiệu ứng

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Tạo ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "MinhTriTool"
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ==================== BACKGROUND CHÍNH ====================
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 320, 0, 70)
mainFrame.Position = UDim2.new(0.01, 0, 0.02, 0)  -- Góc trên trái
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BackgroundTransparency = 0.15
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = false
mainFrame.Parent = gui

-- Bo góc
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 15)
corner.Parent = mainFrame

-- Viền sáng (glow effect)
local glowBorder = Instance.new("Frame")
glowBorder.Name = "GlowBorder"
glowBorder.Size = UDim2.new(1, 4, 1, 4)
glowBorder.Position = UDim2.new(-0.01, 0, -0.01, 0)
glowBorder.BackgroundColor3 = Color3.fromRGB(255, 100, 50)
glowBorder.BackgroundTransparency = 0.7
glowBorder.BorderSizePixel = 0
glowBorder.Parent = mainFrame

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(0, 18)
glowCorner.Parent = glowBorder

-- ==================== HIỆU ỨNG GRADIENT ====================
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 80, 40)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 180, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 80, 40))
})
gradient.Rotation = 45
gradient.Parent = mainFrame

-- ==================== CHỮ CHÍNH ====================
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "MINH TRÍ TRÙM TOOL"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextStrokeTransparency = 0.5
titleLabel.TextStrokeColor3 = Color3.fromRGB(255, 100, 50)
titleLabel.Parent = mainFrame

-- ==================== HIỆU ỨNG SHADOW ====================
local shadow = Instance.new("Frame")
shadow.Name = "Shadow"
shadow.Size = UDim2.new(1, 8, 1, 8)
shadow.Position = UDim2.new(-0.02, 0, -0.02, 0)
shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadow.BackgroundTransparency = 0.8
shadow.BorderSizePixel = 0
shadow.ZIndex = -1
shadow.Parent = mainFrame

local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, 18)
shadowCorner.Parent = shadow

-- ==================== HIỆU ỨNG PARTICLE (HẠT SÁNG) ====================
local particleContainer = Instance.new("Frame")
particleContainer.Name = "ParticleContainer"
particleContainer.Size = UDim2.new(1, 0, 1, 0)
particleContainer.BackgroundTransparency = 1
particleContainer.Parent = mainFrame

-- Hàm tạo hạt sáng
local function createParticle()
    local particle = Instance.new("Frame")
    particle.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
    particle.Position = UDim2.new(math.random() * 0.8 + 0.1, 0, math.random() * 0.8 + 0.1, 0)
    particle.BackgroundColor3 = Color3.fromRGB(255, math.random(100, 200), math.random(50, 100))
    particle.BackgroundTransparency = 0.3
    particle.BorderSizePixel = 0
    particle.Parent = particleContainer
    
    local particleCorner = Instance.new("UICorner")
    particleCorner.CornerRadius = UDim.new(1, 0)
    particleCorner.Parent = particle
    
    -- Hiệu ứng di chuyển
    local directionX = (math.random() - 0.5) * 2
    local directionY = (math.random() - 0.5) * 2
    
    local tween = TweenService:Create(
        particle,
        TweenInfo.new(math.random(2, 5), Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, false, 0),
        {
            Position = UDim2.new(
                particle.Position.X.Scale + directionX * 0.2,
                particle.Position.X.Offset + directionX * 20,
                particle.Position.Y.Scale + directionY * 0.2,
                particle.Position.Y.Offset + directionY * 20
            ),
            BackgroundTransparency = 1
        }
    )
    
    tween:Play()
    tween.Completed:Connect(function()
        particle:Destroy()
    end)
end

-- Tạo particle liên tục
spawn(function()
    while gui.Parent do
        task.wait(0.1)
        if mainFrame.Visible then
            pcall(createParticle)
        end
    end
end)

-- ==================== HIỆU ỨNG GLOW PULSE (NHẤP NHÁY) ====================
spawn(function()
    local glowFrame = Instance.new("Frame")
    glowFrame.Size = UDim2.new(1, 10, 1, 10)
    glowFrame.Position = UDim2.new(-0.02, 0, -0.02, 0)
    glowFrame.BackgroundColor3 = Color3.fromRGB(255, 100, 50)
    glowFrame.BackgroundTransparency = 0.8
    glowFrame.BorderSizePixel = 0
    glowFrame.Parent = mainFrame
    
    local glowCornerFrame = Instance.new("UICorner")
    glowCornerFrame.CornerRadius = UDim.new(0, 20)
    glowCornerFrame.Parent = glowFrame
    
    while gui.Parent do
        -- Hiệu ứng phồng lên xẹp xuống
        for i = 0, 1, 0.05 do
            local alpha = 0.5 + math.sin(i * math.pi) * 0.3
            glowFrame.BackgroundTransparency = 0.6 + math.sin(i * math.pi) * 0.3
            glowFrame.Size = UDim2.new(1, 8 + math.sin(i * math.pi) * 4, 1, 8 + math.sin(i * math.pi) * 4)
            task.wait(0.02)
        end
        task.wait(0.5)
    end
end)

-- ==================== HIỆU ỨNG TYPERWRITER (CHỮ CHẠY) ====================
local fullText = "MINH TRÍ TRÙM TOOL"
titleLabel.Text = ""

spawn(function()
    task.wait(0.5)
    for i = 1, #fullText do
        titleLabel.Text = string.sub(fullText, 1, i)
        -- Hiệu ứng rung nhẹ
        local originalPos = mainFrame.Position
        local shakeTween = TweenService:Create(
            mainFrame,
            TweenInfo.new(0.05, Enum.EasingStyle.Linear),
            {Position = UDim2.new(originalPos.X.Scale, math.random(-1, 1), originalPos.Y.Scale, math.random(-1, 1))}
        )
        shakeTween:Play()
        shakeTween.Completed:Connect(function()
            TweenService:Create(mainFrame, TweenInfo.new(0.05, Enum.EasingStyle.Linear), {Position = originalPos}):Play()
        end)
        task.wait(0.08)
    end
end)

-- ==================== HIỆU ỨNG RGB CHUYỂN MÀU ====================
spawn(function()
    local hue = 0
    while gui.Parent do
        hue = (hue + 0.005) % 1
        local color = Color3.fromHSV(hue, 1, 1)
        gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, color),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 180, 60)),
            ColorSequenceKeypoint.new(1, color)
        })
        task.wait(0.05)
    end
end)

-- ==================== HIỆU ỨNG CHUYỂN ĐỘNG NHẸ ====================
local moveUp = true
spawn(function()
    while gui.Parent do
        local targetPos
        if moveUp then
            targetPos = UDim2.new(0.01, 0, 0.018, 0)
        else
            targetPos = UDim2.new(0.01, 0, 0.022, 0)
        end
        
        local moveTween = TweenService:Create(
            mainFrame,
            TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {Position = targetPos}
        )
        moveTween:Play()
        moveTween.Completed:Wait()
        moveUp = not moveUp
        task.wait(0.5)
    end
end)

-- ==================== HIỆU ỨNG KHI HOVER CHUỘT ====================
mainFrame.MouseEnter:Connect(function()
    local hoverTween = TweenService:Create(
        mainFrame,
        TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 340, 0, 75)}
    )
    hoverTween:Play()
    
    local glowTween = TweenService:Create(
        glowBorder,
        TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {BackgroundTransparency = 0.4}
    )
    glowTween:Play()
end)

mainFrame.MouseLeave:Connect(function()
    local leaveTween = TweenService:Create(
        mainFrame,
        TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
        {Size = UDim2.new(0, 320, 0, 70)}
    )
    leaveTween:Play()
    
    local glowTween = TweenService:Create(
        glowBorder,
        TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
        {BackgroundTransparency = 0.7}
    )
    glowTween:Play()
end)

-- ==================== PHẦN PHỤ (SUB TEXT) ====================
local subFrame = Instance.new("Frame")
subFrame.Size = UDim2.new(0, 280, 0, 20)
subFrame.Position = UDim2.new(0.5, -140, 1, 5)
subFrame.BackgroundTransparency = 1
subFrame.Parent = mainFrame

local subText = Instance.new("TextLabel")
subText.Size = UDim2.new(1, 0, 1, 0)
subText.BackgroundTransparency = 1
subText.Text = "✦ PREMIUM TOOL ✦"
subText.TextColor3 = Color3.fromRGB(255, 200, 100)
subText.TextScaled = true
subText.Font = Enum.Font.Gotham
subText.TextTransparency = 0.3
subText.Parent = subFrame

-- Hiệu ứng chạy chữ cho sub text
spawn(function()
    while gui.Parent do
        for i = 0, 1, 0.02 do
            subText.TextTransparency = 0.3 + math.sin(i * math.pi * 2) * 0.3
            task.wait(0.02)
        end
    end
end)

print("✅ Minh Trí Trùm Tool UI đã được tạo thành công!")
