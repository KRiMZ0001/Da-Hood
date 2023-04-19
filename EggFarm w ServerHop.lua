repeat wait() until game:IsLoaded()

local serverSizeThreshold = 30
local rejoinseconds = 15
local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/2788229376/servers/Public?sortOrder=Asc&limit=100"))

while true do
    for i, v in pairs(game:GetService("Workspace").Ignored:GetChildren()) do
        if v:IsA("MeshPart") and v.Name ~= "Part" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            wait(1)
        end
    end

    wait(rejoinseconds)

    for i,v in pairs(Servers.data) do
        if v.playing < v.maxPlayers - serverSizeThreshold then
            game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id)
        end
    end
end
