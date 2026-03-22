-- ==================== MINH TRÍ TRÙM TOOL - 7 MÀU GÓC PHẢI ====================
-- Chữ nhỏ, không thể tương tác, hiệu ứng 7 màu đẹp mắt

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- Tạo ScreenGui (không chặn tương tác game)
local gui = Instance.new("ScreenGui")
gui.Name = "MinhTriTool"
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- ==================== FRAME CHÍNH ====================
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 140, 0, 28)  -- Nhỏ gọn
mainFrame.Position = UDim2.new(1, -150, 0.02, 0)  -- Góc trên bên phải
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BackgroundTransparency = 0.3  -- Trong suốt nhẹ
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = false
mainFrame.Parent = gui

-- **QUAN TRỌNG: Không cho phép bấm vào**
mainFrame.Active = false
mainFrame.Selectable = false
mainFrame.Interactable = false

-- Bo góc nhẹ
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = mainFrame

-- ==================== CHỮ CHÍNH 7 MÀU ====================
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "MINH TRÍ TRÙM TOOL"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextStrokeTransparency = 0.4
titleLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
titleLabel.Parent = mainFrame

-- **Không cho bấm vào chữ**
titleLabel.Active = false
titleLabel.Selectable = false

-- ==================== HIỆU ỨNG 7 MÀU CHUYỂN ĐỘNG ====================
-- Tạo gradient 7 màu
local gradient = Instance.new("UIGradient")
gradient.Rotation = 90
gradient.Parent = mainFrame

-- Mảng 7 màu RGB đẹp
local colors = {
    Color3.fromRGB(255, 80, 80),   -- Đỏ
    Color3.fromRGB(255, 160, 80),  -- Cam
    Color3.fromRGB(255, 255, 80),  -- Vàng
    Color3.fromRGB(80, 255, 80),   -- Xanh lá
    Color3.fromRGB(80, 200, 255),  -- Xanh dương
    Color3.fromRGB(160, 80, 255),  -- Tím
    Color3.fromRGB(255, 80, 200)   -- Hồng
}

-- Tạo hiệu ứng chuyển màu liên tục
local colorIndex = 1
local tweenColor = nil

local function updateGradient()
    local color1 = colors[colorIndex]
    local color2 = colors[colorIndex % 7 + 1]
    
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, color1),
        ColorSequenceKeypoint.new(0.5, color2),
        ColorSequenceKeypoint.new(1, color1)
    })
    
    colorIndex = colorIndex % 7 + 1
end

-- Chạy hiệu ứng chuyển màu
spawn(function()
    while gui.Parent do
        updateGradient()
        task.wait(0.8)  -- Mỗi 0.8 giây đổi màu
    end
end)

-- ==================== HIỆU ỨNG GLOW NHẸ ====================
local glowFrame = Instance.new("Frame")
glowFrame.Size = UDim2.new(1, 6, 1, 6)
glowFrame.Position = UDim2.new(-0.02, 0, -0.02, 0)
glowFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
glowFrame.BackgroundTransparency = 0.6
glowFrame.BorderSizePixel = 0
glowFrame.Active = false
glowFrame.Selectable = false
glowFrame.Parent = mainFrame

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(0, 10)
glowCorner.Parent = glowFrame

-- Hiệu ứng glow nhấp nháy nhẹ
spawn(function()
    while gui.Parent do
        for i = 0, 1, 0.05 do
            local alpha = 0.5 + math.sin(i * math.pi) * 0.2
            glowFrame.BackgroundTransparency = 0.5 + math.sin(i * math.pi) * 0.3
            task.wait(0.03)
        end
        task.wait(0.5)
    end
end)

-- ==================== HIỆU ỨNG HẠT SÁNG NHỎ ====================
local particleContainer = Instance.new("Frame")
particleContainer.Size = UDim2.new(1, 0, 1, 0)
particleContainer.BackgroundTransparency = 1
particleContainer.Active = false
particleContainer.Parent = mainFrame

local function createParticle()
    local particle = Instance.new("Frame")
    particle.Size = UDim2.new(0, math.random(1, 2), 0, math.random(1, 2))
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundColor3 = colors[math.random(1, 7)]
    particle.BackgroundTransparency = 0.2
    particle.BorderSizePixel = 0
    particle.Active = false
    particle.Parent = particleContainer
    
    local particleCorner = Instance.new("UICorner")
    particleCorner.CornerRadius = UDim.new(1, 0)
    particleCorner.Parent = particle
    
    local directionX = (math.random() - 0.5) * 0.5
    local directionY = (math.random() - 0.5) * 0.5
    
    local tween = TweenService:Create(
        particle,
        TweenInfo.new(math.random(2, 4), Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1),
        {
            Position = UDim2.new(
                particle.Position.X.Scale + directionX,
                particle.Position.X.Offset,
                particle.Position.Y.Scale + directionY,
                particle.Position.Y.Offset
            ),
            BackgroundTransparency = 1
        }
    )
    
    tween:Play()
    tween.Completed:Connect(function()
        particle:Destroy()
    end)
end

-- Tạo hạt sáng thưa hơn (tránh lag trên điện thoại)
spawn(function()
    while gui.Parent do
        task.wait(0.3)
        pcall(createParticle)
    end
end)

-- ==================== HIỆU ỨNG FADE IN KHI MỚI VÀO ====================
mainFrame.BackgroundTransparency = 1
titleLabel.TextTransparency = 1
glowFrame.BackgroundTransparency = 1

TweenService:Create(mainFrame, TweenInfo.new(0.5), {BackgroundTransparency = 0.3}):Play()
TweenService:Create(titleLabel, TweenInfo.new(0.8), {TextTransparency = 0}):Play()
TweenService:Create(glowFrame, TweenInfo.new(0.5), {BackgroundTransparency = 0.6}):Play()

print("✅ Minh Trí Trùm Tool - 7 Màu - Góc Phải - Đã tạo thành công!")
