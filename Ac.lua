if (game.PlaceId ~= 2788229376) then
    return
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local tablefind = table.find
local MainEvent = ReplicatedStorage.MainEvent

local Flags = {
    "CHECKER_1",
    "TeleportDetect",
    "OneMoreTime"
}

local __namecall
__namecall = hookmetamethod(game, "__namecall", function(...)
    local args = {...}
    local self = args[1]
    local method = getnamecallmethod()

        return
    end

    if (not checkcaller() and getfenv(2).crash) then
        local fenv = getfenv(2)
        fenv.crash = function() end
        setfenv(2, fenv)
    end

    return __namecall(...)
end)

local __newindex
__newindex = hookmetamethod(game, "__newindex", function(t, k, v)
    if (not checkcaller() and t:IsA("Humanoid") and (k == "WalkSpeed" or k == "JumpPower")) then
        return
    end

    return __newindex(t, k, v)
end)
