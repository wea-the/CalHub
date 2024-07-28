--//This is where all the scripts for the supported games located. All the links here are protected.\\
local teleportFunc = queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport
if teleportFunc then
    teleportFunc(
        if not game:IsLoaded() then
            game.Loaded:Wait()
        end
        repeat task.wait() until
        game.Players.LocalPlayer
    )
end

local gameList = {
    [13833961666] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/wea-the/CalHub/main/Scripts/Eternal-Bob.lua'))()",
    [2380077519] = "loadstring(game:HttpGet('https://pastebin.com/raw/ejSuqKqh'))()"
}

if gameList[game.GameId] ~= nil then
    loadstring(gameList[tonumber(game.GameId)])()
else
    game.Players.LocalPlayer:Kick("Game Not Supported! :(")
end
