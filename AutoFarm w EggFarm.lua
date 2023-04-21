
repeat wait() until game:IsLoaded()

_G.EggFarm = true
--// Anti-Cheat Bypass
loadstring(game:HttpGet("https://raw.githubusercontent.com/KRiMZ0001/Da-Hood/main/Ac.lua"))()

--// Earned Cash
loadstring(game:HttpGet("https://raw.githubusercontent.com/KRiMZ0001/Da-Hood/main/CashEarned.lua"))()

local vu = game:GetService("VirtualUser")
local Lpr = game:GetService("Players").LocalPlayer
local Drop = game:GetService("Workspace").Ignored.Drop
local Cashiers = game:GetService("Workspace").Cashiers
local opens = Cashiers:GetDescendants()
local num_opens = #opens

local function clickLoop()
    while true do wait()
        vu:Button1Down(Vector2.new(500, 0), game.Workspace.CurrentCamera.CFrame)
        wait()
        vu:Button1Up(Vector2.new(500, 0), game.Workspace.CurrentCamera.CFrame)
        wait()
    end
end

function Farm1()
   while _G.EggFarm do
       for _,f in pairs(Lpr:FindFirstChildOfClass("Backpack"):GetChildren()) do
           if f:IsA("Tool") or f:IsA("HopperBin") then
               if f.Name == "Combat" then
                   f.Parent = Lpr.Character
               end
           end
       end
       wait()
   end
end

function Farm1Loop()
   while true do wait()
       for _,obj in pairs(Drop:GetDescendants()) do
           if obj:IsA("ClickDetector") then
               local pos1 = obj.Parent.Position
               local pos2 = Lpr.Character.HumanoidRootPart.Position
               local distance = (pos1 - pos2).Magnitude
               if distance <= 20 then
                   fireclickdetector(obj)
               end
           end
       end
       mouse1click()
       wait()
   end
end

function OpensLoop()
    while _G.EggFarm do
        local foundHumanoid = false
        for _, cashier in pairs(game:GetService("Workspace").Cashiers:GetChildren()) do
            local humanoid = cashier:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.Health > 0 and humanoid.Health <= 100 then
                local open = cashier:FindFirstChild("Open")
                if open then
                    Lpr.Character.HumanoidRootPart.CFrame = open.CFrame
                    wait(10)
                    foundHumanoid = true
                end
            end
        end
        if not foundHumanoid then
            Lpr.Character.HumanoidRootPart.CFrame = CFrame.new(173.577759, 161.624985, -730.403442, 0, 0, 1, 1, 0, 0, 0, 1, 0)
            wait(3)
        end
        wait()
    end    
end

local function EggFarm()
local eggPartNamePattern = "Egg%d+"
local eggPart = nil
local eggsCollected = 0

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")

local TotalCashEarnedLabel = Instance.new("TextLabel")
TotalCashEarnedLabel.Name = "TotalCashEarnedLabel"
TotalCashEarnedLabel.Size = UDim2.new(0, 200, 0, 50)
TotalCashEarnedLabel.Position = UDim2.new(0.8, 0, 0, 59)
TotalCashEarnedLabel.Font = Enum.Font.SourceSans
TotalCashEarnedLabel.TextSize = 20
TotalCashEarnedLabel.TextColor3 = Color3.new(1, 1, 1)
TotalCashEarnedLabel.BackgroundTransparency = 0.5
TotalCashEarnedLabel.Text = "Total Eggs Collected: 0"
TotalCashEarnedLabel.Parent = ScreenGui

while true do
    wait()
    for i, v in pairs(game:GetService("Workspace").Ignored:GetChildren()) do
        if v:IsA("MeshPart") and v.Name:match(eggPartNamePattern) then wait(1.5)
            _G.EggFarm = false
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            wait(1)
            _G.EggFarm = true
            eggsCollected = eggsCollected + 1
            TotalCashEarnedLabel.Text = "Total Eggs Collected: " .. eggsCollected
            break
        end
    end
end
end

coroutine.wrap(Farm1)()
coroutine.wrap(Farm1Loop)()
coroutine.wrap(OpensLoop)()
coroutine.wrap(clickLoop)()
wait(2)
coroutine.wrap(EggFarm)()

