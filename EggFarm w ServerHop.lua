local GameId = 2788229376 
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

while true do
    Players.PlayerAdded:Wait()

    TeleportService:Teleport(GameId)

    repeat wait() until game:IsLoaded()

    while true do wait()
        for i, v in pairs(game:GetService("Workspace").Ignored:GetChildren()) do
            if v:IsA("MeshPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                wait(1)
            end
        end
    end
end
