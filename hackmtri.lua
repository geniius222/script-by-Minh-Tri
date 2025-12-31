-- ============================================
-- 🌟 PREMIUM AUTO FARM HUB 🌟
-- ============================================

-- 🎨 COLOR PALETTE
local Colors = {
    Primary = Color3.fromRGB(0, 184, 148),
    Secondary = Color3.fromRGB(255, 118, 117),
    Background = Color3.fromRGB(25, 25, 35),
    Card = Color3.fromRGB(35, 35, 50),
    Text = Color3.fromRGB(240, 240, 240),
    Success = Color3.fromRGB(46, 204, 113),
    Warning = Color3.fromRGB(241, 196, 15),
    Danger = Color3.fromRGB(231, 76, 60)
}

-- 🏗️ CREATE MAIN GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PremiumAutoFarmHub"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("CoreGui")

-- 🌟 FLOATING TOGGLE BUTTON
local ToggleButton = Instance.new("Frame")
ToggleButton.Name = "ToggleButton"
ToggleButton.BackgroundColor3 = Colors.Primary
ToggleButton.BackgroundTransparency = 0.2
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
ToggleButton.Position = UDim2.new(0.02, 0, 0.5, -30)
ToggleButton.AnchorPoint = Vector2.new(0, 0.5)
ToggleButton.Parent = ScreenGui

local UICorner1 = Instance.new("UICorner")
UICorner1.CornerRadius = UDim.new(1, 0)
UICorner1.Parent = ToggleButton

local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Image = "rbxassetid://5554236805"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.8
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(23, 23, 277, 277)
Shadow.Size = UDim2.new(1, 20, 1, 20)
Shadow.Position = UDim2.new(0, -10, 0, -10)
Shadow.BackgroundTransparency = 1
Shadow.Parent = ToggleButton

local ToggleIcon = Instance.new("TextLabel")
ToggleIcon.Name = "ToggleIcon"
ToggleIcon.Text = "⚡"
ToggleIcon.Font = Enum.Font.GothamBold
ToggleIcon.TextColor3 = Colors.Text
ToggleIcon.TextSize = 24
ToggleIcon.BackgroundTransparency = 1
ToggleIcon.Size = UDim2.new(1, 0, 1, 0)
ToggleIcon.Parent = ToggleButton

local ButtonText = Instance.new("TextLabel")
ButtonText.Name = "ButtonText"
ButtonText.Text = "MENU"
ButtonText.Font = Enum.Font.GothamMedium
ButtonText.TextColor3 = Colors.Text
ButtonText.TextSize = 12
ButtonText.TextTransparency = 0.5
ButtonText.BackgroundTransparency = 1
ButtonText.Position = UDim2.new(0, 0, 1, 5)
ButtonText.Size = UDim2.new(1, 0, 0, 15)
ButtonText.Parent = ToggleButton

-- 🎨 MAIN MENU CONTAINER
local MainMenu = Instance.new("Frame")
MainMenu.Name = "MainMenu"
MainMenu.BackgroundColor3 = Colors.Background
MainMenu.BackgroundTransparency = 0.15
MainMenu.Size = UDim2.new(0, 300, 0, 400)
MainMenu.Position = UDim2.new(0.02, 70, 0.5, -200)
MainMenu.AnchorPoint = Vector2.new(0, 0.5)
MainMenu.Visible = false
MainMenu.Parent = ScreenGui

local MenuCorner = Instance.new("UICorner")
MenuCorner.CornerRadius = UDim.new(0, 12)
MenuCorner.Parent = MainMenu

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
MenuShadow.Parent = MainMenu

-- 📱 MENU HEADER
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.BackgroundColor3 = Colors.Primary
Header.Size = UDim2.new(1, 0, 0, 60)
Header.Parent = MainMenu

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Text = "🚀 AUTO FARM HUB"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Colors.Text
Title.TextSize = 20
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, -20, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Name = "Subtitle"
Subtitle.Text = "Premium Edition"
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.TextColor3 = Colors.Text
Subtitle.TextTransparency = 0.3
Subtitle.TextSize = 14
Subtitle.BackgroundTransparency = 1
Subtitle.Size = UDim2.new(1, -20, 0, 20)
Subtitle.Position = UDim2.new(0, 15, 0, 30)
Subtitle.Parent = Header

-- 🎯 CONTENT AREA
local Content = Instance.new("ScrollingFrame")
Content.Name = "Content"
Content.BackgroundTransparency = 1
Content.Size = UDim2.new(1, -10, 1, -70)
Content.Position = UDim2.new(0, 5, 0, 65)
Content.CanvasSize = UDim2.new(0, 0, 0, 500)
Content.ScrollBarThickness = 3
Content.ScrollBarImageColor3 = Colors.Primary
Content.Parent = MainMenu

local ContentLayout = Instance.new("UIListLayout")
ContentLayout.Padding = UDim.new(0, 10)
ContentLayout.Parent = Content

-- 🔥 AUTO FARM SECTION
local AutoFarmSection = Instance.new("Frame")
AutoFarmSection.Name = "AutoFarmSection"
AutoFarmSection.BackgroundColor3 = Colors.Card
AutoFarmSection.BackgroundTransparency = 0.1
AutoFarmSection.Size = UDim2.new(1, 0, 0, 180)
AutoFarmSection.Parent = Content

local SectionCorner = Instance.new("UICorner")
SectionCorner.CornerRadius = UDim.new(0, 8)
SectionCorner.Parent = AutoFarmSection

local SectionTitle = Instance.new("TextLabel")
SectionTitle.Name = "SectionTitle"
SectionTitle.Text = "⚡ AUTO FARM"
SectionTitle.Font = Enum.Font.GothamBold
SectionTitle.TextColor3 = Colors.Primary
SectionTitle.TextSize = 16
SectionTitle.BackgroundTransparency = 1
SectionTitle.Size = UDim2.new(1, -20, 0, 30)
SectionTitle.Position = UDim2.new(0, 10, 0, 5)
SectionTitle.Parent = AutoFarmSection

-- 🎮 AUTO FARM TOGGLE
local AutoFarmToggle = Instance.new("TextButton")
AutoFarmToggle.Name = "AutoFarmToggle"
AutoFarmToggle.Text = ""
AutoFarmToggle.BackgroundColor3 = Colors.Danger
AutoFarmToggle.Size = UDim2.new(0.9, 0, 0, 45)
AutoFarmToggle.Position = UDim2.new(0.05, 0, 0, 40)
AutoFarmToggle.Parent = AutoFarmSection

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = AutoFarmToggle

local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.Name = "ToggleLabel"
ToggleLabel.Text = "🚀 START AUTO FARM"
ToggleLabel.Font = Enum.Font.GothamBold
ToggleLabel.TextColor3 = Colors.Text
ToggleLabel.TextSize = 16
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Size = UDim2.new(1, 0, 1, 0)
ToggleLabel.Parent = AutoFarmToggle

-- 🗡️ WEAPON SELECTION
local WeaponFrame = Instance.new("Frame")
WeaponFrame.Name = "WeaponFrame"
WeaponFrame.BackgroundTransparency = 1
WeaponFrame.Size = UDim2.new(1, 0, 0, 40)
WeaponFrame.Position = UDim2.new(0, 0, 0, 95)
WeaponFrame.Parent = AutoFarmSection

local WeaponLabel = Instance.new("TextLabel")
WeaponLabel.Name = "WeaponLabel"
WeaponLabel.Text = "🗡️ Weapon:"
WeaponLabel.Font = Enum.Font.GothamMedium
WeaponLabel.TextColor3 = Colors.Text
WeaponLabel.TextTransparency = 0.3
WeaponLabel.TextSize = 14
WeaponLabel.BackgroundTransparency = 1
WeaponLabel.Size = UDim2.new(0.4, 0, 1, 0)
WeaponLabel.Parent = WeaponFrame

local WeaponDropdown = Instance.new("TextButton")
WeaponDropdown.Name = "WeaponDropdown"
WeaponDropdown.Text = "MELEE ▼"
WeaponDropdown.Font = Enum.Font.GothamMedium
WeaponDropdown.TextColor3 = Colors.Text
WeaponDropdown.TextSize = 14
WeaponDropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
WeaponDropdown.Size = UDim2.new(0.5, 0, 0.7, 0)
WeaponDropdown.Position = UDim2.new(0.4, 0, 0.15, 0)
WeaponDropdown.Parent = WeaponFrame

local DropdownCorner = Instance.new("UICorner")
DropdownCorner.CornerRadius = UDim.new(0, 6)
DropdownCorner.Parent = WeaponDropdown

-- 📊 STATS SECTION
local StatsSection = Instance.new("Frame")
StatsSection.Name = "StatsSection"
StatsSection.BackgroundColor3 = Colors.Card
StatsSection.BackgroundTransparency = 0.1
StatsSection.Size = UDim2.new(1, 0, 0, 150)
StatsSection.Parent = Content

local StatsCorner = Instance.new("UICorner")
StatsCorner.CornerRadius = UDim.new(0, 8)
StatsCorner.Parent = StatsSection

local StatsTitle = Instance.new("TextLabel")
StatsTitle.Name = "StatsTitle"
StatsTitle.Text = "📊 PLAYER STATS"
StatsTitle.Font = Enum.Font.GothamBold
StatsTitle.TextColor3 = Colors.Primary
StatsTitle.TextSize = 16
StatsTitle.BackgroundTransparency = 1
StatsTitle.Size = UDim2.new(1, -20, 0, 30)
StatsTitle.Position = UDim2.new(0, 10, 0, 5)
StatsTitle.Parent = StatsSection

local LevelDisplay = Instance.new("TextLabel")
LevelDisplay.Name = "LevelDisplay"
LevelDisplay.Text = "🎯 Level: 0"
LevelDisplay.Font = Enum.Font.GothamMedium
LevelDisplay.TextColor3 = Colors.Text
LevelDisplay.TextSize = 14
LevelDisplay.BackgroundTransparency = 1
LevelDisplay.Size = UDim2.new(1, -20, 0, 25)
LevelDisplay.Position = UDim2.new(0, 10, 0, 35)
LevelDisplay.Parent = StatsSection

local BeliDisplay = Instance.new("TextLabel")
BeliDisplay.Name = "BeliDisplay"
BeliDisplay.Text = "💰 Beli: 0"
BeliDisplay.Font = Enum.Font.GothamMedium
BeliDisplay.TextColor3 = Colors.Text
BeliDisplay.TextSize = 14
BeliDisplay.BackgroundTransparency = 1
BeliDisplay.Size = UDim2.new(1, -20, 0, 25)
BeliDisplay.Position = UDim2.new(0, 10, 0, 60)
BeliDisplay.Parent = StatsSection

local TargetDisplay = Instance.new("TextLabel")
TargetDisplay.Name = "TargetDisplay"
TargetDisplay.Text = "🎯 Target: None"
TargetDisplay.Font = Enum.Font.GothamMedium
TargetDisplay.TextColor3 = Colors.Text
TargetDisplay.TextSize = 14
TargetDisplay.BackgroundTransparency = 1
TargetDisplay.Size = UDim2.new(1, -20, 0, 25)
TargetDisplay.Position = UDim2.new(0, 10, 0, 85)
TargetDisplay.Parent = StatsSection

-- 🎨 ANIMATION FUNCTIONS
local TweenService = game:GetService("TweenService")

function ButtonHoverEffect(button)
    local hoverTween = TweenService:Create(button, TweenInfo.new(0.2), {
        BackgroundTransparency = 0
    })
    hoverTween:Play()
end

function ButtonLeaveEffect(button, originalTransparency)
    local leaveTween = TweenService:Create(button, TweenInfo.new(0.2), {
        BackgroundTransparency = originalTransparency or 0.1
    })
    leaveTween:Play()
end

function PulseEffect(button)
    local pulse1 = TweenService:Create(button, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(button.Size.X.Scale * 0.95, 0, button.Size.Y.Scale * 0.95, 0)
    })
    local pulse2 = TweenService:Create(button, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = button.Size
    })
    
    pulse1:Play()
    pulse1.Completed:Connect(function()
        pulse2:Play()
    end)
end

-- 🎯 TOGGLE MENU FUNCTION
local menuVisible = false
local isAnimating = false

ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        if isAnimating then return end
        isAnimating = true
        
        PulseEffect(ToggleButton)
        
        menuVisible = not menuVisible
        
        if menuVisible then
            -- Show menu
            MainMenu.Visible = true
            local showTween = TweenService:Create(MainMenu, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Position = UDim2.new(0.02, 70, 0.5, -200)
            })
            showTween:Play()
            
            ToggleIcon.Text = "✖"
            ToggleButton.BackgroundColor3 = Colors.Secondary
        else
            -- Hide menu
            local hideTween = TweenService:Create(MainMenu, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Position = UDim2.new(0.02, 40, 0.5, -200)
            })
            hideTween:Play()
            
            hideTween.Completed:Connect(function()
                MainMenu.Visible = false
                isAnimating = false
            end)
            
            ToggleIcon.Text = "⚡"
            ToggleButton.BackgroundColor3 = Colors.Primary
        end
        
        wait(0.3)
        isAnimating = false
    end
end)

-- 🎮 AUTO FARM LOGIC
local AutoFarmEnabled = false
_G.AutoLevel = false
local ChooseWeapon = "Melee"

-- Update Stats Function
function UpdateStats()
    pcall(function()
        local player = game:GetService("Players").LocalPlayer
        local level = player.Data.Level.Value
        local beli = player.Data.Beli.Value
        
        LevelDisplay.Text = "🎯 Level: " .. tostring(level)
        BeliDisplay.Text = "💰 Beli: " .. tostring(beli)
        
        if AutoFarmEnabled then
            TargetDisplay.Text = "🎯 Target: " .. (Ms or "None")
            TargetDisplay.TextColor3 = Colors.Success
        else
            TargetDisplay.Text = "🎯 Target: None"
            TargetDisplay.TextColor3 = Colors.Text
        end
    end)
end

-- Weapon Selection
local weaponOptions = {"MELEE", "SWORD", "BLOX FRUIT"}
local currentWeaponIndex = 1

WeaponDropdown.MouseButton1Click:Connect(function()
    currentWeaponIndex = currentWeaponIndex + 1
    if currentWeaponIndex > #weaponOptions then
        currentWeaponIndex = 1
    end
    
    WeaponDropdown.Text = weaponOptions[currentWeaponIndex] .. " ▼"
    ChooseWeapon = weaponOptions[currentWeaponIndex]:upper()
    
    PulseEffect(WeaponDropdown)
end)

-- Auto Farm Toggle
AutoFarmToggle.MouseButton1Click:Connect(function()
    AutoFarmEnabled = not AutoFarmEnabled
    _G.AutoLevel = AutoFarmEnabled
    
    if AutoFarmEnabled then
        -- Start Auto Farm
        AutoFarmToggle.BackgroundColor3 = Colors.Success
        ToggleLabel.Text = "⏹️ STOP AUTO FARM"
        
        -- Create notification
        local notification = Instance.new("Frame")
        notification.BackgroundColor3 = Colors.Success
        notification.Size = UDim2.new(0.4, 0, 0, 40)
        notification.Position = UDim2.new(0.3, 0, 0, 20)
        notification.Parent = ScreenGui
        
        local notiCorner = Instance.new("UICorner")
        notiCorner.CornerRadius = UDim.new(0, 8)
        notiCorner.Parent = notification
        
        local notiText = Instance.new("TextLabel")
        notiText.Text = "✅ AUTO FARM STARTED"
        notiText.Font = Enum.Font.GothamBold
        notiText.TextColor3 = Colors.Text
        notiText.TextSize = 14
        notiText.BackgroundTransparency = 1
        notiText.Size = UDim2.new(1, 0, 1, 0)
        notiText.Parent = notification
        
        -- Animate notification
        local showTween = TweenService:Create(notification, TweenInfo.new(0.3), {
            Position = UDim2.new(0.3, 0, 0, 30)
        })
        showTween:Play()
        
        wait(2)
        
        local hideTween = TweenService:Create(notification, TweenInfo.new(0.3), {
            Position = UDim2.new(0.3, 0, 0, -50)
        })
        hideTween:Play()
        
        hideTween.Completed:Connect(function()
            notification:Destroy()
        end)
        
        -- Start farming logic here
        spawn(function()
            while AutoFarmEnabled do
                -- Your farming logic goes here
                wait(0.1)
            end
        end)
    else
        -- Stop Auto Farm
        AutoFarmToggle.BackgroundColor3 = Colors.Danger
        ToggleLabel.Text = "🚀 START AUTO FARM"
        
        local notification = Instance.new("Frame")
        notification.BackgroundColor3 = Colors.Danger
        notification.Size = UDim2.new(0.4, 0, 0, 40)
        notification.Position = UDim2.new(0.3, 0, 0, 20)
        notification.Parent = ScreenGui
        
        local notiCorner = Instance.new("UICorner")
        notiCorner.CornerRadius = UDim.new(0, 8)
        notiCorner.Parent = notification
        
        local notiText = Instance.new("TextLabel")
        notiText.Text = "⏹️ AUTO FARM STOPPED"
        notiText.Font = Enum.Font.GothamBold
        notiText.TextColor3 = Colors.Text
        notiText.TextSize = 14
        notiText.BackgroundTransparency = 1
        notiText.Size = UDim2.new(1, 0, 1, 0)
        notiText.Parent = notification
        
        local showTween = TweenService:Create(notification, TweenInfo.new(0.3), {
            Position = UDim2.new(0.3, 0, 0, 30)
        })
        showTween:Play()
        
        wait(2)
        
        local hideTween = TweenService:Create(notification, TweenInfo.new(0.3), {
            Position = UDim2.new(0.3, 0, 0, -50)
        })
        hideTween:Play()
        
        hideTween.Completed:Connect(function()
            notification:Destroy()
        end)
    end
    
    PulseEffect(AutoFarmToggle)
end)

-- Hover Effects
AutoFarmToggle.MouseEnter:Connect(function()
    ButtonHoverEffect(AutoFarmToggle)
end)

AutoFarmToggle.MouseLeave:Connect(function()
    ButtonLeaveEffect(AutoFarmToggle, 0)
end)

WeaponDropdown.MouseEnter:Connect(function()
    ButtonHoverEffect(WeaponDropdown)
end)

WeaponDropdown.MouseLeave:Connect(function()
    ButtonLeaveEffect(WeaponDropdown, 0.2)
end)

ToggleButton.MouseEnter:Connect(function()
    local hoverTween = TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.1,
        Size = UDim2.new(0, 65, 0, 65)
    })
    hoverTween:Play()
end)

ToggleButton.MouseLeave:Connect(function()
    local leaveTween = TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
        BackgroundTransparency = 0.2,
        Size = UDim2.new(0, 60, 0, 60)
    })
    leaveTween:Play()
end)

-- 📱 UPDATE STATS LOOP
spawn(function()
    while wait(1) do
        UpdateStats()
    end
end)

-- 🎵 INITIAL NOTIFICATION
wait(1)
local welcomeNoti = Instance.new("Frame")
welcomeNoti.BackgroundColor3 = Colors.Primary
welcomeNoti.Size = UDim2.new(0.5, 0, 0, 50)
welcomeNoti.Position = UDim2.new(0.25, 0, 0, -60)
welcomeNoti.Parent = ScreenGui

local welcomeCorner = Instance.new("UICorner")
welcomeCorner.CornerRadius = UDim.new(0, 8)
welcomeCorner.Parent = welcomeNoti

local welcomeText = Instance.new("TextLabel")
welcomeText.Text = "🎮 AUTO FARM HUB LOADED!"
welcomeText.Font = Enum.Font.GothamBold
welcomeText.TextColor3 = Colors.Text
welcomeText.TextSize = 16
welcomeText.BackgroundTransparency = 1
welcomeText.Size = UDim2.new(1, 0, 1, 0)
welcomeText.Parent = welcomeNoti

local showWelcome = TweenService:Create(welcomeNoti, TweenInfo.new(0.5), {
    Position = UDim2.new(0.25, 0, 0, 30)
})
showWelcome:Play()

wait(3)

local hideWelcome = TweenService:Create(welcomeNoti, TweenInfo.new(0.5), {
    Position = UDim2.new(0.25, 0, 0, -60)
})
hideWelcome:Play()

hideWelcome.Completed:Connect(function()
    welcomeNoti:Destroy()
end)

-- 🎯 DRAGGABLE MENU
local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainMenu.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainMenu.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Header.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- 🎮 FINAL MESSAGE
print("=================================")
print("🚀 AUTO FARM HUB LOADED!")
print("Click the ⚡ button to toggle menu")
print("=================================")