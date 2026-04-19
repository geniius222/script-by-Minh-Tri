--[[ 
    🌟 TML HUB - BLOX FRUITS ULTIMATE 🌟
    Dựa trên Green-HUB, đã chắt lọc và tối ưu
    Giữ nguyên toàn bộ chức năng Auto Farm, ESP, Raid, Stats, Teleport
]]

-- Load Fluent UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Tạo cửa sổ chính
local Window = Fluent:CreateWindow({
    Title = "🌟 TML HUB  |  BLOX FRUITS",
    SubTitle = "Premium Script - By TML",
    TabWidth = 160,
    Theme = "Amber",
    Acrylic = true,
    Size = UDim2.fromOffset(550, 450),
    MinimizeKey = Enum.KeyCode.End
})

-- Khai báo biến
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- Xác định Sea hiện tại
local PlaceId = game.PlaceId
local Sea1 = PlaceId == 2753915549
local Sea2 = PlaceId == 4442272183
local Sea3 = PlaceId == 7449423635

if not (Sea1 or Sea2 or Sea3) then
    game:Shutdown()
end

-- Anti AFK
LP.Idled:connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
    wait()
    VirtualUser:Button2Up(Vector2.new(0,0), Workspace.CurrentCamera.CFrame)
end)

-- Biến toàn cục
_G.AutoLevel = false
_G.AutoNear = false
_G.AutoBone = false
_G.AutoMaterial = false
_G.AutoBoss = false
_G.AutoElite = false
_G.SelectBoss = "Stone"
_G.SelectMaterial = "Scrap Metal"
_G.BringMob = true
_G.WalkSpeed = 16
_G.JumpPower = 50
_G.NoClip = false
_G.AutoHaki = true
_G.AutoKen = false
_G.AutoStats = false
_G.AutoCollectChest = false
_G.Fast_Delay = 1e-9
_G.WhiteScreen = false

-- Hàm CheckLevel (giữ nguyên từ script gốc)
function CheckLevel()
    local level = LP.Data.Level.Value
    if Sea1 then
        if level <= 9 then
            Ms = "Bandit"
            NameQuest = "BanditQuest1"
            QuestLv = 1
            NameMon = "Bandit"
            CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
            CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
        elseif level <= 14 then
            Ms = "Monkey"
            NameQuest = "JungleQuest"
            QuestLv = 1
            NameMon = "Monkey"
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1448.1446533203, 50.851993560791, 63.60718536377)
        elseif level <= 29 then
            Ms = "Gorilla"
            NameQuest = "JungleQuest"
            QuestLv = 2
            NameMon = "Gorilla"
            CFrameQ = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(-1142.6488037109, 40.462348937988, -515.39227294922)
        elseif level <= 39 then
            Ms = "Pirate"
            NameQuest = "BuggyQuest1"
            QuestLv = 1
            NameMon = "Pirate"
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1201.0881347656, 40.628940582275, 3857.5966796875)
        elseif level <= 59 then
            Ms = "Brute"
            NameQuest = "BuggyQuest1"
            QuestLv = 2
            NameMon = "Brute"
            CFrameQ = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(-1387.5324707031, 24.592035293579, 4100.9575195313)
        elseif level <= 74 then
            Ms = "Desert Bandit"
            NameQuest = "DesertQuest"
            QuestLv = 1
            NameMon = "Desert Bandit"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
        elseif level <= 89 then
            Ms = "Desert Officer"
            NameQuest = "DesertQuest"
            QuestLv = 2
            NameMon = "Desert Officer"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
        elseif level <= 99 then
            Ms = "Snow Bandit"
            NameQuest = "SnowQuest"
            QuestLv = 1
            NameMon = "Snow Bandit"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, -1328.2418212891)
        elseif level <= 119 then
            Ms = "Snowman"
            NameQuest = "SnowQuest"
            QuestLv = 2
            NameMon = "Snowman"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
        elseif level <= 149 then
            Ms = "Chief Petty Officer"
            NameQuest = "MarineQuest2"
            QuestLv = 1
            NameMon = "Chief Petty Officer"
            CFrameQ = CFrame.new(-5035.49609375, 28.677835464478, 4324.1840820313)
            CFrameMon = CFrame.new(-4931.1552734375, 65.793113708496, 4121.8393554688)
        elseif level <= 174 then
            Ms = "Sky Bandit"
            NameQuest = "SkyQuest"
            QuestLv = 1
            NameMon = "Sky Bandit"
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-4955.6411132813, 365.46365356445, -2908.1865234375)
        elseif level <= 189 then
            Ms = "Dark Master"
            NameQuest = "SkyQuest"
            QuestLv = 2
            NameMon = "Dark Master"
            CFrameQ = CFrame.new(-4842.1372070313, 717.69543457031, -2623.0483398438)
            CFrameMon = CFrame.new(-5148.1650390625, 439.04571533203, -2332.9611816406)
        elseif level <= 209 then
            Ms = "Prisoner"
            NameQuest = "PrisonerQuest"
            QuestLv = 1
            NameMon = "Prisoner"
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594)
            CFrameMon = CFrame.new(4937.31885, 0.332031399, 649.574524)
        elseif level <= 249 then
            Ms = "Dangerous Prisoner"
            NameQuest = "PrisonerQuest"
            QuestLv = 2
            NameMon = "Dangerous Prisoner"
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594)
            CFrameMon = CFrame.new(5099.6626, 0.351562679, 1055.7583)
        elseif level <= 274 then
            Ms = "Toga Warrior"
            NameQuest = "ColosseumQuest"
            QuestLv = 1
            NameMon = "Toga Warrior"
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1872.5166015625, 49.080215454102, -2913.810546875)
        elseif level <= 299 then
            Ms = "Gladiator"
            NameQuest = "ColosseumQuest"
            QuestLv = 2
            NameMon = "Gladiator"
            CFrameQ = CFrame.new(-1577.7890625, 7.4151420593262, -2984.4838867188)
            CFrameMon = CFrame.new(-1521.3740234375, 81.203170776367, -3066.3139648438)
        elseif level <= 324 then
            Ms = "Military Soldier"
            NameQuest = "MagmaQuest"
            QuestLv = 1
            NameMon = "Military Soldier"
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5369.0004882813, 61.24352645874, 8556.4921875)
        elseif level <= 374 then
            Ms = "Military Spy"
            NameQuest = "MagmaQuest"
            QuestLv = 2
            NameMon = "Military Spy"
            CFrameQ = CFrame.new(-5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(-5787.00293, 75.8262634, 8651.69922)
        elseif level <= 399 then
            Ms = "Fishman Warrior"
            NameQuest = "FishmanQuest"
            QuestLv = 1
            NameMon = "Fishman Warrior"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
            if _G.AutoLevel and (CFrameMon.Position - LP.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif level <= 449 then
            Ms = "Fishman Commando"
            NameQuest = "FishmanQuest"
            QuestLv = 2
            NameMon = "Fishman Commando"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
            if _G.AutoLevel and (CFrameMon.Position - LP.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif level <= 474 then
            Ms = "God's Guard"
            NameQuest = "SkyExp1Quest"
            QuestLv = 1
            NameMon = "God's Guard"
            CFrameQ = CFrame.new(-4721.8603515625, 845.30297851563, -1953.8489990234)
            CFrameMon = CFrame.new(-4628.0498046875, 866.92877197266, -1931.2352294922)
            if _G.AutoLevel and (CFrameMon.Position - LP.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82275, 872.54248, -1667.55688))
            end
        elseif level <= 524 then
            Ms = "Shanda"
            NameQuest = "SkyExp1Quest"
            QuestLv = 2
            NameMon = "Shanda"
            CFrameQ = CFrame.new(-7863.1596679688, 5545.5190429688, -378.42266845703)
            CFrameMon = CFrame.new(-7685.1474609375, 5601.0751953125, -441.38876342773)
            if _G.AutoLevel and (CFrameMon.Position - LP.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            end
        elseif level <= 549 then
            Ms = "Royal Squad"
            NameQuest = "SkyExp2Quest"
            QuestLv = 1
            NameMon = "Royal Squad"
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7654.2514648438, 5637.1079101563, -1407.7550048828)
        elseif level <= 624 then
            Ms = "Royal Soldier"
            NameQuest = "SkyExp2Quest"
            QuestLv = 2
            NameMon = "Royal Soldier"
            CFrameQ = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            CFrameMon = CFrame.new(-7760.4106445313, 5679.9077148438, -1884.8112792969)
        elseif level <= 649 then
            Ms = "Galley Pirate"
            NameQuest = "FountainQuest"
            QuestLv = 1
            NameMon = "Galley Pirate"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
        elseif level >= 650 then
            Ms = "Galley Captain"
            NameQuest = "FountainQuest"
            QuestLv = 2
            NameMon = "Galley Captain"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
        end
    elseif Sea2 then
        if level <= 724 then
            Ms = "Raider"
            NameQuest = "Area1Quest"
            QuestLv = 1
            NameMon = "Raider"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
        elseif level <= 774 then
            Ms = "Mercenary"
            NameQuest = "Area1Quest"
            QuestLv = 2
            NameMon = "Mercenary"
            CFrameQ = CFrame.new(-427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(-864.85009765625, 122.47104644775, 1453.1505126953)
        elseif level <= 799 then
            Ms = "Swan Pirate"
            NameQuest = "Area2Quest"
            QuestLv = 1
            NameMon = "Swan Pirate"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
        elseif level <= 874 then
            Ms = "Factory Staff"
            NameQuest = "Area2Quest"
            QuestLv = 2
            NameMon = "Factory Staff"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
        elseif level <= 899 then
            Ms = "Marine Lieutenant"
            NameQuest = "MarineQuest3"
            QuestLv = 1
            NameMon = "Marine Lieutenant"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2489.2622070313, 84.613594055176, -3151.8830566406)
        elseif level <= 949 then
            Ms = "Marine Captain"
            NameQuest = "MarineQuest3"
            QuestLv = 2
            NameMon = "Marine Captain"
            CFrameQ = CFrame.new(-2440.9934082031, 73.04190826416, -3217.7082519531)
            CFrameMon = CFrame.new(-2335.2026367188, 79.786659240723, -3245.8674316406)
        elseif level <= 974 then
            Ms = "Zombie"
            NameQuest = "ZombieQuest"
            QuestLv = 1
            NameMon = "Zombie"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5536.4970703125, 101.08577728271, -835.59075927734)
        elseif level <= 999 then
            Ms = "Vampire"
            NameQuest = "ZombieQuest"
            QuestLv = 2
            NameMon = "Vampire"
            CFrameQ = CFrame.new(-5494.3413085938, 48.505931854248, -794.59094238281)
            CFrameMon = CFrame.new(-5806.1098632813, 16.722528457642, -1164.4384765625)
        elseif level <= 1049 then
            Ms = "Snow Trooper"
            NameQuest = "SnowMountainQuest"
            QuestLv = 1
            NameMon = "Snow Trooper"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(535.21051025391, 432.74209594727, -5484.9165039063)
        elseif level <= 1099 then
            Ms = "Winter Warrior"
            NameQuest = "SnowMountainQuest"
            QuestLv = 2
            NameMon = "Winter Warrior"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, -5370.5546875)
            CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, -5174.130859375)
        elseif level <= 1124 then
            Ms = "Lab Subordinate"
            NameQuest = "IceSideQuest"
            QuestLv = 1
            NameMon = "Lab Subordinate"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-5720.5576171875, 63.309471130371, -4784.6103515625)
        elseif level <= 1174 then
            Ms = "Horned Warrior"
            NameQuest = "IceSideQuest"
            QuestLv = 2
            NameMon = "Horned Warrior"
            CFrameQ = CFrame.new(-6061.841796875, 15.926671981812, -4902.0385742188)
            CFrameMon = CFrame.new(-6292.751953125, 91.181983947754, -5502.6499023438)
        elseif level <= 1199 then
            Ms = "Magma Ninja"
            NameQuest = "FireSideQuest"
            QuestLv = 1
            NameMon = "Magma Ninja"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5461.8388671875, 130.36347961426, -5836.4702148438)
        elseif level <= 1249 then
            Ms = "Lava Pirate"
            NameQuest = "FireSideQuest"
            QuestLv = 2
            NameMon = "Lava Pirate"
            CFrameQ = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            CFrameMon = CFrame.new(-5251.1889648438, 55.164535522461, -4774.4096679688)
        elseif level <= 1274 then
            Ms = "Ship Deckhand"
            NameQuest = "ShipQuest1"
            QuestLv = 1
            NameMon = "Ship Deckhand"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
            if _G.AutoLevel and (CFrameMon.Position - LP.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif level <= 1299 then
            Ms = "Ship Engineer"
            NameQuest = "ShipQuest1"
            QuestLv = 2
            NameMon = "Ship Engineer"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
            if _G.AutoLevel and (CFrameMon.Position - LP.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif level <= 1324 then
            Ms = "Ship Steward"
            NameQuest = "ShipQuest2"
            QuestLv = 1
            NameMon = "Ship Steward"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
            if _G.AutoLevel and (CFrameMon.Position - LP.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif level <= 1349 then
            Ms = "Ship Officer"
            NameQuest = "ShipQuest2"
            QuestLv = 2
            NameMon = "Ship Officer"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
            if _G.AutoLevel and (CFrameMon.Position - LP.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif level <= 1374 then
            Ms = "Arctic Warrior"
            NameQuest = "FrostQuest"
            QuestLv = 1
            NameMon = "Arctic Warrior"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, -6472.7568359375)
            if _G.AutoLevel and (CFrameMon.Position - LP.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
            end
        elseif level <= 1424 then
            Ms = "Snow Lurker"
            NameQuest = "FrostQuest"
            QuestLv = 2
            NameMon = "Snow Lurker"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, -6484.6005859375)
            CFrameMon = CFrame.new(5628.482421875, 57.574996948242, -6618.3481445313)
        elseif level <= 1449 then
            Ms = "Sea Soldier"
            NameQuest = "ForgottenQuest"
            QuestLv = 1
            NameMon = "Sea Soldier"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3185.0153808594, 58.789089202881, -9663.6064453125)
        elseif level >= 1450 then
            Ms = "Water Fighter"
            NameQuest = "ForgottenQuest"
            QuestLv = 2
            NameMon = "Water Fighter"
            CFrameQ = CFrame.new(-3054.5827636719, 236.87213134766, -10147.790039063)
            CFrameMon = CFrame.new(-3262.9301757813, 298.69036865234, -10552.529296875)
        end
    elseif Sea3 then
        if level <= 1524 then
            Ms = "Pirate Millionaire"
            NameQuest = "PiratePortQuest"
            QuestLv = 1
            NameMon = "Pirate Millionaire"
            CFrameQ = CFrame.new(-450.1046447753906, 107.68145751953125, 5950.72607421875)
            CFrameMon = CFrame.new(-193.99227905273438, 56.12502670288086, 5755.7880859375)
        elseif level <= 1574 then
            Ms = "Pistol Billionaire"
            NameQuest = "PiratePortQuest"
            QuestLv = 2
            NameMon = "Pistol Billionaire"
            CFrameQ = CFrame.new(-450.1046447753906, 107.68145751953125, 5950.72607421875)
            CFrameMon = CFrame.new(-188.14462280273438, 84.49613189697266, 6337.0419921875)
        elseif level <= 1599 then
            Ms = "Dragon Crew Warrior"
            NameQuest = "DragonCrewQuest"
            QuestLv = 1
            NameMon = "Dragon Crew Warrior"
            CFrameQ = CFrame.new(6735.11083984375, 126.99046325683594, -711.0979614257812)
            CFrameMon = CFrame.new(6615.2333984375, 50.847679138183594, -978.93408203125)
        elseif level <= 1624 then
            Ms = "Dragon Crew Archer"
            NameQuest = "DragonCrewQuest"
            QuestLv = 2
            NameMon = "Dragon Crew Archer"
            CFrameQ = CFrame.new(6735.11083984375, 126.99046325683594, -711.0979614257812)
            CFrameMon = CFrame.new(6818.58935546875, 483.718994140625, 512.726806640625)
        elseif level <= 1649 then
            Ms = "Hydra Enforcer"
            NameQuest = "VenomCrewQuest"
            QuestLv = 1
            NameMon = "Hydra Enforcer"
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(4547.115234375, 1001.60205078125, 334.1954650878906)
        elseif level <= 1699 then
            Ms = "Venomous Assailant"
            NameQuest = "VenomCrewQuest"
            QuestLv = 2
            NameMon = "Venomous Assailant"
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(4637.88525390625, 1077.85595703125, 882.4183959960938)
        elseif level <= 1724 then
            Ms = "Marine Commodore"
            NameQuest = "MarineTreeIsland"
            QuestLv = 1
            NameMon = "Marine Commodore"
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, -7109.5043945313)
        elseif level <= 1774 then
            Ms = "Marine Rear Admiral"
            NameQuest = "MarineTreeIsland"
            QuestLv = 2
            NameMon = "Marine Rear Admiral"
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
            CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, -7048.6342773438)
        elseif level <= 1799 then
            Ms = "Fishman Raider"
            NameQuest = "DeepForestIsland3"
            QuestLv = 1
            NameMon = "Fishman Raider"
            CFrameQ = CFrame.new(-10582.759765625, 331.78845214844, -8757.666015625)
            CFrameMon = CFrame.new(-10553.268554688, 521.38439941406, -8176.9458007813)
        elseif level <= 1824 then
            Ms = "Fishman Captain"
            NameQuest = "DeepForestIsland3"
            QuestLv = 2
            NameMon = "Fishman Captain"
            CFrameQ = CFrame.new(-10583.099609375, 331.78845214844, -8759.4638671875)
            CFrameMon = CFrame.new(-10789.401367188, 427.18637084961, -9131.4423828125)
        elseif level <= 1849 then
            Ms = "Forest Pirate"
            NameQuest = "DeepForestIsland"
            QuestLv = 1
            NameMon = "Forest Pirate"
            CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
            CFrameMon = CFrame.new(-13489.397460938, 400.30349731445, -7770.251953125)
        elseif level <= 1899 then
            Ms = "Mythological Pirate"
            NameQuest = "DeepForestIsland"
            QuestLv = 2
            NameMon = "Mythological Pirate"
            CFrameQ = CFrame.new(-13232.662109375, 332.40396118164, -7626.4819335938)
            CFrameMon = CFrame.new(-13508.616210938, 582.46228027344, -6985.3037109375)
        elseif level <= 1924 then
            Ms = "Jungle Pirate"
            NameQuest = "DeepForestIsland2"
            QuestLv = 1
            NameMon = "Jungle Pirate"
            CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            CFrameMon = CFrame.new(-12267.103515625, 459.75262451172, -10277.200195313)
        elseif level <= 1974 then
            Ms = "Musketeer Pirate"
            NameQuest = "DeepForestIsland2"
            QuestLv = 2
            NameMon = "Musketeer Pirate"
            CFrameQ = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            CFrameMon = CFrame.new(-13291.5078125, 520.47338867188, -9904.638671875)
        elseif level <= 1999 then
            Ms = "Reborn Skeleton"
            NameQuest = "HauntedQuest1"
            QuestLv = 1
            NameMon = "Reborn Skeleton"
            CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305)
            CFrameMon = CFrame.new(-8761.77148, 183.431747, 6168.33301)
        elseif level <= 2024 then
            Ms = "Living Zombie"
            NameQuest = "HauntedQuest1"
            QuestLv = 2
            NameMon = "Living Zombie"
            CFrameQ = CFrame.new(-9480.80762, 142.130661, 5566.37305)
            CFrameMon = CFrame.new(-10103.7529, 238.565979, 6179.75977)
        elseif level <= 2049 then
            Ms = "Demonic Soul"
            NameQuest = "HauntedQuest2"
            QuestLv = 1
            NameMon = "Demonic Soul"
            CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
        elseif level <= 2074 then
            Ms = "Posessed Mummy"
            NameQuest = "HauntedQuest2"
            QuestLv = 2
            NameMon = "Posessed Mummy"
            CFrameQ = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)
        elseif level <= 2099 then
            Ms = "Peanut Scout"
            NameQuest = "NutsIslandQuest"
            QuestLv = 1
            NameMon = "Peanut Scout"
            CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088)
            CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
        elseif level <= 2124 then
            Ms = "Peanut President"
            NameQuest = "NutsIslandQuest"
            QuestLv = 2
            NameMon = "Peanut President"
            CFrameQ = CFrame.new(-2105.53198, 37.2495995, -10195.5088)
            CFrameMon = CFrame.new(-2150.587890625, 122.49767303467, -10358.994140625)
        elseif level <= 2149 then
            Ms = "Ice Cream Chef"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 1
            NameMon = "Ice Cream Chef"
            CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832)
            CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805)
        elseif level <= 2199 then
            Ms = "Ice Cream Commander"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 2
            NameMon = "Ice Cream Commander"
            CFrameQ = CFrame.new(-819.376709, 64.9259796, -10967.2832)
            CFrameMon = CFrame.new(-789.941528, 209.382889, -11009.9805)
        elseif level <= 2224 then
            Ms = "Cookie Crafter"
            NameQuest = "CakeQuest1"
            QuestLv = 1
            NameMon = "Cookie Crafter"
            CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766)
            CFrameMon = CFrame.new(-2321.71216, 36.699482, -12216.7871)
        elseif level <= 2249 then
            Ms = "Cake Guard"
            NameQuest = "CakeQuest1"
            QuestLv = 2
            NameMon = "Cake Guard"
            CFrameQ = CFrame.new(-2022.29858, 36.9275894, -12030.9766)
            CFrameMon = CFrame.new(-1418.11011, 36.6718941, -12255.7324)
        elseif level <= 2274 then
            Ms = "Baking Staff"
            NameQuest = "CakeQuest2"
            QuestLv = 1
            NameMon = "Baking Staff"
            CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626)
            CFrameMon = CFrame.new(-1980.43848, 36.6716766, -12983.8418)
        elseif level <= 2299 then
            Ms = "Head Baker"
            NameQuest = "CakeQuest2"
            QuestLv = 2
            NameMon = "Head Baker"
            CFrameQ = CFrame.new(-1928.31763, 37.7296638, -12840.626)
            CFrameMon = CFrame.new(-2251.5791, 52.2714615, -13033.3965)
        elseif level <= 2324 then
            Ms = "Cocoa Warrior"
            NameQuest = "ChocQuest1"
            QuestLv = 1
            NameMon = "Cocoa Warrior"
            CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292)
            CFrameMon = CFrame.new(167.978516, 26.2254658, -12238.874)
        elseif level <= 2349 then
            Ms = "Chocolate Bar Battler"
            NameQuest = "ChocQuest1"
            QuestLv = 2
            NameMon = "Chocolate Bar Battler"
            CFrameQ = CFrame.new(231.75, 23.9003029, -12200.292)
            CFrameMon = CFrame.new(701.312073, 25.5824986, -12708.2148)
        elseif level <= 2374 then
            Ms = "Sweet Thief"
            NameQuest = "ChocQuest2"
            QuestLv = 1
            NameMon = "Sweet Thief"
            CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172)
            CFrameMon = CFrame.new(-140.258301, 25.5824986, -12652.3115)
        elseif level <= 2400 then
            Ms = "Candy Rebel"
            NameQuest = "ChocQuest2"
            QuestLv = 2
            NameMon = "Candy Rebel"
            CFrameQ = CFrame.new(151.198242, 23.8907146, -12774.6172)
            CFrameMon = CFrame.new(47.9231453, 25.5824986, -13029.2402)
        elseif level <= 2424 then
            Ms = "Candy Pirate"
            NameQuest = "CandyQuest1"
            QuestLv = 1
            NameMon = "Candy Pirate"
            CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143)
            CFrameMon = CFrame.new(-1437.56348, 17.1481285, -14385.6934)
        elseif level <= 2449 then
            Ms = "Snow Demon"
            NameQuest = "CandyQuest1"
            QuestLv = 2
            NameMon = "Snow Demon"
            CFrameQ = CFrame.new(-1149.328, 13.5759039, -14445.6143)
            CFrameMon = CFrame.new(-916.222656, 17.1481285, -14638.8125)
        elseif level <= 2474 then
            Ms = "Isle Outlaw"
            NameQuest = "TikiQuest1"
            QuestLv = 1
            NameMon = "Isle Outlaw"
            CFrameQ = CFrame.new(-16549.890625, 55.68635559082031, -179.91360473632812)
            CFrameMon = CFrame.new(-16162.8193359375, 11.6863374710083, -96.45481872558594)
        elseif level <= 2499 then
            Ms = "Island Boy"
            NameQuest = "TikiQuest1"
            QuestLv = 2
            NameMon = "Island Boy"
            CFrameQ = CFrame.new(-16549.890625, 55.68635559082031, -179.91360473632812)
            CFrameMon = CFrame.new(-16357.3125, 20.632822036743164, 1005.64892578125)
        elseif level <= 2524 then
            Ms = "Sun-kissed Warrior"
            NameQuest = "TikiQuest2"
            QuestLv = 1
            NameMon = "Sun-kissed Warrior"
            CFrameQ = CFrame.new(-16541.021484375, 54.77081298828125, 1051.461181640625)
            CFrameMon = CFrame.new(-16357.3125, 20.632822036743164, 1005.64892578125)
        elseif level <= 2549 then
            Ms = "Isle Champion"
            NameQuest = "TikiQuest2"
            QuestLv = 2
            NameMon = "Isle Champion"
            CFrameQ = CFrame.new(-16541.021484375, 54.77081298828125, 1051.461181640625)
            CFrameMon = CFrame.new(-16848.94140625, 21.68633460998535, 1041.4490966796875)
        elseif level <= 2574 then
            Ms = "Serpent Hunter"
            NameQuest = "TikiQuest3"
            QuestLv = 1
            NameMon = "Serpent Hunter"
            CFrameQ = CFrame.new(-16665.19140625, 104.59640502929688, 1579.6943359375)
            CFrameMon = CFrame.new(-16621.4140625, 121.40631103515625, 1290.6881103515625)
        elseif level >= 2575 then
            Ms = "Skull Slayer"
            NameQuest = "TikiQuest3"
            QuestLv = 2
            NameMon = "Skull Slayer"
            CFrameQ = CFrame.new(-16665.19140625, 104.59640502929688, 1579.6943359375)
            CFrameMon = CFrame.new(-16811.5703125, 84.625244140625, 1542.235107421875)
        end
    end
end

-- Hàm MaterialMon
function MaterialMon()
    if SelectMaterial == "Scrap Metal" then
        if Sea1 then
            MMon = "Brute"
            MPos = CFrame.new(-1145, 15, 4350)
        elseif Sea2 then
            MMon = "Swan Pirate"
            MPos = CFrame.new(878, 122, 1235)
        elseif Sea3 then
            MMon = "Jungle Pirate"
            MPos = CFrame.new(-12107, 332, -10549)
        end
    elseif SelectMaterial == "Leather" then
        if Sea1 then
            MMon = "Brute"
            MPos = CFrame.new(-1145, 15, 4350)
        elseif Sea2 then
            MMon = "Marine Captain"
            MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
        elseif Sea3 then
            MMon = "Jungle Pirate"
            MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
        end
    elseif SelectMaterial == "Magma Ore" then
        if Sea1 then
            MMon = "Military Spy"
            MPos = CFrame.new(-5815, 84, 8820)
        elseif Sea2 then
            MMon = "Magma Ninja"
            MPos = CFrame.new(-5428, 78, -5959)
        end
    elseif SelectMaterial == "Angel Wings" then
        MMon = "God's Guard"
        MPos = CFrame.new(-4698, 845, -1912)
        if (LP.Character.HumanoidRootPart.Position - Vector3.new(-7859.09814, 5544.19043, -381.476196)).Magnitude >= 5000 then
            ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7859.09814, 5544.19043, -381.476196))
        end
    elseif SelectMaterial == "Fish Tail" then
        if Sea1 then
            MMon = "Fishman Warrior"
            MPos = CFrame.new(61123, 19, 1569)
            if (LP.Character.HumanoidRootPart.Position - Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude >= 17000 then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875))
            end
        end
    end
end

-- Hàm Tween
function Tween(cf)
    if not LP.Character or not LP.Character:FindFirstChild("HumanoidRootPart") then return end
    local dist = (cf.Position - LP.Character.HumanoidRootPart.Position).Magnitude
    local speed = 350
    local tween = TweenService:Create(LP.Character.HumanoidRootPart, TweenInfo.new(dist/speed, Enum.EasingStyle.Linear), {CFrame = cf})
    tween:Play()
    return tween
end

function Tween2(cf)
    Tween(cf)
end

-- Hàm EquipTool
function EquipTool(tool)
    if LP.Backpack:FindFirstChild(tool) then
        LP.Character.Humanoid:EquipTool(LP.Backpack[tool])
    end
end

-- Hàm AutoHaki
function AutoHaki()
    if _G.AutoHaki and not LP.Character:FindFirstChild("HasBuso") then
        ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso")
    end
end

-- Hàm AttackNoCoolDown
function AttackNoCoolDown()
    pcall(function()
        local attack = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")
        local hit = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")
        attack:FireServer(1e-9)
        hit:FireServer(LP.Character.Head, {})
    end)
end

-- Biến pos cho tween đánh
Pos = CFrame.new(0, 40, 0)
Type = 1
spawn(function()
    while wait(0.2) do
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
-- 🌟 TAB FARMING
-- ================================
local FarmTab = Window:AddTab({ Title = "⚔️ Farming", Icon = "sword" })

FarmTab:AddToggle("AutoLevel", {
    Title = "🔥 Auto Farm Level",
    Description = "Tự động nhận quest và đánh quái theo cấp",
    Default = false,
    Callback = function(v)
        _G.AutoLevel = v
    end
})

FarmTab:AddDropdown("WeaponSelect", {
    Title = "🗡️ Vũ khí chính",
    Values = {"Melee", "Sword", "Blox Fruit"},
    Default = 1,
    Callback = function(v)
        SelectWeapon = v
    end
})

FarmTab:AddToggle("AutoNear", {
    Title = "👊 Đánh quái gần",
    Description = "Tự động đánh quái trong phạm vi",
    Default = false,
    Callback = function(v)
        _G.AutoNear = v
        if not v then
            Tween(LP.Character.HumanoidRootPart.CFrame)
        end
    end
})

FarmTab:AddToggle("AutoHaki", {
    Title = "💪 Auto Buso Haki",
    Description = "Tự động bật Haki khi chiến đấu",
    Default = true,
    Callback = function(v)
        _G.AutoHaki = v
    end
})

FarmTab:AddToggle("AutoKen", {
    Title = "👁️ Auto Ken Haki",
    Description = "Tự động bật Observation",
    Default = false,
    Callback = function(v)
        _G.AutoKen = v
        ReplicatedStorage.Remotes.CommE:FireServer("Ken", v)
    end
})

FarmTab:AddToggle("BringMob", {
    Title = "🔄 Bring Mob (⚠️ Nguy hiểm)",
    Description = "Kéo quái về vị trí - Dễ bị ban",
    Default = true,
    Callback = function(v)
        _G.BringMob = v
    end
})

FarmTab:AddToggle("AutoCollectChest", {
    Title = "📦 Auto Farm Chest",
    Description = "Tự động nhặt rương",
    Default = false,
    Callback = function(v)
        _G.AutoCollectChest = v
        if v then
            spawn(function()
                while _G.AutoCollectChest and task.wait(1) do
                    pcall(function()
                        local chests = Workspace:GetChildren()
                        local nearest = nil
                        local dist = math.huge
                        for _, chest in pairs(chests) do
                            if string.find(chest.Name, "Chest") and chest:IsA("BasePart") then
                                local d = (LP.Character.HumanoidRootPart.Position - chest.Position).Magnitude
                                if d < dist then
                                    dist = d
                                    nearest = chest
                                end
                            end
                        end
                        if nearest then
                            Tween2(CFrame.new(nearest.Position))
                        end
                    end)
                end
            end)
        end
    end
})

-- Auto Level Core
spawn(function()
    while task.wait() do
        if _G.AutoLevel then
            pcall(function()
                CheckLevel()
                local questGui = LP.PlayerGui.Main.Quest
                local hasQuest = questGui.Visible and string.find(questGui.Container.QuestTitle.Title.Text, NameMon)
                if not hasQuest then
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest")
                    Tween(CFrameQ)
                    if (CFrameQ.Position - LP.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
                    end
                else
                    for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                        if enemy.Name == Ms and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                            repeat
                                task.wait(_G.Fast_Delay)
                                AttackNoCoolDown()
                                AutoHaki()
                                if SelectWeapon == "Melee" then
                                    for _, tool in pairs(LP.Backpack:GetChildren()) do
                                        if tool.ToolTip == "Melee" then
                                            EquipTool(tool.Name)
                                            break
                                        end
                                    end
                                elseif SelectWeapon == "Sword" then
                                    for _, tool in pairs(LP.Backpack:GetChildren()) do
                                        if tool.ToolTip == "Sword" then
                                            EquipTool(tool.Name)
                                            break
                                        end
                                    end
                                elseif SelectWeapon == "Blox Fruit" then
                                    for _, tool in pairs(LP.Backpack:GetChildren()) do
                                        if tool.ToolTip == "Blox Fruit" then
                                            EquipTool(tool.Name)
                                            break
                                        end
                                    end
                                end
                                Tween(enemy.HumanoidRootPart.CFrame * Pos)
                                if _G.BringMob then
                                    enemy.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    enemy.HumanoidRootPart.Transparency = 1
                                    enemy.Humanoid.JumpPower = 0
                                    enemy.Humanoid.WalkSpeed = 0
                                    enemy.HumanoidRootPart.CanCollide = false
                                end
                            until not _G.AutoLevel or not enemy.Parent or enemy.Humanoid.Health <= 0
                        end
                    end
                end
            end)
        end
    end
end)

-- Auto Near Core
spawn(function()
    while task.wait() do
        if _G.AutoNear then
            pcall(function()
                for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                    if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                        if (LP.Character.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude <= 5000 then
                            repeat
                                task.wait(_G.Fast_Delay)
                                AttackNoCoolDown()
                                AutoHaki()
                                Tween(enemy.HumanoidRootPart.CFrame * Pos)
                                if _G.BringMob then
                                    enemy.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    enemy.HumanoidRootPart.Transparency = 1
                                    enemy.Humanoid.JumpPower = 0
                                    enemy.Humanoid.WalkSpeed = 0
                                    enemy.HumanoidRootPart.CanCollide = false
                                end
                            until not _G.AutoNear or not enemy.Parent or enemy.Humanoid.Health <= 0
                        end
                    end
                end
            end)
        end
    end
end)

-- Material Farm
local matList = {}
if Sea1 then matList = {"Scrap Metal", "Leather", "Angel Wings", "Magma Ore", "Fish Tail"}
elseif Sea2 then matList = {"Scrap Metal", "Leather", "Magma Ore"}
elseif Sea3 then matList = {"Scrap Metal", "Leather", "Demonic Wisp", "Dragon Scale", "Gunpowder", "Fish Tail"}
end

FarmTab:AddDropdown("MaterialSelect", {
    Title = "📦 Chọn Material",
    Values = matList,
    Default = 1,
    Callback = function(v)
        SelectMaterial = v
    end
})

FarmTab:AddToggle("AutoMaterial", {
    Title = "📦 Auto Farm Material",
    Description = "Tự động farm nguyên liệu",
    Default = false,
    Callback = function(v)
        _G.AutoMaterial = v
        if not v then
            Tween(LP.Character.HumanoidRootPart.CFrame)
        end
    end
})

spawn(function()
    while task.wait() do
        if _G.AutoMaterial then
            pcall(function()
                MaterialMon()
                Tween(MPos)
                for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                    if enemy.Name == MMon and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                        repeat
                            task.wait(_G.Fast_Delay)
                            AttackNoCoolDown()
                            AutoHaki()
                            EquipTool(SelectWeapon)
                            Tween(enemy.HumanoidRootPart.CFrame * Pos)
                            if _G.BringMob then
                                enemy.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                enemy.HumanoidRootPart.Transparency = 1
                                enemy.Humanoid.JumpPower = 0
                                enemy.Humanoid.WalkSpeed = 0
                                enemy.HumanoidRootPart.CanCollide = false
                            end
                        until not _G.AutoMaterial or not enemy.Parent or enemy.Humanoid.Health <= 0
                    end
                end
            end)
        end
    end
end)

-- Boss Farm
local bossList = {}
if Sea1 then bossList = {"The Gorilla King", "Bobby", "Yeti", "Vice Admiral", "Saber Expert", "Magma Admiral", "Fishman Lord", "Thunder God"}
elseif Sea2 then bossList = {"Diamond", "Jeremy", "Fajita", "Don Swan", "Smoke Admiral", "Awakened Ice Admiral", "Tide Keeper"}
elseif Sea3 then bossList = {"Stone", "Hydra Leader", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate", "Cake Queen", "Longma", "Soul Reaper"}
end

FarmTab:AddDropdown("BossSelect", {
    Title = "👑 Chọn Boss",
    Values = bossList,
    Default = 1,
    Callback = function(v)
        _G.SelectBoss = v
    end
})

FarmTab:AddToggle("AutoBoss", {
    Title = "👑 Auto Farm Boss",
    Description = "Tự động tìm và đánh boss",
    Default = false,
    Callback = function(v)
        _G.AutoBoss = v
    end
})

spawn(function()
    while task.wait() do
        if _G.AutoBoss then
            pcall(function()
                if Workspace.Enemies:FindFirstChild(_G.SelectBoss) then
                    for _, boss in pairs(Workspace.Enemies:GetChildren()) do
                        if boss.Name == _G.SelectBoss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                            repeat
                                task.wait(_G.Fast_Delay)
                                AttackNoCoolDown()
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                boss.HumanoidRootPart.CanCollide = false
                                boss.Humanoid.WalkSpeed = 0
                                boss.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                Tween(boss.HumanoidRootPart.CFrame * Pos)
                            until not _G.AutoBoss or not boss.Parent or boss.Humanoid.Health <= 0
                        end
                    end
                elseif ReplicatedStorage:FindFirstChild(_G.SelectBoss) then
                    Tween(ReplicatedStorage[_G.SelectBoss].HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                end
            end)
        end
    end
end)

-- Elite Hunter (Sea3)
if Sea3 then
    FarmTab:AddToggle("AutoElite", {
        Title = "🎯 Auto Elite Hunter",
        Description = "Tự động săn Elite Boss (Diablo/Deandre/Urban)",
        Default = false,
        Callback = function(v)
            _G.AutoElite = v
        end
    })
    
    spawn(function()
        while task.wait() do
            if _G.AutoElite then
                pcall(function()
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter")
                    if LP.PlayerGui.Main.Quest.Visible then
                        local questText = LP.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                        if string.find(questText, "Diablo") or string.find(questText, "Deandre") or string.find(questText, "Urban") then
                            for _, elite in pairs(Workspace.Enemies:GetChildren()) do
                                if (elite.Name == "Diablo" or elite.Name == "Deandre" or elite.Name == "Urban") and elite:FindFirstChild("Humanoid") and elite.Humanoid.Health > 0 then
                                    repeat
                                        task.wait(_G.Fast_Delay)
                                        AttackNoCoolDown()
                                        EquipTool(SelectWeapon)
                                        AutoHaki()
                                        Tween2(elite.HumanoidRootPart.CFrame * Pos)
                                        elite.Humanoid.WalkSpeed = 0
                                        elite.HumanoidRootPart.CanCollide = false
                                        elite.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    until not _G.AutoElite or elite.Humanoid.Health <= 0 or not elite.Parent
                                end
                            end
                        end
                    end
                end)
            end
        end
    end)
end

-- ================================
-- ⚙️ SETTING FARM
-- ================================
local SettingTab = Window:AddTab({ Title = "⚙️ Settings", Icon = "settings" })

SettingTab:AddSlider("WalkSpeed", {
    Title = "🏃 Tốc độ di chuyển",
    Default = 16,
    Min = 16,
    Max = 300,
    Rounding = 1,
    Callback = function(v)
        _G.WalkSpeed = v
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid.WalkSpeed = v
        end
    end
})

SettingTab:AddSlider("JumpPower", {
    Title = "🦘 Nhảy cao",
    Default = 50,
    Min = 50,
    Max = 500,
    Rounding = 1,
    Callback = function(v)
        _G.JumpPower = v
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid.JumpPower = v
        end
    end
})

SettingTab:AddToggle("NoClip", {
    Title = "🌀 No Clip",
    Description = "Đi xuyên tường",
    Default = false,
    Callback = function(v)
        _G.NoClip = v
        spawn(function()
            while _G.NoClip and task.wait() do
                if LP.Character then
                    for _, part in pairs(LP.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end
        end)
    end
})

SettingTab:AddToggle("WaterWalk", {
    Title = "💧 Đi trên nước",
    Default = true,
    Callback = function(v)
        pcall(function()
            Workspace.Map["WaterBase-Plane"].Size = v and Vector3.new(1000, 112, 1000) or Vector3.new(1000, 80, 1000)
        end)
    end
})

SettingTab:AddToggle("WhiteScreen", {
    Title = "⬜ Màn hình trắng",
    Description = "Giảm lag khi farm",
    Default = false,
    Callback = function(v)
        _G.WhiteScreen = v
        RunService:Set3dRenderingEnabled(not v)
    end
})

SettingTab:AddToggle("AutoRejoin", {
    Title = "🔄 Auto Rejoin",
    Description = "Tự động rejoin khi bị kick",
    Default = true,
    Callback = function(v)
        _G.AutoRejoin = v
        if v then
            game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(prompt)
                if prompt.Name == "ErrorPrompt" and prompt:FindFirstChild("MessageArea") then
                    game:GetService("TeleportService"):Teleport(game.PlaceId)
                end
            end)
        end
    end
})

-- ================================
-- 📈 TAB STATS
-- ================================
local StatsTab = Window:AddTab({ Title = "📈 Stats", Icon = "chart" })

local infoParagraph = StatsTab:AddParagraph({
    Title = "📊 Thông tin nhân vật",
    Content = "Đang tải..."
})

spawn(function()
    while task.wait(1) do
        pcall(function()
            local level = LP.Data.Level.Value
            local beli = LP.Data.Beli.Value
            local frag = LP.Data.Fragments.Value
            local bounty = LP.leaderstats["Bounty/Honor"].Value
            local fruit = LP.Data.DevilFruit.Value
            local race = LP.Data.Race.Value
            infoParagraph:SetDesc(string.format(
                "👤 Tên: %s\n⭐ Level: %s\n💰 Beli: %s\n💎 Fragments: %s\n🏆 Bounty: %s\n🍎 Trái: %s\n🧬 Tộc: %s",
                LP.Name, level, beli, frag, bounty, fruit, race
            ))
        end)
    end
end)

StatsTab:AddToggle("AutoStats", {
    Title = "📈 Auto Stats",
    Description = "Tự động nâng Melee và Defense",
    Default = false,
    Callback = function(v)
        _G.AutoStats = v
        spawn(function()
            while _G.AutoStats and task.wait(0.5) do
                pcall(function()
                    local points = LP.Data.Points.Value
                    if points >= 3 then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Melee", 1)
                        task.wait(0.1)
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", "Defense", 1)
                    end
                end)
            end
        end)
    end
})

StatsTab:AddButton({
    Title = "🔄 Reset Stats",
    Description = "Làm mới chỉ số",
    Callback = function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "1")
        ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
    end
})

-- ================================
-- 🚀 TAB TELEPORT
-- ================================
local TeleportTab = Window:AddTab({ Title = "🚀 Teleport", Icon = "map-pin" })

TeleportTab:AddButton({
    Title = "🌊 Sea 1",
    Callback = function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelMain")
    end
})

TeleportTab:AddButton({
    Title = "🌊 Sea 2",
    Callback = function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
})

TeleportTab:AddButton({
    Title = "🌊 Sea 3",
    Callback = function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("TravelZou")
    end
})

local islandList = {}
if Sea1 then
    islandList = {"WindMill", "Jungle", "Desert", "Snow Island", "MarineFord", "Sky Island", "Prison", "Magma Village"}
elseif Sea2 then
    islandList = {"The Cafe", "Factory", "Zombie Island", "Snow Mountain", "Punk Hazard", "Cursed Ship", "Ice Castle"}
elseif Sea3 then
    islandList = {"Port Town", "Hydra Island", "Floating Turtle", "Haunted Castle", "Cake Island", "Tiki Outpost"}
end

TeleportTab:AddDropdown("IslandSelect", {
    Title = "🏝️ Chọn đảo",
    Values = islandList,
    Default = 1,
    Callback = function(v)
        _G.SelectIsland = v
    end
})

TeleportTab:AddButton({
    Title = "✨ Teleport đến đảo",
    Callback = function()
        local coords = {
            WindMill = CFrame.new(979.79, 16.51, 1429.04),
            Jungle = CFrame.new(-1612.79, 36.85, 149.12),
            Desert = CFrame.new(944.15, 20.91, 4373.30),
            ["Snow Island"] = CFrame.new(1347.80, 104.66, -1319.73),
            MarineFord = CFrame.new(-4914.82, 50.96, 4281.02),
            ["Sky Island"] = CFrame.new(-4869.10, 733.46, -2667.01),
            Prison = CFrame.new(4875.33, 5.65, 734.85),
            ["Magma Village"] = CFrame.new(-5247.71, 12.88, 8504.96),
            ["The Cafe"] = CFrame.new(-380.47, 77.22, 255.82),
            Factory = CFrame.new(424.12, 211.16, -427.54),
            ["Zombie Island"] = CFrame.new(-5622.03, 492.19, -781.78),
            ["Snow Mountain"] = CFrame.new(753.14, 408.23, -5274.61),
            ["Punk Hazard"] = CFrame.new(-6127.65, 15.95, -5040.28),
            ["Cursed Ship"] = CFrame.new(923.40, 125.05, 32885.87),
            ["Ice Castle"] = CFrame.new(6148.41, 294.38, -6741.11),
            ["Port Town"] = CFrame.new(-290.73, 6.72, 5343.55),
            ["Hydra Island"] = CFrame.new(5661.53, 1013.09, -334.96),
            ["Floating Turtle"] = CFrame.new(-13274.52, 531.82, -7579.22),
            ["Haunted Castle"] = CFrame.new(-9515.37, 164.00, 5786.06),
            ["Cake Island"] = CFrame.new(-1884.77, 19.32, -11666.89),
            ["Tiki Outpost"] = CFrame.new(-16542.44, 55.68, 1044.41)
        }
        if coords[_G.SelectIsland] then
            Tween2(coords[_G.SelectIsland])
        end
    end
})

TeleportTab:AddButton({
    Title = "🛑 Dừng Teleport",
    Callback = function()
        if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            local t = TweenService:Create(LP.Character.HumanoidRootPart, TweenInfo.new(0.1), {CFrame = LP.Character.HumanoidRootPart.CFrame})
            t:Play()
        end
    end
})

-- ================================
-- 👁️ TAB ESP AND FRUIT
-- ================================
local EspTab = Window:AddTab({ Title = "👁️ ESP & Fruit", Icon = "eye" })

EspTab:AddToggle("PlayerESP", {
    Title = "👤 ESP Người chơi",
    Default = false,
    Callback = function(v)
        _G.PlayerESP = v
        spawn(function()
            while _G.PlayerESP and task.wait(0.5) do
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LP and player.Character and player.Character:FindFirstChild("Head") then
                        local head = player.Character.Head
                        if not head:FindFirstChild("TMLEsp") then
                            local bill = Instance.new("BillboardGui", head)
                            bill.Name = "TMLEsp"
                            bill.Size = UDim2.new(0, 200, 0, 50)
                            bill.AlwaysOnTop = true
                            local text = Instance.new("TextLabel", bill)
                            text.Size = UDim2.new(1, 0, 1, 0)
                            text.BackgroundTransparency = 1
                            text.TextColor3 = player.Team == LP.Team and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
                            text.TextStrokeTransparency = 0.5
                            text.Font = Enum.Font.GothamBold
                            text.TextScaled = true
                        end
                        local dist = (LP.Character.HumanoidRootPart.Position - head.Position).Magnitude
                        head.TMLEsp.TextLabel.Text = player.Name .. " | " .. math.floor(dist) .. "m"
                    end
                end
            end
            for _, player in pairs(Players:GetPlayers()) do
                if player.Character and player.Character.Head:FindFirstChild("TMLEsp") then
                    player.Character.Head.TMLEsp:Destroy()
                end
            end
        end)
    end
})

EspTab:AddToggle("FruitESP", {
    Title = "🍎 ESP Trái cây",
    Default = false,
    Callback = function(v)
        _G.FruitESP = v
        spawn(function()
            while _G.FruitESP and task.wait(0.5) do
                for _, obj in pairs(Workspace:GetChildren()) do
                    if string.find(obj.Name, "Fruit") and obj:FindFirstChild("Handle") then
                        local handle = obj.Handle
                        if not handle:FindFirstChild("TMLEsp") then
                            local bill = Instance.new("BillboardGui", handle)
                            bill.Name = "TMLEsp"
                            bill.Size = UDim2.new(0, 150, 0, 30)
                            bill.AlwaysOnTop = true
                            local text = Instance.new("TextLabel", bill)
                            text.Size = UDim2.new(1, 0, 1, 0)
                            text.BackgroundTransparency = 1
                            text.TextColor3 = Color3.fromRGB(255, 100, 255)
                            text.Text = obj.Name
                            text.Font = Enum.Font.GothamBold
                            text.TextScaled = true
                        end
                    end
                end
            end
            for _, obj in pairs(Workspace:GetChildren()) do
                if obj:FindFirstChild("Handle") and obj.Handle:FindFirstChild("TMLEsp") then
                    obj.Handle.TMLEsp:Destroy()
                end
            end
        end)
    end
})

EspTab:AddToggle("ChestESP", {
    Title = "📦 ESP Rương",
    Default = false,
    Callback = function(v)
        _G.ChestESP = v
        spawn(function()
            while _G.ChestESP and task.wait(0.5) do
                for _, obj in pairs(Workspace:GetChildren()) do
                    if string.find(obj.Name, "Chest") then
                        if not obj:FindFirstChild("TMLEsp") then
                            local bill = Instance.new("BillboardGui", obj)
                            bill.Name = "TMLEsp"
                            bill.Size = UDim2.new(0, 100, 0, 30)
                            bill.AlwaysOnTop = true
                            local text = Instance.new("TextLabel", bill)
                            text.Size = UDim2.new(1, 0, 1, 0)
                            text.BackgroundTransparency = 1
                            text.TextColor3 = Color3.fromRGB(255, 215, 0)
                            text.Text = obj.Name
                            text.Font = Enum.Font.GothamBold
                            text.TextScaled = true
                        end
                    end
                end
            end
            for _, obj in pairs(Workspace:GetChildren()) do
                if obj:FindFirstChild("TMLEsp") then
                    obj.TMLEsp:Destroy()
                end
            end
        end)
    end
})

EspTab:AddToggle("AutoCollectFruit", {
    Title = "🏃 Auto nhặt trái",
    Default = false,
    Callback = function(v)
        _G.AutoCollectFruit = v
        spawn(function()
            while _G.AutoCollectFruit and task.wait(0.5) do
                for _, obj in pairs(Workspace:GetChildren()) do
                    if string.find(obj.Name, "Fruit") and obj:FindFirstChild("Handle") then
                        Tween2(obj.Handle.CFrame)
                        break
                    end
                end
            end
        end)
    end
})

-- ================================
-- 🧪 TAB RAID
-- ================================
local RaidTab = Window:AddTab({ Title = "🧪 Raid", Icon = "cpu" })

local chipList = {"Flame", "Ice", "Quake", "Light", "Dark", "Spider", "Rumble", "Magma", "Buddha", "Sand", "Phoenix", "Dough"}

RaidTab:AddDropdown("ChipSelect", {
    Title = "💾 Chọn Chip Raid",
    Values = chipList,
    Default = 1,
    Callback = function(v)
        SelectChip = v
    end
})

RaidTab:AddButton({
    Title = "💰 Mua Chip",
    Callback = function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", SelectChip)
    end
})

RaidTab:AddToggle("AutoStartRaid", {
    Title = "🎮 Auto Start Raid",
    Default = false,
    Callback = function(v)
        _G.Auto_StartRaid = v
        spawn(function()
            while _G.Auto_StartRaid and task.wait(2) do
                pcall(function()
                    if LP.Backpack:FindFirstChild("Special Microchip") or LP.Character:FindFirstChild("Special Microchip") then
                        if Sea2 then
                            local clicker = Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector
                            if clicker then fireclickdetector(clicker) end
                        elseif Sea3 then
                            local clicker = Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector
                            if clicker then fireclickdetector(clicker) end
                        end
                    end
                end)
            end
        end)
    end
})

RaidTab:AddToggle("AutoFarmRaid", {
    Title = "⚔️ Auto Farm Raid",
    Default = false,
    Callback = function(v)
        _G.AutoRaid = v
        spawn(function()
            while _G.AutoRaid and task.wait(0.5) do
                pcall(function()
                    local locations = Workspace['_WorldOrigin'].Locations
                    local islands = {"Island 1", "Island 2", "Island 3", "Island 4", "Island 5"}
                    for _, island in pairs(islands) do
                        if locations:FindFirstChild(island) then
                            Tween(locations[island].CFrame)
                            break
                        end
                    end
                    for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                        if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                            AttackNoCoolDown()
                            if _G.AutoHaki then AutoHaki() end
                        end
                    end
                end)
            end
        end)
    end
})

RaidTab:AddButton({
    Title = "✨ Thức tỉnh trái",
    Callback = function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("Awakener", "Awaken")
    end
})

RaidTab:AddButton({
    Title = "🚪 Đến phòng Raid",
    Callback = function()
        if Sea2 then
            Tween2(CFrame.new(-6438.73535, 250.645355, -4501.50684))
        elseif Sea3 then
            ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5075.50927734375, 314.5155029296875, -3150.0224609375))
            Tween2(CFrame.new(-5017.40869, 314.844055, -2823.0127))
        end
    end
})

-- Reset WalkSpeed khi chết
LP.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    if char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = _G.WalkSpeed or 16
        char.Humanoid.JumpPower = _G.JumpPower or 50
    end
end)

-- Thông báo
Fluent:Notify({
    Title = "🌟 TML HUB",
    Content = "Đã tải thành công! Chúc bạn chơi vui vẻ 🎮",
    Duration = 5
})

-- Lưu cấu hình
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("TMLHub")
SaveManager:SetFolder("TMLHub/BloxFruits")
InterfaceManager:BuildInterfaceSection(Window)
SaveManager:BuildConfigSection(Window)

Window:SelectTab(1)