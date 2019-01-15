 system.activate("multitouch")
local composer = require("composer")
display.setStatusBar(display.HiddenStatusBar)
local scene = composer.newScene()
local json = require("json")
local gameData = require("GameData")

local path = system.pathForFile("CharactersUnlocked.txt",system.DocumentsDirectory)
local file = io.open(path, "r")
local contents = ""

local path2 = system.pathForFile("GameCount.txt",system.DocumentsDirectory)
local file2 = io.open(path2, "r")
local contents2 = ""

local path3 = system.pathForFile("JumpCountEncode.deeznuts",system.DocumentsDirectory)
local file3 = io.open(path3, "r")
local contents3 = ""

local path4 = system.pathForFile("PlayerCollisionsEncode.deeznuts",system.DocumentsDirectory)
local file4 = io.open(path4, "r")
local contents4 = ""

local path5 = system.pathForFile("TrumpGameCount.deeznuts",system.DocumentsDirectory)
local file5 = io.open(path5, "r")
local contents5 = ""

math.randomseed(os.time())



if (file) then

local contents = file:read("*a")
local LevelUnlocked = json.decode(contents)
if(LevelUnlocked) then
for i = 0, 14, 1 do
	gameData.LevelUnlocked[i] = LevelUnlocked[i]
end
end
io.close(file)
end

file = nil

if (file2) then

local contents2 = file2:read("*a")
local GameCount = json.decode(contents2)
if(GameCount) then
for i = 0, 2, 1 do
	
	gameData.GameCount[i] = GameCount[i]
end
end
io.close(file2)
end

file2 = nil


if (file3) then

local contents3 = file3:read("*a")
local JumpCount = json.decode(contents3)
if(JumpCount) then
for i = 0, 2, 1 do
	
	gameData.JumpCount[i] = JumpCount[i]
end
end
io.close(file3)
end

file3 = nil

if (file4) then

local contents4 = file4:read("*a")
local PlayerCollisions = json.decode(contents4)
if(PlayerCollisions) then
for i = 0, 2, 1 do
	
	gameData.PlayerCollisions[i] = PlayerCollisions[i]
end
end
io.close(file4)
end

file4 = nil

if (file5) then

local contents5 = file5:read("*a")
local TrumpGameCount = json.decode(contents5)
if(TrumpGameCount) then
for i = 0, 2, 1 do
	
	gameData.TrumpGameCount[i] = TrumpGameCount[i]
end
end
io.close(file5)
end

file5 = nil



composer.gotoScene("MainMenu")
