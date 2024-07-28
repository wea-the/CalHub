-- This is where all the scripts for the supported games located. All the links here are protected.
local core = game:GetService("CoreGui")
if not game:IsLoaded() then
    local mes = Instance.new("Message")
    mes.Parent = core
    mes.Text = "CalHub is Waiting for the Game to load..."
    game.Loaded:Wait()
    mes:Destroy()
end
repeat task.wait() until
game.Players.LocalPlayer

local gameList = {
    -- Eternal Bob (Slap Battles)
    [13833961666] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/wea-the/CalHub/main/Scripts/EternalBob.txt'))()"
}

if gameList[game.PlaceId] ~= nil then
    loadstring(gameList[tonumber(game.PlaceId)])()
else
    game.Players.LocalPlayer:Kick("Game Not Supported! :(")
end
