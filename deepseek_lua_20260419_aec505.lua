--[[ 
    🌟 TML HUB LITE - BLOX FRUITS 🌟
    Phiên bản nhẹ, tránh crash
]]

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")

-- Anti AFK
LP.Idled:connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
    wait()
    VirtualUser:Button2Up(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
end)

-- Xác định Sea
local Sea1 = game.PlaceId == 2753915549
local Sea2 = game.PlaceId == 4442272183
local Sea3 = game.PlaceId == 7449423635
if not (Sea1 or Sea2 or Sea3) then game:Shutdown() end

-- Tạo cửa sổ
local Window = Fluent:CreateWindow({
    Title = "🌟 TML HUB LITE",
    SubTitle = "Blox Fruits",
    TabWidth = 160,
    Theme = "Amber",
    Acrylic = true,
    Size = UDim2.fromOffset(500, 400),
    MinimizeKey = Enum.KeyCode.End
})

-- Biến toàn cục
_G.AutoLevel = false
_G.AutoHaki = true
_G.BringMob = false
_G.WalkSpeed = 16
_G.JumpPower = 50

-- Hàm hỗ trợ
function Tween(cf)
    if not LP.Character or not LP.Character:FindFirstChild("HumanoidRootPart") then return end
    local dist = (cf.Position - LP.Character.HumanoidRootPart.Position).Magnitude
    local speed = 350
    local tween = TweenService:Create(LP.Character.HumanoidRootPart, TweenInfo.new(dist/speed, Enum.EasingStyle.Linear), {CFrame = cf})
    tween:Play()
end

function AutoHaki()
    if _G.AutoHaki and not LP.Character:FindFirstChild("HasBuso") then
        ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso")
    end
end

function Attack()
    pcall(function()
        local attack = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")
        local hit = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")
        attack:FireServer(1e-9)
        hit:FireServer(LP.Character.Head, {})
    end)
end

function EquipTool(name)
    if LP.Backpack:FindFirstChild(name) then
        LP.Character.Humanoid:EquipTool(LP.Backpack[name])
    end
end

-- Hàm lấy quest theo level (rút gọn, tránh lỗi)
function GetQuestByLevel()
    local lvl = LP.Data.Level.Value
    local data = {}
    
    if Sea1 then
        if lvl <= 9 then data = {Mon="Bandit", Quest="BanditQuest1", Lv=1, QCF=CFrame.new(1060.93,16.45,1547.78), MCF=CFrame.new(1038.55,41.29,1576.50)}
        elseif lvl <= 14 then data = {Mon="Monkey", Quest="JungleQuest", Lv=1, QCF=CFrame.new(-1601.65,36.85,153.38), MCF=CFrame.new(-1448.14,50.85,63.60)}
        elseif lvl <= 29 then data = {Mon="Gorilla", Quest="JungleQuest", Lv=2, QCF=CFrame.new(-1601.65,36.85,153.38), MCF=CFrame.new(-1142.64,40.46,-515.39)}
        elseif lvl <= 39 then data = {Mon="Pirate", Quest="BuggyQuest1", Lv=1, QCF=CFrame.new(-1140.17,4.75,3827.40), MCF=CFrame.new(-1201.08,40.62,3857.59)}
        elseif lvl <= 59 then data = {Mon="Brute", Quest="BuggyQuest1", Lv=2, QCF=CFrame.new(-1140.17,4.75,3827.40), MCF=CFrame.new(-1387.53,24.59,4100.95)}
        elseif lvl <= 74 then data = {Mon="Desert Bandit", Quest="DesertQuest", Lv=1, QCF=CFrame.new(896.51,6.43,4390.14), MCF=CFrame.new(984.99,16.10,4417.91)}
        elseif lvl <= 89 then data = {Mon="Desert Officer", Quest="DesertQuest", Lv=2, QCF=CFrame.new(896.51,6.43,4390.14), MCF=CFrame.new(1547.15,14.45,4381.80)}
        elseif lvl <= 99 then data = {Mon="Snow Bandit", Quest="SnowQuest", Lv=1, QCF=CFrame.new(1386.80,87.27,-1298.35), MCF=CFrame.new(1356.30,105.76,-1328.24)}
        elseif lvl <= 119 then data = {Mon="Snowman", Quest="SnowQuest", Lv=2, QCF=CFrame.new(1386.80,87.27,-1298.35), MCF=CFrame.new(1218.79,138.01,-1488.02)}
        elseif lvl <= 149 then data = {Mon="Chief Petty Officer", Quest="MarineQuest2", Lv=1, QCF=CFrame.new(-5035.49,28.67,4324.18), MCF=CFrame.new(-4931.15,65.79,4121.83)}
        elseif lvl <= 174 then data = {Mon="Sky Bandit", Quest="SkyQuest", Lv=1, QCF=CFrame.new(-4842.13,717.69,-2623.04), MCF=CFrame.new(-4955.64,365.46,-2908.18)}
        elseif lvl <= 189 then data = {Mon="Dark Master", Quest="SkyQuest", Lv=2, QCF=CFrame.new(-4842.13,717.69,-2623.04), MCF=CFrame.new(-5148.16,439.04,-2332.96)}
        elseif lvl <= 209 then data = {Mon="Prisoner", Quest="PrisonerQuest", Lv=1, QCF=CFrame.new(5310.60,0.35,474.94), MCF=CFrame.new(4937.31,0.33,649.57)}
        elseif lvl <= 249 then data = {Mon="Dangerous Prisoner", Quest="PrisonerQuest", Lv=2, QCF=CFrame.new(5310.60,0.35,474.94), MCF=CFrame.new(5099.66,0.35,1055.75)}
        elseif lvl <= 274 then data = {Mon="Toga Warrior", Quest="ColosseumQuest", Lv=1, QCF=CFrame.new(-1577.78,7.41,-2984.48), MCF=CFrame.new(-1872.51,49.08,-2913.81)}
        elseif lvl <= 299 then data = {Mon="Gladiator", Quest="ColosseumQuest", Lv=2, QCF=CFrame.new(-1577.78,7.41,-2984.48), MCF=CFrame.new(-1521.37,81.20,-3066.31)}
        elseif lvl <= 324 then data = {Mon="Military Soldier", Quest="MagmaQuest", Lv=1, QCF=CFrame.new(-5316.11,12.26,8517.00), MCF=CFrame.new(-5369.00,61.24,8556.49)}
        elseif lvl <= 374 then data = {Mon="Military Spy", Quest="MagmaQuest", Lv=2, QCF=CFrame.new(-5316.11,12.26,8517.00), MCF=CFrame.new(-5787.00,75.82,8651.69)}
        elseif lvl <= 399 then data = {Mon="Fishman Warrior", Quest="FishmanQuest", Lv=1, QCF=CFrame.new(61122.65,18.49,1569.39), MCF=CFrame.new(60844.10,98.46,1298.39)}
        elseif lvl <= 449 then data = {Mon="Fishman Commando", Quest="FishmanQuest", Lv=2, QCF=CFrame.new(61122.65,18.49,1569.39), MCF=CFrame.new(61738.39,64.20,1433.83)}
        elseif lvl <= 474 then data = {Mon="God's Guard", Quest="SkyExp1Quest", Lv=1, QCF=CFrame.new(-4721.86,845.30,-1953.84), MCF=CFrame.new(-4628.04,866.92,-1931.23)}
        elseif lvl <= 524 then data = {Mon="Shanda", Quest="SkyExp1Quest", Lv=2, QCF=CFrame.new(-7863.15,5545.51,-378.42), MCF=CFrame.new(-7685.14,5601.07,-441.38)}
        elseif lvl <= 549 then data = {Mon="Royal Squad", Quest="SkyExp2Quest", Lv=1, QCF=CFrame.new(-7903.38,5635.98,-1410.92), MCF=CFrame.new(-7654.25,5637.10,-1407.75)}
        elseif lvl <= 624 then data = {Mon="Royal Soldier", Quest="SkyExp2Quest", Lv=2, QCF=CFrame.new(-7903.38,5635.98,-1410.92), MCF=CFrame.new(-7760.41,5679.90,-1884.81)}
        elseif lvl <= 649 then data = {Mon="Galley Pirate", Quest="FountainQuest", Lv=1, QCF=CFrame.new(5258.27,38.52,4050.04), MCF=CFrame.new(5557.16,152.32,3998.77)}
        elseif lvl >= 650 then data = {Mon="Galley Captain", Quest="FountainQuest", Lv=2, QCF=CFrame.new(5258.27,38.52,4050.04), MCF=CFrame.new(5677.67,92.78,4966.63)}
        end
    elseif Sea2 then
        if lvl <= 724 then data = {Mon="Raider", Quest="Area1Quest", Lv=1, QCF=CFrame.new(-427.72,72.99,1835.94), MCF=CFrame.new(68.87,93.63,2429.67)}
        elseif lvl <= 774 then data = {Mon="Mercenary", Quest="Area1Quest", Lv=2, QCF=CFrame.new(-427.72,72.99,1835.94), MCF=CFrame.new(-864.85,122.47,1453.15)}
        elseif lvl <= 799 then data = {Mon="Swan Pirate", Quest="Area2Quest", Lv=1, QCF=CFrame.new(635.61,73.09,917.81), MCF=CFrame.new(1065.36,137.64,1324.37)}
        elseif lvl <= 874 then data = {Mon="Factory Staff", Quest="Area2Quest", Lv=2, QCF=CFrame.new(635.61,73.09,917.81), MCF=CFrame.new(533.22,128.46,355.62)}
        elseif lvl <= 899 then data = {Mon="Marine Lieutenant", Quest="MarineQuest3", Lv=1, QCF=CFrame.new(-2440.99,73.04,-3217.70), MCF=CFrame.new(-2489.26,84.61,-3151.88)}
        elseif lvl <= 949 then data = {Mon="Marine Captain", Quest="MarineQuest3", Lv=2, QCF=CFrame.new(-2440.99,73.04,-3217.70), MCF=CFrame.new(-2335.20,79.78,-3245.86)}
        elseif lvl <= 974 then data = {Mon="Zombie", Quest="ZombieQuest", Lv=1, QCF=CFrame.new(-5494.34,48.50,-794.59), MCF=CFrame.new(-5536.49,101.08,-835.59)}
        elseif lvl <= 999 then data = {Mon="Vampire", Quest="ZombieQuest", Lv=2, QCF=CFrame.new(-5494.34,48.50,-794.59), MCF=CFrame.new(-5806.10,16.72,-1164.43)}
        elseif lvl <= 1049 then data = {Mon="Snow Trooper", Quest="SnowMountainQuest", Lv=1, QCF=CFrame.new(607.05,401.44,-5370.55), MCF=CFrame.new(535.21,432.74,-5484.91)}
        elseif lvl <= 1099 then data = {Mon="Winter Warrior", Quest="SnowMountainQuest", Lv=2, QCF=CFrame.new(607.05,401.44,-5370.55), MCF=CFrame.new(1234.44,456.95,-5174.13)}
        elseif lvl <= 1124 then data = {Mon="Lab Subordinate", Quest="IceSideQuest", Lv=1, QCF=CFrame.new(-6061.84,15.92,-4902.03), MCF=CFrame.new(-5720.55,63.30,-4784.61)}
        elseif lvl <= 1174 then data = {Mon="Horned Warrior", Quest="IceSideQuest", Lv=2, QCF=CFrame.new(-6061.84,15.92,-4902.03), MCF=CFrame.new(-6292.75,91.18,-5502.64)}
        elseif lvl <= 1199 then data = {Mon="Magma Ninja", Quest="FireSideQuest", Lv=1, QCF=CFrame.new(-5429.04,15.97,-5297.96), MCF=CFrame.new(-5461.83,130.36,-5836.47)}
        elseif lvl <= 1249 then data = {Mon="Lava Pirate", Quest="FireSideQuest", Lv=2, QCF=CFrame.new(-5429.04,15.97,-5297.96), MCF=CFrame.new(-5251.18,55.16,-4774.40)}
        elseif lvl <= 1274 then data = {Mon="Ship Deckhand", Quest="ShipQuest1", Lv=1, QCF=CFrame.new(1040.29,125.08,32911.03), MCF=CFrame.new(921.12,125.98,33088.32)}
        elseif lvl <= 1299 then data = {Mon="Ship Engineer", Quest="ShipQuest1", Lv=2, QCF=CFrame.new(1040.29,125.08,32911.03), MCF=CFrame.new(886.28,40.47,32800.83)}
        elseif lvl <= 1324 then data = {Mon="Ship Steward", Quest="ShipQuest2", Lv=1, QCF=CFrame.new(971.42,125.08,33245.54), MCF=CFrame.new(943.85,129.58,33444.36)}
        elseif lvl <= 1349 then data = {Mon="Ship Officer", Quest="ShipQuest2", Lv=2, QCF=CFrame.new(971.42,125.08,33245.54), MCF=CFrame.new(955.38,181.08,33331.89)}
        elseif lvl <= 1374 then data = {Mon="Arctic Warrior", Quest="FrostQuest", Lv=1, QCF=CFrame.new(5668.13,28.20,-6484.60), MCF=CFrame.new(5935.45,77.26,-6472.75)}
        elseif lvl <= 1424 then data = {Mon="Snow Lurker", Quest="FrostQuest", Lv=2, QCF=CFrame.new(5668.13,28.20,-6484.60), MCF=CFrame.new(5628.48,57.57,-6618.34)}
        elseif lvl <= 1449 then data = {Mon="Sea Soldier", Quest="ForgottenQuest", Lv=1, QCF=CFrame.new(-3054.58,236.87,-10147.79), MCF=CFrame.new(-3185.01,58.78,-9663.60)}
        elseif lvl >= 1450 then data = {Mon="Water Fighter", Quest="ForgottenQuest", Lv=2, QCF=CFrame.new(-3054.58,236.87,-10147.79), MCF=CFrame.new(-3262.93,298.69,-10552.52)}
        end
    elseif Sea3 then
        if lvl <= 1524 then data = {Mon="Pirate Millionaire", Quest="PiratePortQuest", Lv=1, QCF=CFrame.new(-450.10,107.68,5950.72), MCF=CFrame.new(-193.99,56.12,5755.78)}
        elseif lvl <= 1574 then data = {Mon="Pistol Billionaire", Quest="PiratePortQuest", Lv=2, QCF=CFrame.new(-450.10,107.68,5950.72), MCF=CFrame.new(-188.14,84.49,6337.04)}
        elseif lvl <= 1599 then data = {Mon="Dragon Crew Warrior", Quest="DragonCrewQuest", Lv=1, QCF=CFrame.new(6735.11,126.99,-711.09), MCF=CFrame.new(6615.23,50.84,-978.93)}
        elseif lvl <= 1624 then data = {Mon="Dragon Crew Archer", Quest="DragonCrewQuest", Lv=2, QCF=CFrame.new(6735.11,126.99,-711.09), MCF=CFrame.new(6818.58,483.71,512.72)}
        elseif lvl <= 1649 then data = {Mon="Hydra Enforcer", Quest="VenomCrewQuest", Lv=1, QCF=CFrame.new(5446.87,601.62,749.45), MCF=CFrame.new(4547.11,1001.60,334.19)}
        elseif lvl <= 1699 then data = {Mon="Venomous Assailant", Quest="VenomCrewQuest", Lv=2, QCF=CFrame.new(5446.87,601.62,749.45), MCF=CFrame.new(4637.88,1077.85,882.41)}
        elseif lvl <= 1724 then data = {Mon="Marine Commodore", Quest="MarineTreeIsland", Lv=1, QCF=CFrame.new(2179.98,28.73,-6740.05), MCF=CFrame.new(2198.00,128.71,-7109.50)}
        elseif lvl <= 1774 then data = {Mon="Marine Rear Admiral", Quest="MarineTreeIsland", Lv=2, QCF=CFrame.new(2179.98,28.73,-6740.05), MCF=CFrame.new(3294.31,385.41,-7048.63)}
        elseif lvl <= 1799 then data = {Mon="Fishman Raider", Quest="DeepForestIsland3", Lv=1, QCF=CFrame.new(-10582.75,331.78,-8757.66), MCF=CFrame.new(-10553.26,521.38,-8176.94)}
        elseif lvl <= 1824 then data = {Mon="Fishman Captain", Quest="DeepForestIsland3", Lv=2, QCF=CFrame.new(-10583.09,331.78,-8759.46), MCF=CFrame.new(-10789.40,427.18,-9131.44)}
        elseif lvl <= 1849 then data = {Mon="Forest Pirate", Quest="DeepForestIsland", Lv=1, QCF=CFrame.new(-13232.66,332.40,-7626.48), MCF=CFrame.new(-13489.39,400.30,-7770.25)}
        elseif lvl <= 1899 then data = {Mon="Mythological Pirate", Quest="DeepForestIsland", Lv=2, QCF=CFrame.new(-13232.66,332.40,-7626.48), MCF=CFrame.new(-13508.61,582.46,-6985.30)}
        elseif lvl <= 1924 then data = {Mon="Jungle Pirate", Quest="DeepForestIsland2", Lv=1, QCF=CFrame.new(-12682.09,390.88,-9902.12), MCF=CFrame.new(-12267.10,459.75,-10277.20)}
        elseif lvl <= 1974 then data = {Mon="Musketeer Pirate", Quest="DeepForestIsland2", Lv=2, QCF=CFrame.new(-12682.09,390.88,-9902.12), MCF=CFrame.new(-13291.50,520.47,-9904.63)}
        elseif lvl <= 1999 then data = {Mon="Reborn Skeleton", Quest="HauntedQuest1", Lv=1, QCF=CFrame.new(-9480.80,142.13,5566.37), MCF=CFrame.new(-8761.77,183.43,6168.33)}
        elseif lvl <= 2024 then data = {Mon="Living Zombie", Quest="HauntedQuest1", Lv=2, QCF=CFrame.new(-9480.80,142.13,5566.37), MCF=CFrame.new(-10103.75,238.56,6179.75)}
        elseif lvl <= 2049 then data = {Mon="Demonic Soul", Quest="HauntedQuest2", Lv=1, QCF=CFrame.new(-9516.99,178.00,6078.46), MCF=CFrame.new(-9712.03,204.69,6193.32)}
        elseif lvl <= 2074 then data = {Mon="Posessed Mummy", Quest="HauntedQuest2", Lv=2, QCF=CFrame.new(-9516.99,178.00,6078.46), MCF=CFrame.new(-9545.77,69.61,6339.56)}
        elseif lvl <= 2099 then data = {Mon="Peanut Scout", Quest="NutsIslandQuest", Lv=1, QCF=CFrame.new(-2105.53,37.24,-10195.50), MCF=CFrame.new(-2150.58,122.49,-10358.99)}
        elseif lvl <= 2124 then data = {Mon="Peanut President", Quest="NutsIslandQuest", Lv=2, QCF=CFrame.new(-2105.53,37.24,-10195.50), MCF=CFrame.new(-2150.58,122.49,-10358.99)}
        elseif lvl <= 2149 then data = {Mon="Ice Cream Chef", Quest="IceCreamIslandQuest", Lv=1, QCF=CFrame.new(-819.37,64.92,-10967.28), MCF=CFrame.new(-789.94,209.38,-11009.98)}
        elseif lvl <= 2199 then data = {Mon="Ice Cream Commander", Quest="IceCreamIslandQuest", Lv=2, QCF=CFrame.new(-819.37,64.92,-10967.28), MCF=CFrame.new(-789.94,209.38,-11009.98)}
        elseif lvl <= 2224 then data = {Mon="Cookie Crafter", Quest="CakeQuest1", Lv=1, QCF=CFrame.new(-2022.29,36.92,-12030.97), MCF=CFrame.new(-2321.71,36.69,-12216.78)}
        elseif lvl <= 2249 then data = {Mon="Cake Guard", Quest="CakeQuest1", Lv=2, QCF=CFrame.new(-2022.29,36.92,-12030.97), MCF=CFrame.new(-1418.11,36.67,-12255.73)}
        elseif lvl <= 2274 then data = {Mon="Baking Staff", Quest="CakeQuest2", Lv=1, QCF=CFrame.new(-1928.31,37.72,-12840.62), MCF=CFrame.new(-1980.43,36.67,-12983.84)}
        elseif lvl <= 2299 then data = {Mon="Head Baker", Quest="CakeQuest2", Lv=2, QCF=CFrame.new(-1928.31,37.72,-12840.62), MCF=CFrame.new(-2251.57,52.27,-13033.39)}
        elseif lvl <= 2324 then data = {Mon="Cocoa Warrior", Quest="ChocQuest1", Lv=1, QCF=CFrame.new(231.75,23.90,-12200.29), MCF=CFrame.new(167.97,26.22,-12238.87)}
        elseif lvl <= 2349 then data = {Mon="Chocolate Bar Battler", Quest="ChocQuest1", Lv=2, QCF=CFrame.new(231.75,23.90,-12200.29), MCF=CFrame.new(701.31,25.58,-12708.21)}
        elseif lvl <= 2374 then data = {Mon="Sweet Thief", Quest="ChocQuest2", Lv=1, QCF=CFrame.new(151.19,23.89,-12774.61), MCF=CFrame.new(-140.25,25.58,-12652.31)}
        elseif lvl <= 2400 then data = {Mon="Candy Rebel", Quest="ChocQuest2", Lv=2, QCF=CFrame.new(151.19,23.89,-12774.61), MCF=CFrame.new(47.92,25.58,-13029.24)}
        elseif lvl <= 2424 then data = {Mon="Candy Pirate", Quest="CandyQuest1", Lv=1, QCF=CFrame.new(-1149.32,13.57,-14445.61), MCF=CFrame.new(-1437.56,17.14,-14385.69)}
        elseif lvl <= 2449 then data = {Mon="Snow Demon", Quest="CandyQuest1", Lv=2, QCF=CFrame.new(-1149.32,13.57,-14445.61), MCF=CFrame.new(-916.22,17.14,-14638.81)}
        elseif lvl <= 2474 then data = {Mon="Isle Outlaw", Quest="TikiQuest1", Lv=1, QCF=CFrame.new(-16549.89,55.68,-179.91), MCF=CFrame.new(-16162.81,11.68,-96.45)}
        elseif lvl <= 2499 then data = {Mon="Island Boy", Quest="TikiQuest1", Lv=2, QCF=CFrame.new(-16549.89,55.68,-179.91), MCF=CFrame.new(-16357.31,20.63,1005.64)}
        elseif lvl <= 2524 then data = {Mon="Sun-kissed Warrior", Quest="TikiQuest2", Lv=1, QCF=CFrame.new(-16541.02,54.77,1051.46), MCF=CFrame.new(-16357.31,20.63,1005.64)}
        elseif lvl <= 2549 then data = {Mon="Isle Champion", Quest="TikiQuest2", Lv=2, QCF=CFrame.new(-16541.02,54.77,1051.46), MCF=CFrame.new(-16848.94,21.68,1041.44)}
        elseif lvl <= 2574 then data = {Mon="Serpent Hunter", Quest="TikiQuest3", Lv=1, QCF=CFrame.new(-16665.19,104.59,1579.69), MCF=CFrame.new(-16621.41,121.40,1290.68)}
        elseif lvl >= 2575 then data = {Mon="Skull Slayer", Quest="TikiQuest3", Lv=2, QCF=CFrame.new(-16665.19,104.59,1579.69), MCF=CFrame.new(-16811.57,84.62,1542.23)}
        end
    end
    return data
end

-- Pos cho tween đánh
local Pos = CFrame.new(0, 40, 0)
local Type = 1
spawn(function()
    while task.wait(0.2) do
        Type = Type % 5 + 1
        if Type == 1 then Pos = CFrame.new(0, 40, 0)
        elseif Type == 2 then Pos = CFrame.new(-40, 40, 0)
        elseif Type == 3 then Pos = CFrame.new(40, 40, 0)
        elseif Type == 4 then Pos = CFrame.new(0, 40, 40)
        elseif Type == 5 then Pos = CFrame.new(0, 40, -40)
        end
    end
end)

-- ================================
-- TAB FARMING
-- ================================
local FarmTab = Window:AddTab({ Title = "⚔️ Farming", Icon = "sword" })

FarmTab:AddToggle("AutoLevel", { Title = "🔥 Auto Farm Level", Default = false, Callback = function(v) _G.AutoLevel = v end })

FarmTab:AddToggle("AutoHaki", { Title = "💪 Auto Buso Haki", Default = true, Callback = function(v) _G.AutoHaki = v end })

FarmTab:AddToggle("BringMob", { Title = "🔄 Bring Mob (⚠️ Nguy hiểm)", Default = false, Callback = function(v) _G.BringMob = v end })

-- Auto Level Core (đã fix lỗi)
spawn(function()
    while task.wait(0.1) do
        if _G.AutoLevel then
            pcall(function()
                local quest = GetQuestByLevel()
                if not quest.Mon then return end
                
                local questGui = LP.PlayerGui.Main.Quest
                local hasQuest = questGui.Visible and string.find(questGui.Container.QuestTitle.Title.Text, quest.Mon)
                
                if not hasQuest then
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest")
                    Tween(quest.QCF)
                    if (quest.QCF.Position - LP.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", quest.Quest, quest.Lv)
                    end
                else
                    for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                        if enemy.Name == quest.Mon and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                            repeat
                                task.wait()
                                Attack()
                                AutoHaki()
                                Tween(enemy.HumanoidRootPart.CFrame * Pos)
                                if _G.BringMob then
                                    enemy.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    enemy.HumanoidRootPart.CanCollide = false
                                    enemy.Humanoid.WalkSpeed = 0
                                end
                            until not _G.AutoLevel or not enemy.Parent or enemy.Humanoid.Health <= 0
                        end
                    end
                end
            end)
        end
    end
end)

-- ================================
-- TAB SETTINGS
-- ================================
local SettingTab = Window:AddTab({ Title = "⚙️ Settings", Icon = "settings" })

SettingTab:AddSlider("WalkSpeed", { Title = "🏃 Tốc độ", Default = 16, Min = 16, Max = 300, Rounding = 1, Callback = function(v) _G.WalkSpeed = v if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed = v end end })

SettingTab:AddSlider("JumpPower", { Title = "🦘 Nhảy cao", Default = 50, Min = 50, Max = 500, Rounding = 1, Callback = function(v) _G.JumpPower = v if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower = v end end })

SettingTab:AddToggle("NoClip", { Title = "🌀 No Clip", Default = false, Callback = function(v) _G.NoClip = v spawn(function() while _G.NoClip and task.wait() do if LP.Character then for _, part in pairs(LP.Character:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = false end end end end end) end })

SettingTab:AddToggle("WhiteScreen", { Title = "⬜ Màn hình trắng", Default = false, Callback = function(v) game:GetService("RunService"):Set3dRenderingEnabled(not v) end })

-- ================================
-- TAB STATS
-- ================================
local StatsTab = Window:AddTab({ Title = "📈 Stats", Icon = "chart" })

local info = StatsTab:AddParagraph({ Title = "📊 Thông tin", Content = "" })
spawn(function()
    while task.wait(2) do
        pcall(function()
            info:SetDesc(string.format("👤 %s\n⭐ Level: %s\n💰 Beli: %s\n💎 Fragments: %s\n🍎 Trái: %s\n🧬 Tộc: %s", LP.Name, LP.Data.Level.Value, LP.Data.Beli.Value, LP.Data.Fragments.Value, LP.Data.DevilFruit.Value, LP.Data.Race.Value))
        end)
    end
end)

-- ================================
-- TAB TELEPORT
-- ================================
local TeleportTab = Window:AddTab({ Title = "🚀 Teleport", Icon = "map-pin" })

TeleportTab:AddButton({ Title = "🌊 Sea 1", Callback = function() ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelMain") end })
TeleportTab:AddButton({ Title = "🌊 Sea 2", Callback = function() ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa") end })
TeleportTab:AddButton({ Title = "🌊 Sea 3", Callback = function() ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou") end })

local islandList = Sea1 and {"WindMill", "Jungle", "Desert", "Snow Island", "MarineFord", "Sky Island"} or Sea2 and {"The Cafe", "Factory", "Zombie Island", "Punk Hazard"} or {"Port Town", "Hydra Island", "Haunted Castle", "Cake Island"}
TeleportTab:AddDropdown("IslandSelect", { Title = "🏝️ Chọn đảo", Values = islandList, Default = 1, Callback = function(v) _G.SelectIsland = v end })

TeleportTab:AddButton({ Title = "✨ Teleport", Callback = function()
    local coords = { WindMill = CFrame.new(979.79,16.51,1429.04), Jungle = CFrame.new(-1612.79,36.85,149.12), Desert = CFrame.new(944.15,20.91,4373.30), ["Snow Island"] = CFrame.new(1347.80,104.66,-1319.73), MarineFord = CFrame.new(-4914.82,50.96,4281.02), ["Sky Island"] = CFrame.new(-4869.10,733.46,-2667.01), ["The Cafe"] = CFrame.new(-380.47,77.22,255.82), Factory = CFrame.new(424.12,211.16,-427.54), ["Zombie Island"] = CFrame.new(-5622.03,492.19,-781.78), ["Punk Hazard"] = CFrame.new(-6127.65,15.95,-5040.28), ["Port Town"] = CFrame.new(-290.73,6.72,5343.55), ["Hydra Island"] = CFrame.new(5661.53,1013.09,-334.96), ["Haunted Castle"] = CFrame.new(-9515.37,164.00,5786.06), ["Cake Island"] = CFrame.new(-1884.77,19.32,-11666.89) }
    if coords[_G.SelectIsland] then Tween(coords[_G.SelectIsland]) end
end })

-- Reset speed khi chết
LP.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    if char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = _G.WalkSpeed
        char.Humanoid.JumpPower = _G.JumpPower
    end
end)

Fluent:Notify({ Title = "🌟 TML HUB LITE", Content = "Đã tải thành công!", Duration = 5 })
Window:SelectTab(1)