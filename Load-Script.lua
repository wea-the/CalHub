-- This is where all the scripts for the supported games located. All the links here are protected.
if not game:IsLoaded() then
    game.Loaded:Wait()
end
repeat task.wait() until
game.Players.LocalPlayer

local gameList = {
    -- Eternal Bob (Slap Battles)
    [13833961666] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/wea-the/CalHub/main/Scripts/Eternal-Bob.lua'))()",
    [2380077519] = "loadstring(game:HttpGet('https://pastebin.com/raw/ejSuqKqh'))()"
}

if gameList[game.GameId] ~= nil then
    loadstring(gameList[tonumber(game.GameId)])()
else
    game.Players.LocalPlayer:Kick("Game Not Supported! :(")
end
