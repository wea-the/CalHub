--// This is where all the scripts for the supported games located. All the links here are protected. \\

local games = {
    [13833961666] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/wea-the/CalHub/main/Scripts/Eternal-Bob.lua'))()",
    [6403373529] = "loadstring(game:HttpGet('https://pastebin.com/raw/ejSuqKqh'))()"
}

local teleportFunc = queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport
local core = game:GetService("CoreGui")
if games[game.PlaceId] ~= nil then
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
            wait(0.10)
            loadstring(games[tonumber(game.PlaceId)])()
        )
    end
else
    game.Players.LocalPlayer:Kick("Game Not Supported! :(")
end
