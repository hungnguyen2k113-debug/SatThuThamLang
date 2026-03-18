repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

getgenv().Key = "c1f68f415eb35e522bb88d98"

local inputKey = getgenv().KeyInput or ""

if inputKey ~= getgenv().Key then
	LocalPlayer:Kick("The key is incorrect or has already been used.")
	return
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/hungnguyen2k113-debug/SatThuThamLang/main/clear.lua"))()