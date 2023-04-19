-- Ac
loadstring(game:HttpGet("https://raw.githubusercontent.com/KRiMZ0001/Da-Hood/main/Ac.lua"))()


local vu = game:GetService("VirtualUser")
local Lpr = game:GetService("Players").LocalPlayer
local Drop = game:GetService("Workspace").Ignored.Drop
local Cashiers = game:GetService("Workspace").Cashiers
local opens = Cashiers:GetDescendants()
local num_opens = #opens

local function clickLoop()
    while true do
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
       for i = 1, num_opens do
           if opens[i].Name == "Open" then
               Lpr.Character.HumanoidRootPart.CFrame = opens[i].CFrame
               wait(12)
           end
       end
   i = 1
   wait(10)
   end
end

local function EggFarm()
    while true do wait()
        for i, v in pairs(game:GetService("Workspace").Ignored:GetChildren()) do
            if v:IsA("MeshPart") then
                _G.EggFarm = false
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                wait(1)
                _G.EggFarm = true
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


