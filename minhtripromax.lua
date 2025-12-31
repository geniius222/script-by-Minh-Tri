local v14 = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))();
local v15 = v14:CreateWindow({
    Title = "🚀 Auto Farm Hub",
    SubTitle = "Premium Edition",
    TabWidth = 160,
    Theme = "Ocean",
    Acrylic = true,
    Size = UDim2.fromOffset(350, 200),
    MinimizeKey = Enum.KeyCode.End
});

-- 🌟 SNOW EFFECT UI 🌟
spawn(function()
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local player = Players.LocalPlayer

    local gui = Instance.new("ScreenGui")
    gui.Name = "SnowEffect"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.Parent = player:WaitForChild("PlayerGui")

    local snowImage = "rbxassetid://8154439846"

    local function createSnow()
        local snow = Instance.new("ImageLabel")
        snow.BackgroundTransparency = 1
        snow.Image = snowImage
        snow.Size = UDim2.new(0, math.random(10, 20), 0, math.random(10, 20))
        snow.Position = UDim2.new(math.random(), 0, -0.1, 0)
        snow.ImageTransparency = math.random(0, 30) / 100
        snow.ZIndex = 999
        snow.Parent = gui

        local duration = math.random(5, 10)
        local endPos = UDim2.new(snow.Position.X.Scale, 0, 1.1, 0)

        local tween = TweenService:Create(
            snow,
            TweenInfo.new(duration, Enum.EasingStyle.Linear),
            {Position = endPos}
        )

        tween:Play()
        tween.Completed:Connect(function()
            snow:Destroy()
        end)
    end

    while task.wait(0.2) do
        pcall(createSnow)
    end
end)

-- 🎨 MAIN MENU TAB
local MainTab = v15:AddTab({
    Title = "🎮 Main Menu"
})

-- 🔥 AUTO FARM SECTION
MainTab:AddSection({
    Title = "Auto Farm System"
})

-- Toggle Auto Farm
local AutoFarmToggle = MainTab:AddToggle("AutoFarmToggle", {
    Title = "🚀 Auto Farm Level",
    Description = "Tự động farm level và quái",
    Default = false
})

AutoFarmToggle:OnChanged(function(value)
    _G.AutoLevel = value
    if value == false then
        wait()
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
    end
end)

-- Weapon Selection
local WeaponDropdown = MainTab:AddDropdown("WeaponSelect", {
    Title = "🗡️ Select Weapon",
    Description = "Chọn vũ khí để farm",
    Values = {"Melee", "Sword", "Blox Fruit"},
    Multi = false,
    Default = 1
})

WeaponDropdown:SetValue("Melee")
WeaponDropdown:OnChanged(function(value)
    ChooseWeapon = value
end)

-- Farm Settings
MainTab:AddSection({
    Title = "⚙️ Settings"
})

-- Tween Speed
MainTab:AddSlider("TweenSpeed", {
    Title = "⚡ Tween Speed",
    Description = "Tốc độ di chuyển",
    Default = 350,
    Min = 100,
    Max = 500,
    Rounding = 1,
    Callback = function(value)
        TweenSpeed = value
    end
})

-- Fast Attack Mode
MainTab:AddDropdown("FastAttackMode", {
    Title = "⚔️ Attack Speed",
    Description = "Chế độ tấn công",
    Values = {"Normal", "Fast", "Super Fast"},
    Multi = false,
    Default = 1
})

-- 📊 STATS SECTION
local StatsTab = v15:AddTab({
    Title = "📊 Stats"
})

StatsTab:AddParagraph({
    Title = "Player Stats",
    Content = "Thông tin người chơi"
})

-- Level Display
local LevelDisplay = StatsTab:AddParagraph({
    Title = "🎯 Level: ",
    Content = "0"
})

spawn(function()
    while wait(1) do
        pcall(function()
            local level = game:GetService("Players").LocalPlayer.Data.Level.Value
            LevelDisplay:SetDesc("Level: " .. tostring(level))
        end)
    end
end)

-- Beli Display
local BeliDisplay = StatsTab:AddParagraph({
    Title = "💰 Beli: ",
    Content = "0"
})

spawn(function()
    while wait(1) do
        pcall(function()
            local beli = game:GetService("Players").LocalPlayer.Data.Beli.Value
            BeliDisplay:SetDesc("Beli: " .. tostring(beli))
        end)
    end
end)

-- 🎯 TARGET SECTION
StatsTab:AddSection({
    Title = "🎯 Current Target"
})

local TargetDisplay = StatsTab:AddParagraph({
    Title = "👹 Target: ",
    Content = "None"
})

-- ⚙️ SETTINGS TAB
local SettingsTab = v15:AddTab({
    Title = "⚙️ Settings"
})

SettingsTab:AddSection({
    Title = "UI Settings"
})

-- UI Toggle Key
SettingsTab:AddParagraph({
    Title = "🔧 Toggle UI",
    Content = "Press [END] to show/hide menu"
})

-- Auto Haki
local AutoHakiToggle = SettingsTab:AddToggle("AutoHaki", {
    Title = "🛡️ Auto Haki",
    Description = "Tự động bật Busoshoku Haki",
    Default = true
})

-- 🎨 FLOATING MENU BUTTON
local FloatingButton = Instance.new("ScreenGui")
local ToggleBtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UIPadding = Instance.new("UIPadding")

FloatingButton.Name = "FloatingMenu"
FloatingButton.Parent = game:GetService("CoreGui")
FloatingButton.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Parent = FloatingButton
ToggleBtn.BackgroundColor3 = Color3.fromRGB(25, 118, 210)
ToggleBtn.BackgroundTransparency = 0.2
ToggleBtn.BorderSizePixel = 0
ToggleBtn.Position = UDim2.new(0.02, 0, 0.5, 0)
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.Text = "⚡"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 24
ToggleBtn.Draggable = true

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = ToggleBtn

UIPadding.Parent = ToggleBtn

-- Button glow effect
local Glow = Instance.new("ImageLabel")
Glow.Name = "Glow"
Glow.Parent = ToggleBtn
Glow.BackgroundTransparency = 1
Glow.Size = UDim2.new(1, 0, 1, 0)
Glow.Image = "rbxassetid://4996891970"
Glow.ImageColor3 = Color3.fromRGB(25, 118, 210)
Glow.ImageTransparency = 0.8
Glow.ScaleType = Enum.ScaleType.Slice
Glow.SliceCenter = Rect.new(49, 49, 450, 450)

-- Toggle UI function
local uiVisible = true
ToggleBtn.MouseButton1Click:Connect(function()
    uiVisible = not uiVisible
    v15:Toggle(uiVisible)
    
    -- Button animation
    local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    if uiVisible then
        ToggleBtn.Text = "⚡"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(25, 118, 210)
        Glow.ImageColor3 = Color3.fromRGB(25, 118, 210)
        
        local tween = tweenService:Create(ToggleBtn, tweenInfo, {
            Size = UDim2.new(0, 50, 0, 50),
            BackgroundTransparency = 0.2
        })
        tween:Play()
    else
        ToggleBtn.Text = "▶"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(76, 175, 80)
        Glow.ImageColor3 = Color3.fromRGB(76, 175, 80)
        
        local tween = tweenService:Create(ToggleBtn, tweenInfo, {
            Size = UDim2.new(0, 40, 0, 40),
            BackgroundTransparency = 0.4
        })
        tween:Play()
    end
end)

-- Hover effects
ToggleBtn.MouseEnter:Connect(function()
    local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    local tween = tweenService:Create(ToggleBtn, tweenInfo, {
        BackgroundTransparency = 0.1,
        Size = UDim2.new(0, 55, 0, 55)
    })
    tween:Play()
end)

ToggleBtn.MouseLeave:Connect(function()
    local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    local size = uiVisible and UDim2.new(0, 50, 0, 50) or UDim2.new(0, 40, 0, 40)
    local transparency = uiVisible and 0.2 or 0.4
    
    local tween = tweenService:Create(ToggleBtn, tweenInfo, {
        BackgroundTransparency = transparency,
        Size = size
    })
    tween:Play()
end)

-- 🔄 AUTO FARM LOGIC
-- (Copy các function CheckLevel, Tween, AttackNoCoolDown, EquipTool, AutoHaki từ script gốc ở đây)
-- Giữ nguyên toàn bộ logic auto farm từ script cũ

-- Placeholder cho các function quan trọng
function CheckLevel()
    -- Copy từ script gốc
end

function Tween(v211)
    -- Copy từ script gốc
end

function AttackNoCoolDown()
    -- Copy từ script gốc
end

function EquipTool(v217)
    -- Copy từ script gốc
end

function AutoHaki()
    -- Copy từ script gốc
end

-- 🎯 Update target display
spawn(function()
    while wait(0.5) do
        pcall(function()
            if _G.AutoLevel then
                CheckLevel()
                TargetDisplay:SetDesc("Đang farm: " .. (Ms or "None"))
            else
                TargetDisplay:SetDesc("Đang tắt")
            end
        end)
    end
end)

-- 📱 NOTIFICATION khi bật/tắt auto farm
local originalToggle = AutoFarmToggle.SetValue
AutoFarmToggle.SetValue = function(self, value)
    originalToggle(self, value)
    
    if value then
        v15:Notify({
            Title = "🚀 Auto Farm Started",
            Content = "Đã bắt đầu farm tự động",
            Duration = 3
        })
    else
        v15:Notify({
            Title = "⏹️ Auto Farm Stopped",
            Content = "Đã dừng farm tự động",
            Duration = 3
        })
    end
end

-- 🎵 Initial notification
task.wait(1)
v15:Notify({
    Title = "🎮 Auto Farm Hub",
    Content = "Menu được điều khiển bởi nút nổi bên trái",
    Duration = 5
})