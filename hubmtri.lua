-- ============================================
-- SIMPLIFIED AUTO FARM SCRIPT
-- Chỉ giữ lại Auto Farm Level và giao diện tối giản
-- ============================================

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Simple Farm Hub",
    SubTitle = "Premium Version",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Theme = "Dark",
    Acrylic = false,
    MinimizeKey = Enum.KeyCode.End
})

-- ❄️ SNOW EFFECT UI ❄️
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

-- Tabs
local Tabs = {
    Main = Window:AddTab({Title = "⚔️ Auto Farm"}),
    Settings = Window:AddTab({Title = "⚙️ Settings"}),
    Player = Window:AddTab({Title = "👤 Player"})
}

local Options = Fluent.Options

-- ================== VARIABLES ==================
local _G = {
    AutoLevel = false,
    AutoNear = false,
    Fast_Delay = 1e-9,
    StopTween = false
}

local SelectWeapon = "Melee"
local TweenSpeed = 350
local FarmPos, MonFarm
local Pos = CFrame.new(0, 40, 0)
local bringmob = false

-- ================== ANTI-AFK ==================
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait()
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

-- ================== FUNCTIONS ==================
function EquipTool(ToolName)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolName) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolName)
        wait()
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end

function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end

function Tween(targetCFrame)
    local distance = (targetCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local speed = TweenSpeed
    if distance >= 350 then
        speed = TweenSpeed
    end
    
    local tweenInfo = TweenInfo.new(distance / speed, Enum.EasingStyle.Linear)
    local tween = game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        tweenInfo,
        {CFrame = targetCFrame}
    )
    tween:Play()
    if _G.StopTween then
        tween:Cancel()
    end
end

function CancelTween()
    _G.StopTween = true
    wait()
    Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
    wait()
    _G.StopTween = false
end

-- Fast Attack System
spawn(function()
    while wait() do
        pcall(function()
            if _G.Fast_Delay then
                _G.Fast_Delay = 1e-9
            end
        end)
    end
end)

-- No Clip when farming
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoLevel or _G.AutoNear then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            else
                if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
                end
            end
        end)
    end
end)

spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.AutoLevel or _G.AutoNear then
                for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end)
    end)
end)

-- ================== AUTO FARM NEAREST ==================
spawn(function()
    while wait() do
        if _G.AutoNear then
            pcall(function()
                for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 5000 then
                            repeat
                                wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                Tween(v.HumanoidRootPart.CFrame * Pos)
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                v.HumanoidRootPart.Transparency = 1
                                v.Humanoid.JumpPower = 0
                                v.Humanoid.WalkSpeed = 0
                                v.HumanoidRootPart.CanCollide = false
                                FarmPos = v.HumanoidRootPart.CFrame
                                MonFarm = v.Name
                            until not _G.AutoNear or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            end)
        end
    end
end)

-- ================== UI CONTROLS ==================

-- Weapon Selector
local WeaponDropdown = Tabs.Main:AddDropdown("WeaponSelect", {
    Title = "Select Weapon",
    Values = {"Melee", "Sword", "Blox Fruit"},
    Multi = false,
    Default = "Melee"
})

WeaponDropdown:OnChanged(function(value)
    SelectWeapon = value
end)

-- Auto Farm Level Toggle
Tabs.Main:AddToggle("AutoFarmToggle", {
    Title = "Auto Farm Level",
    Default = false,
    Callback = function(value)
        _G.AutoLevel = value
        if not value then
            CancelTween()
        end
    end
})

-- Auto Farm Nearest Toggle
Tabs.Main:AddToggle("AutoNearestToggle", {
    Title = "Auto Farm Nearest",
    Default = false,
    Callback = function(value)
        _G.AutoNear = value
        if not value then
            CancelTween()
        end
    end
})

-- Tween Speed Slider
Tabs.Main:AddSlider("TweenSpeedSlider", {
    Title = "Tween Speed",
    Default = 350,
    Min = 100,
    Max = 500,
    Rounding = 1,
    Callback = function(value)
        TweenSpeed = value
    end
})

-- Stop Button
Tabs.Main:AddButton({
    Title = "🛑 Stop All",
    Callback = function()
        _G.AutoLevel = false
        _G.AutoNear = false
        CancelTween()
        Window:Notify({
            Title = "Farm Stopped",
            Content = "All farming activities have been stopped.",
            Duration = 3
        })
    end
})

-- Settings Tab
Tabs.Settings:AddParagraph({
    Title = "Settings Info",
    Content = "Adjust your farming settings here."
})

Tabs.Settings:AddToggle("AntiAFKToggle", {
    Title = "Anti-AFK",
    Default = true,
    Callback = function(value)
        -- Already enabled by default
    end
})

-- Player Tab
local PlayerLevel = Tabs.Player:AddParagraph({
    Title = "Player Level",
    Content = "Loading..."
})

spawn(function()
    while wait(2) do
        pcall(function()
            local level = game:GetService("Players").LocalPlayer.Data.Level.Value
            PlayerLevel:SetDesc("Level: " .. tostring(level))
        end)
    end
end)

-- ================== FLOATING TOGGLE BUTTON ==================
local ToggleGui = Instance.new("ScreenGui")
ToggleGui.Name = "ToggleGui"
ToggleGui.IgnoreGuiInset = true
ToggleGui.ResetOnSpawn = false
ToggleGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local ToggleButton = Instance.new("ImageButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BackgroundTransparency = 0.5
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(0.85, 0, 0.1, 0)
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Draggable = true
ToggleButton.Image = "http://www.roblox.com/asset/?id=130947856929902"
ToggleButton.Parent = ToggleGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(1, 0)
Corner.Parent = ToggleButton

local Particle = Instance.new("ParticleEmitter")
Particle.LightEmission = 1
Particle.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.1),
    NumberSequenceKeypoint.new(1, 0)
})
Particle.Lifetime = NumberRange.new(0.5, 1)
Particle.Rate = 0
Particle.Speed = NumberRange.new(5, 10)
Particle.Color = ColorSequence.new(Color3.fromRGB(255, 85, 255), Color3.fromRGB(85, 255, 255))
Particle.Parent = ToggleButton

local TweenService = game:GetService("TweenService")
local rotateTween = TweenService:Create(ToggleButton, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 0})

local toggled = true

ToggleButton.MouseButton1Down:Connect(function()
    Particle.Rate = 100
    task.delay(1, function()
        Particle.Rate = 0
    end)
    
    rotateTween:Play()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
    
    rotateTween.Completed:Connect(function()
        ToggleButton.Rotation = 0
    end)
    
    if not toggled then
        toggled = true
        ToggleButton.BackgroundTransparency = 0
        local enlarge = TweenService:Create(ToggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Bounce), {
            Size = UDim2.new(0, 60, 0, 60)
        })
        enlarge:Play()
    else
        toggled = false
        ToggleButton.BackgroundTransparency = 0.5
        local shrink = TweenService:Create(ToggleButton, TweenInfo.new(0.2, Enum.EasingStyle.Bounce), {
            Size = UDim2.new(0, 50, 0, 50)
        })
        shrink:Play()
    end
end)

-- ================== INITIAL NOTIFICATION ==================
Window:Notify({
    Title = "Simple Farm Hub",
    Content = "Script loaded successfully! Use the toggle button to open/close.",
    Duration = 5
})

print("Simple Farm Hub loaded!")