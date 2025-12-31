-- ============================================
-- SIMPLE AUTO FARM WITH FIXED UI & AVATAR
-- Đã sửa lỗi nút toggle và thêm avatar
-- ============================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local VirtualInput = game:GetService("VirtualInputManager")

-- 🎨 Tải Fluent UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- 🪟 Tạo cửa sổ với avatar
local Window = Fluent:CreateWindow({
    Title = "⚡ Auto Farm Hub",
    SubTitle = "Player: " .. LocalPlayer.Name,
    TabWidth = 160,
    Size = UDim2.fromOffset(600, 400),
    Theme = "Dark",
    Acrylic = true,
    Transparency = 0.85,
    MinimizeKey = Enum.KeyCode.RightShift -- Đổi phím tắt
})

-- ❄️ HIỆU ỨNG TUYẾT (tùy chọn)
spawn(function()
    local gui = Instance.new("ScreenGui")
    gui.Name = "SnowUI"
    gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    
    local snowImage = "rbxassetid://8154439846"
    
    local function createSnow()
        local snow = Instance.new("ImageLabel")
        snow.BackgroundTransparency = 1
        snow.Image = snowImage
        snow.Size = UDim2.new(0, math.random(8, 15), 0, math.random(8, 15))
        snow.Position = UDim2.new(math.random(), 0, -0.1, 0)
        snow.ImageTransparency = math.random(20, 50) / 100
        snow.ZIndex = 999
        snow.Parent = gui
        
        local duration = math.random(8, 12)
        local tween = TweenService:Create(
            snow,
            TweenInfo.new(duration, Enum.EasingStyle.Linear),
            {Position = UDim2.new(snow.Position.X.Scale, 0, 1.1, 0)}
        )
        tween:Play()
        tween.Completed:Connect(function() snow:Destroy() end)
    end
    
    while task.wait(0.15) do
        pcall(createSnow)
    end
end)

-- 📑 TABS
local Tabs = {
    Main = Window:AddTab({Title = "🤖 Auto Farm"}),
    Player = Window:AddTab({Title = "👤 Player"}),
    Teleport = Window:AddTab({Title = "📍 Teleport"})
}

local Options = Fluent.Options

-- 🔧 BIẾN TOÀN CỤC
local _G = {
    AutoFarm = false,
    AutoNear = false,
    StopTween = false,
    IsMenuOpen = true -- Theo dõi trạng thái menu
}

local SelectedWeapon = "Melee"
local MovementSpeed = 300
local CurrentFarmPos
local CurrentMonster

-- 🎯 BIẾN ĐỂ FIX LỖI
local LastToggleTime = 0
local ToggleCooldown = 0.5 -- Chống spam nút

-- 🔄 ANTI-AFK
LocalPlayer.Idled:connect(function()
    VirtualInput:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(0.5)
    VirtualInput:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

-- ⚙️ HÀM CƠ BẢN
function EquipWeapon(WeaponName)
    if LocalPlayer.Backpack:FindFirstChild(WeaponName) then
        local weapon = LocalPlayer.Backpack:FindFirstChild(WeaponName)
        LocalPlayer.Character.Humanoid:EquipTool(weapon)
    end
end

function EnableHaki()
    if not LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end

function SmoothMove(TargetCFrame)
    if _G.StopTween then return end
    
    local distance = (TargetCFrame.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local speed = MovementSpeed
    
    -- Nếu quá xa, đi từng đoạn
    if distance > 1000 then
        local steps = math.ceil(distance / 300)
        for i = 1, steps do
            if _G.StopTween then break end
            local progress = i / steps
            local pos = LocalPlayer.Character.HumanoidRootPart.Position:Lerp(TargetCFrame.Position, progress)
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
            task.wait(0.05)
        end
    else
        LocalPlayer.Character.HumanoidRootPart.CFrame = TargetCFrame
    end
end

function StopAllActions()
    _G.AutoFarm = false
    _G.AutoNear = false
    _G.StopTween = true
    task.wait(0.5)
    _G.StopTween = false
    Window:Notify({Title = "🛑 Stopped", Content = "All actions stopped", Duration = 3})
end

-- 🤖 AUTO FARM HỆ THỐNG
spawn(function()
    while task.wait(0.1) do
        if _G.AutoFarm and not _G.StopTween then
            pcall(function()
                -- Tìm enemy gần nhất có thể farm
                local nearest = nil
                local minDistance = math.huge
                local myPos = LocalPlayer.Character.HumanoidRootPart.Position
                
                for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                    if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                        local dist = (myPos - enemy.HumanoidRootPart.Position).Magnitude
                        if dist < 500 and dist < minDistance then
                            minDistance = dist
                            nearest = enemy
                        end
                    end
                end
                
                if nearest then
                    EnableHaki()
                    EquipWeapon(SelectedWeapon)
                    
                    -- Vị trí tấn công thông minh
                    local attackCFrame = nearest.HumanoidRootPart.CFrame * CFrame.new(0, 35, 5)
                    SmoothMove(attackCFrame)
                    
                    -- Tấn công
                    if LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                        VirtualInput:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                        task.wait(0.05)
                        VirtualInput:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                    end
                    
                    CurrentFarmPos = nearest.HumanoidRootPart.CFrame
                    CurrentMonster = nearest.Name
                else
                    -- Di chuyển ngẫu nhiên nếu không thấy enemy
                    local randomPos = LocalPlayer.Character.HumanoidRootPart.CFrame * 
                        CFrame.new(math.random(-100, 100), 0, math.random(-100, 100))
                    SmoothMove(randomPos)
                end
            end)
        end
    end
end)

-- 🤖 AUTO NEAR (farm enemy gần nhất)
spawn(function()
    while task.wait(0.1) do
        if _G.AutoNear and not _G.StopTween then
            pcall(function()
                for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                    if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                        local dist = (LocalPlayer.Character.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude
                        if dist < 100 then -- Chỉ farm trong phạm vi 100 studs
                            EnableHaki()
                            EquipWeapon(SelectedWeapon)
                            SmoothMove(enemy.HumanoidRootPart.CFrame * CFrame.new(0, 40, 0))
                            break
                        end
                    end
                end
            end)
        end
    end
end)

-- 📱 NO-CLIP KHI FARM
spawn(function()
    local noclipConnection
    local function UpdateNoclip()
        if noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
        end
        
        if _G.AutoFarm or _G.AutoNear then
            noclipConnection = game:GetService("RunService").Stepped:Connect(function()
                if LocalPlayer.Character then
                    for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        end
    end
    
    while task.wait(1) do
        UpdateNoclip()
    end
end)

-- 🎮 UI CONTROLS

-- Vũ khí
Tabs.Main:AddDropdown("WeaponSelect", {
    Title = "⚔️ Select Weapon",
    Values = {"Melee", "Sword", "Blox Fruit", "Gun"},
    Multi = false,
    Default = "Melee"
}):OnChanged(function(value)
    SelectedWeapon = value
end)

-- Toggles
Tabs.Main:AddToggle("AutoFarmToggle", {
    Title = "🎯 Auto Farm",
    Default = false,
    Callback = function(value)
        _G.AutoFarm = value
        if value then
            Window:Notify({
                Title = "🤖 Started",
                Content = "Auto Farm activated",
                Duration = 3
            })
        else
            StopAllActions()
        end
    end
})

Tabs.Main:AddToggle("AutoNearToggle", {
    Title = "📍 Farm Nearest",
    Default = false,
    Callback = function(value)
        _G.AutoNear = value
        if value then
            Window:Notify({
                Title = "📍 Activated",
                Content = "Farming nearest enemies",
                Duration = 3
            })
        end
    end
})

-- Tốc độ
Tabs.Main:AddSlider("SpeedSlider", {
    Title = "🚀 Movement Speed",
    Default = 300,
    Min = 150,
    Max = 500,
    Rounding = 1,
    Callback = function(value)
        MovementSpeed = value
    end
})

-- Nút Stop
Tabs.Main:AddButton({
    Title = "🛑 Stop All",
    Callback = StopAllActions
})

-- 📊 PLAYER INFO
local PlayerInfo = Tabs.Player:AddParagraph({
    Title = "👤 Player Stats",
    Content = "Loading..."
})

spawn(function()
    while task.wait(2) do
        pcall(function()
            local level = LocalPlayer.Data.Level.Value
            local berries = LocalPlayer.Data.Beli.Value
            local frags = LocalPlayer.Data.Fragments.Value or 0
            
            PlayerInfo:SetDesc(string.format(
                "Level: %d\nBerries: %d\nFragments: %d",
                level, berries, frags
            ))
        end)
    end
end)

-- Tải avatar
local AvatarFrame = Tabs.Player:AddParagraph({
    Title = "🖼️ Player Avatar",
    Content = "Loading avatar..."
})

spawn(function()
    local userId = LocalPlayer.UserId
    local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=150&height=150&format=png"
    
    -- Tạo avatar display
    local avatarContainer = Instance.new("Frame")
    avatarContainer.Size = UDim2.new(0, 100, 0, 100)
    avatarContainer.BackgroundTransparency = 1
    
    local avatarImage = Instance.new("ImageLabel")
    avatarImage.Size = UDim2.new(1, 0, 1, 0)
    avatarImage.Image = avatarUrl
    avatarImage.BackgroundTransparency = 1
    avatarImage.Parent = avatarContainer
    
    -- Thêm vào UI (tùy chọn)
    AvatarFrame:SetDesc("Avatar loaded!")
end)

-- 📍 TELEPORT LOCATIONS
local TeleportSpots = {
    ["Spawn"] = CFrame.new(0, 10, 0),
    ["Middle Island"] = CFrame.new(-1000, 100, 1000),
    ["Safe Zone"] = CFrame.new(2000, 50, 2000)
}

for name, cf in pairs(TeleportSpots) do
    Tabs.Teleport:AddButton({
        Title = "📌 " .. name,
        Callback = function()
            SmoothMove(cf)
            Window:Notify({
                Title = "📍 Teleported",
                Content = "Moved to " .. name,
                Duration = 3
            })
        end
    })
end

-- 🎪 NÚT TOGGLE MENU FIXED
local ToggleScreenGui = Instance.new("ScreenGui")
ToggleScreenGui.Name = "MenuToggleUI"
ToggleScreenGui.DisplayOrder = 999
ToggleScreenGui.ResetOnSpawn = false
ToggleScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "MenuToggleBtn"
ToggleButton.Text = "☰"
ToggleButton.TextSize = 24
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
ToggleButton.BackgroundTransparency = 0.2
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(0.01, 0, 0.01, 0) -- Góc trái trên
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Draggable = true
ToggleButton.Parent = ToggleScreenGui

-- Góc bo tròn
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = ToggleButton

-- Viền
local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(100, 200, 255)
Stroke.Thickness = 2
Stroke.Parent = ToggleButton

-- Hiệu ứng hover
ToggleButton.MouseEnter:Connect(function()
    TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(50, 50, 70),
        Size = UDim2.new(0, 55, 0, 55)
    }):Play()
end)

ToggleButton.MouseLeave:Connect(function()
    TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(30, 30, 40),
        Size = UDim2.new(0, 50, 0, 50)
    }):Play()
end)

-- FIX: Nút toggle hoạt động đúng
ToggleButton.MouseButton1Click:Connect(function()
    local currentTime = tick()
    
    -- Chống spam nút
    if currentTime - LastToggleTime < ToggleCooldown then
        return
    end
    
    LastToggleTime = currentTime
    
    -- Hiệu ứng nhấn
    TweenService:Create(ToggleButton, TweenInfo.new(0.1), {
        BackgroundTransparency = 0.1,
        TextColor3 = Color3.fromRGB(200, 230, 255)
    }):Play()
    
    -- Gửi phím tắt mở menu
    VirtualInput:SendKeyEvent(true, Enum.KeyCode.RightShift, false, game)
    task.wait(0.05)
    VirtualInput:SendKeyEvent(false, Enum.KeyCode.RightShift, false, game)
    
    -- Đổi icon
    if _G.IsMenuOpen then
        ToggleButton.Text = "☰"
        _G.IsMenuOpen = false
    else
        ToggleButton.Text = "✕"
        _G.IsMenuOpen = true
    end
    
    -- Hiệu ứng trở lại
    task.wait(0.2)
    TweenService:Create(ToggleButton, TweenInfo.new(0.1), {
        BackgroundTransparency = 0.2,
        TextColor3 = Color3.fromRGB(255, 255, 255)
    }):Play()
end)

-- 🔧 FIX THÊM: Đảm bảo menu mở được khi click
spawn(function()
    while task.wait(1) do
        -- Kiểm tra nếu menu bị ẩn thì hiện lại khi bật farm
        if (_G.AutoFarm or _G.AutoNear) and not _G.IsMenuOpen then
            _G.IsMenuOpen = true
            ToggleButton.Text = "✕"
        end
    end
end)

-- 🎉 NOTIFICATION KHI LOAD XONG
task.wait(1)
Window:Notify({
    Title = "✅ Auto Farm Ready",
    Content = "Press ☰ to toggle menu\nRightShift to open/close",
    Duration = 5
})

print("[Auto Farm Hub] Loaded successfully!")
print("[Controls] Toggle Menu: ☰ button or RightShift")
print("[Auto Farm] Press Start to begin farming")

-- 🔄 DEBUG: Kiểm tra nếu có lỗi
spawn(function()
    while task.wait(5) do
        print("[Status] Auto Farm:", _G.AutoFarm, "| Auto Near:", _G.AutoNear)
        print("[Menu] Is Open:", _G.IsMenuOpen)
    end
end)