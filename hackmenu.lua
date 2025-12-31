-- ============================================
-- 🎮 SIMPLE AUTO FARM HUB
-- ============================================

-- Tạo giao diện đơn giản nhất
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SimpleFarmHub"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("CoreGui")

-- 🎯 TẠO NÚT CHÍNH CÓ THỂ DI CHUYỂN
local MainButton = Instance.new("TextButton")
MainButton.Name = "MainButton"
MainButton.Text = "⚡"
MainButton.Font = Enum.Font.GothamBold
MainButton.TextSize = 28
MainButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MainButton.BackgroundColor3 = Color3.fromRGB(0, 184, 148)
MainButton.BorderSizePixel = 0
MainButton.Size = UDim2.new(0, 60, 0, 60)
MainButton.Position = UDim2.new(0.02, 0, 0.5, -30)
MainButton.AnchorPoint = Vector2.new(0, 0.5)
MainButton.ZIndex = 999
MainButton.Parent = ScreenGui

-- Bo góc nút
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = MainButton

-- Hiệu ứng bóng
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Image = "rbxassetid://5554236805"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.7
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(23, 23, 277, 277)
Shadow.Size = UDim2.new(1, 20, 1, 20)
Shadow.Position = UDim2.new(0, -10, 0, -10)
Shadow.BackgroundTransparency = 1
Shadow.ZIndex = 998
Shadow.Parent = MainButton

-- 📱 TẠO PANEL MENU
local MenuPanel = Instance.new("Frame")
MenuPanel.Name = "MenuPanel"
MenuPanel.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
MenuPanel.BackgroundTransparency = 0.1
MenuPanel.Size = UDim2.new(0, 250, 0, 300)
MenuPanel.Position = UDim2.new(0.02, 70, 0.5, -150)
MenuPanel.AnchorPoint = Vector2.new(0, 0.5)
MenuPanel.Visible = false
MenuPanel.ZIndex = 997
MenuPanel.Parent = ScreenGui

local MenuCorner = Instance.new("UICorner")
MenuCorner.CornerRadius = UDim.new(0, 10)
MenuCorner.Parent = MenuPanel

local MenuShadow = Instance.new("ImageLabel")
MenuShadow.Name = "MenuShadow"
MenuShadow.Image = "rbxassetid://5554236805"
MenuShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
MenuShadow.ImageTransparency = 0.7
MenuShadow.ScaleType = Enum.ScaleType.Slice
MenuShadow.SliceCenter = Rect.new(23, 23, 277, 277)
MenuShadow.Size = UDim2.new(1, 20, 1, 20)
MenuShadow.Position = UDim2.new(0, -10, 0, -10)
MenuShadow.BackgroundTransparency = 1
MenuShadow.ZIndex = 996
MenuShadow.Parent = MenuPanel

-- Tiêu đề menu
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Text = "⚡ AUTO FARM"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.ZIndex = 999
Title.Parent = MenuPanel

-- Nút đóng menu
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Text = "×"
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 20
CloseButton.BackgroundTransparency = 1
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -40, 0, 0)
CloseButton.ZIndex = 999
CloseButton.Parent = MenuPanel

-- Vùng chứa nội dung
local Content = Instance.new("ScrollingFrame")
Content.Name = "Content"
Content.BackgroundTransparency = 1
Content.Size = UDim2.new(1, -10, 1, -50)
Content.Position = UDim2.new(0, 5, 0, 45)
Content.CanvasSize = UDim2.new(0, 0, 0, 400)
Content.ScrollBarThickness = 3
Content.ScrollBarImageColor3 = Color3.fromRGB(0, 184, 148)
Content.ZIndex = 999
Content.Parent = MenuPanel

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.Padding = UDim.new(0, 10)
ContentLayout.Parent = Content

-- 🎮 NÚT AUTO FARM
local AutoFarmButton = Instance.new("TextButton")
AutoFarmButton.Name = "AutoFarmButton"
AutoFarmButton.Text = "🚀 BẬT AUTO FARM"
AutoFarmButton.Font = Enum.Font.GothamBold
AutoFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmButton.TextSize = 16
AutoFarmButton.BackgroundColor3 = Color3.fromRGB(231, 76, 60) -- Đỏ khi tắt
AutoFarmButton.Size = UDim2.new(0.9, 0, 0, 50)
AutoFarmButton.Position = UDim2.new(0.05, 0, 0, 0)
AutoFarmButton.ZIndex = 1000
AutoFarmButton.Parent = Content

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = AutoFarmButton

-- Chọn vũ khí
local WeaponFrame = Instance.new("Frame")
WeaponFrame.Name = "WeaponFrame"
WeaponFrame.BackgroundTransparency = 1
WeaponFrame.Size = UDim2.new(0.9, 0, 0, 40)
WeaponFrame.Position = UDim2.new(0.05, 0, 0, 60)
WeaponFrame.ZIndex = 1000
WeaponFrame.Parent = Content

local WeaponLabel = Instance.new("TextLabel")
WeaponLabel.Name = "WeaponLabel"
WeaponLabel.Text = "🗡️ Vũ khí:"
WeaponLabel.Font = Enum.Font.GothamMedium
WeaponLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
WeaponLabel.TextSize = 14
WeaponLabel.BackgroundTransparency = 1
WeaponLabel.Size = UDim2.new(0.4, 0, 1, 0)
WeaponLabel.ZIndex = 1001
WeaponLabel.Parent = WeaponFrame

local WeaponButton = Instance.new("TextButton")
WeaponButton.Name = "WeaponButton"
WeaponButton.Text = "MELEE ▼"
WeaponButton.Font = Enum.Font.GothamMedium
WeaponButton.TextColor3 = Color3.fromRGB(255, 255, 255)
WeaponButton.TextSize = 14
WeaponButton.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
WeaponButton.Size = UDim2.new(0.5, 0, 0.7, 0)
WeaponButton.Position = UDim2.new(0.4, 0, 0.15, 0)
WeaponButton.ZIndex = 1001
WeaponButton.Parent = WeaponFrame

local WeaponCorner = Instance.new("UICorner")
WeaponCorner.CornerRadius = UDim.new(0, 6)
WeaponCorner.Parent = WeaponButton

-- Hiển thị Level
local LevelFrame = Instance.new("Frame")
LevelFrame.Name = "LevelFrame"
LevelFrame.BackgroundTransparency = 1
LevelFrame.Size = UDim2.new(0.9, 0, 0, 30)
LevelFrame.Position = UDim2.new(0.05, 0, 0, 110)
LevelFrame.ZIndex = 1000
LevelFrame.Parent = Content

local LevelText = Instance.new("TextLabel")
LevelText.Name = "LevelText"
LevelText.Text = "🎯 Level: 0"
LevelText.Font = Enum.Font.GothamMedium
LevelText.TextColor3 = Color3.fromRGB(255, 255, 255)
LevelText.TextSize = 14
LevelText.BackgroundTransparency = 1
LevelText.Size = UDim2.new(1, 0, 1, 0)
LevelText.ZIndex = 1001
LevelText.Parent = LevelFrame

-- 🎮 BIẾN TOÀN CỤC
_G.AutoLevel = false
local AutoFarmEnabled = false
local ChooseWeapon = "Melee"
local weaponOptions = {"MELEE", "SWORD", "BLOX FRUIT"}
local currentWeapon = 1

-- 🔧 HÀM HIỆU ỨNG
local TweenService = game:GetService("TweenService")

function PulseEffect(button)
    local pulse1 = TweenService:Create(button, TweenInfo.new(0.15), {
        Size = UDim2.new(button.Size.X.Scale * 0.95, 0, button.Size.Y.Scale * 0.95, 0)
    })
    local pulse2 = TweenService:Create(button, TweenInfo.new(0.15), {
        Size = button.Size
    })
    
    pulse1:Play()
    pulse1.Completed:Connect(function()
        pulse2:Play()
    end)
end

-- 🎯 TOGGLE MENU
local menuOpen = false

MainButton.MouseButton1Click:Connect(function()
    menuOpen = not menuOpen
    MenuPanel.Visible = menuOpen
    
    if menuOpen then
        MainButton.Text = "✖"
        MainButton.BackgroundColor3 = Color3.fromRGB(231, 76, 60) -- Đỏ khi mở menu
    else
        MainButton.Text = "⚡"
        MainButton.BackgroundColor3 = Color3.fromRGB(0, 184, 148) -- Xanh khi đóng menu
    end
    
    PulseEffect(MainButton)
end)

CloseButton.MouseButton1Click:Connect(function()
    menuOpen = false
    MenuPanel.Visible = false
    MainButton.Text = "⚡"
    MainButton.BackgroundColor3 = Color3.fromRGB(0, 184, 148)
    PulseEffect(CloseButton)
end)

-- 🎮 AUTO FARM TOGGLE
AutoFarmButton.MouseButton1Click:Connect(function()
    AutoFarmEnabled = not AutoFarmEnabled
    _G.AutoLevel = AutoFarmEnabled
    
    if AutoFarmEnabled then
        -- Bật auto farm
        AutoFarmButton.Text = "⏹️ TẮT AUTO FARM"
        AutoFarmButton.BackgroundColor3 = Color3.fromRGB(46, 204, 113) -- Xanh lá khi bật
        
        -- Thông báo
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "🚀 AUTO FARM",
            Text = "Đã bật Auto Farm!",
            Duration = 2
        })
        
        print("✅ Auto Farm đã BẬT")
    else
        -- Tắt auto farm
        AutoFarmButton.Text = "🚀 BẬT AUTO FARM"
        AutoFarmButton.BackgroundColor3 = Color3.fromRGB(231, 76, 60) -- Đỏ khi tắt
        
        -- Thông báo
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "⏹️ AUTO FARM",
            Text = "Đã tắt Auto Farm!",
            Duration = 2
        })
        
        print("❌ Auto Farm đã TẮT")
    end
    
    PulseEffect(AutoFarmButton)
end)

-- 🗡️ CHỌN VŨ KHÍ
WeaponButton.MouseButton1Click:Connect(function()
    currentWeapon = currentWeapon + 1
    if currentWeapon > #weaponOptions then
        currentWeapon = 1
    end
    
    WeaponButton.Text = weaponOptions[currentWeapon] .. " ▼"
    ChooseWeapon = weaponOptions[currentWeapon]:upper()
    
    PulseEffect(WeaponButton)
    print("🗡️ Đã chọn vũ khí: " .. ChooseWeapon)
end)

-- 📊 CẬP NHẬT LEVEL
spawn(function()
    while wait(1) do
        pcall(function()
            local level = game:GetService("Players").LocalPlayer.Data.Level.Value
            LevelText.Text = "🎯 Level: " .. tostring(level)
        end)
    end
end)

-- 🎯 DI CHUYỂN NÚT CHÍNH
local dragging = false
local dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    
    -- Di chuyển menu theo nút
    if MenuPanel.Visible then
        MenuPanel.Position = UDim2.new(
            MainButton.Position.X.Scale,
            MainButton.Position.X.Offset + 70,
            MainButton.Position.Y.Scale,
            MainButton.Position.Y.Offset - 30
        )
    end
end

MainButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainButton.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- 🎯 DI CHUYỂN MENU
MenuPanel.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and input.Position.Y < Title.AbsolutePosition.Y + 40 then
        dragging = true
        dragStart = input.Position
        startPos = MenuPanel.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

-- 🎨 HIỆU ỨNG HOVER
MainButton.MouseEnter:Connect(function()
    TweenService:Create(MainButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.1,
        Size = UDim2.new(0, 65, 0, 65)
    }):Play()
end)

MainButton.MouseLeave:Connect(function()
    TweenService:Create(MainButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0,
        Size = UDim2.new(0, 60, 0, 60)
    }):Play()
end)

AutoFarmButton.MouseEnter:Connect(function()
    TweenService:Create(AutoFarmButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.1
    }):Play()
end)

AutoFarmButton.MouseLeave:Connect(function()
    TweenService:Create(AutoFarmButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0
    }):Play()
end)

WeaponButton.MouseEnter:Connect(function()
    TweenService:Create(WeaponButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.2
    }):Play()
end)

WeaponButton.MouseLeave:Connect(function()
    TweenService:Create(WeaponButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0
    }):Play()
end)

-- 🎯 THÔNG BÁO KHỞI ĐỘNG
wait(1)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "🎮 AUTO FARM HUB",
    Text = "Nhấn nút ⚡ để mở menu!",
    Duration = 3
})

print("=================================")
print("🎮 AUTO FARM HUB ĐÃ SẴN SÀNG!")
print("Nhấn nút ⚡ để mở menu")
print("Kéo nút để di chuyển")
print("=================================")