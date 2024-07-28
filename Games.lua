--// This is where all the scripts for the supported games located. All the links here are protected. \\
local teleportFunc = queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport
local core = game:GetService("CoreGui")

local games = {
    [13833961666] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/wea-the/CalHub/main/Scripts/Eternal-Bob.lua'))()",
    [6403373529] = "loadstring(game:HttpGet('https://pastebin.com/raw/ejSuqKqh'))()"
}

if teleportFunc then
    teleportFunc(
        if not game:IsLoaded() then
            local mes = Instance.new("Message")
            mes.Parent = core
            mes.Text = "CalHub is Waiting for the Game to load..."
            game.Loaded:Wait()
            mes:Destroy()
        end
        repeat task.wait() until
        game.Players.LocalPlayer
    )
end

if games[game.PlaceId] ~= nil then
    loadstring(games[tonumber(game.PlaceId)])()
else
    game.Players.LocalPlayer:Kick("Game Not Supported! :(")
end
