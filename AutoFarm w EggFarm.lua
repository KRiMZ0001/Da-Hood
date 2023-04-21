repeat wait() until game:IsLoaded()

_G.EggFarm = true
_G.Clicker = true
--// Anti-Cheat Bypass
loadstring(game:HttpGet("https://raw.githubusercontent.com/KRiMZ0001/Da-Hood/main/Ac.lua"))()

--// Earned Cash
loadstring(game:HttpGet("https://raw.githubusercontent.com/KRiMZ0001/Da-Hood/main/CashEarned.lua"))()

--// Destroy Every Single Seat
for _,a in pairs(workspace:GetDescendants()) do
    if a:IsA("Seat") then
        a:Remove()
    end
end


local vu = game:GetService("VirtualUser")
local Lpr = game:GetService("Players").LocalPlayer
local cashiers = game:GetService("Workspace").Cashiers
local lprRoot = Lpr.Character.HumanoidRootPart
local Drop = game:GetService("Workspace").Ignored.Drop
local Cashiers = game:GetService("Workspace").Cashiers
local opens = Cashiers:GetDescendants()
local initialWaitTime = 0.5
local tweenDuration = 1
local num_opens = #opens

local function moveTo(position)
    local tweenInfo = TweenInfo.new(tweenDuration)
    local tween = game:GetService("TweenService"):Create(lprRoot, tweenInfo, {CFrame = position})
    tween:Play()
    tween.Completed:Wait()
end

local function clickLoop()
    while _G.Clicker do wait()
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
    for _, cashier in pairs(cashiers:GetChildren()) do
        local humanoid = cashier:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.Health > 0 and humanoid.Health <= 100 then
            local open = cashier:FindFirstChild("Open")
            if open then
                moveTo(open.CFrame)
                wait(0.5) -- Wait a short amount of time to ensure that we've arrived at the cashier
                lprRoot.Anchored = true -- Anchor the player's root part
                wait(9) -- Wait for 9 seconds
                lprRoot.Anchored = false -- Unanchor the player's root part
                wait(3) -- Wait for 3 seconds before continuing
                foundHumanoid = true
            end
        end
    end
    if not foundHumanoid then
        moveTo(CFrame.new(173.577759, 161.624985, -730.403442)) -- Move to the starting position using a tween
        wait(3) -- Wait for 3 seconds before continuing
    end
    wait(initialWaitTime)
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
        if v:IsA("MeshPart") and v.Child == "TouchInterest" then wait(0.5)
            _G.EggFarm = false
            firetouchinterest(lprRoot, v, 0)
            wait(.5)
            firetouchinterest(lprRoot, v, 1)
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
