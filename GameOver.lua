local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")
local gameData = require("GameData")
local json = require ("json")

local function handleButtonEvent(event) 
	local levelselector = gameData.levelselector
	local LevelArray2 = gameData.LevelArray2

	if("began" == phase) then


end
	if("ended" == event.phase ) then
	
		composer.gotoScene("MainMenu")
		audio.pause(2)
		composer.removeScene(LevelArray2[levelselector])
		composer.hideOverlay("GameOver")
		composer.removeScene("characterselector")
		gameData.levelselector = math.random(9)
	end
end

local function RestartGame(event)
	local levelselector = gameData.levelselector
	local LevelArray2 = gameData.LevelArray2

	if("ended" == event.phase) then

		
		composer.hideOverlay("GameOver2")
		composer.removeScene(LevelArray2[levelselector])
		composer.removeScene("characterselector")
		gameData.levelselector = math.random(9)
		composer.gotoScene("ReloadScene")

	end
end

function SaveGame ()

	local CharactersUnlocked = {}
	local GameCount = {}
	local JumpCount = {}
	local PlayerCollisions = {}
	local TrumpGameCount = {}

	for i = 1, 2, 1 do
		GameCount[i] = gameData.GameCount[i]
		JumpCount[i] = gameData.JumpCount[i]
		PlayerCollisions[i] = gameData.PlayerCollisions[i]
		TrumpGameCount = gameData.TrumpGameCount
	end

	for i = 1, 15, 1 do
		CharactersUnlocked[i] = gameData.LevelUnlocked[i]
		
	end

	local GameCountEncode = json.encode(GameCount)
	local CharactersUnlockedEncode = json.encode(CharactersUnlocked)
	local JumpCountEncode = json.encode(JumpCount)
	local PlayerCollisionsEncode = json.encode(PlayerCollisions)
	local TrumpGameCountEncode = json.encode(TrumpGameCount)

	local path = system.pathForFile("CharactersUnlocked.txt", system.DocumentsDirectory)
	local path2 = system.pathForFile("GameCount.txt", system.DocumentsDirectory)
	local path3 = system.pathForFile("JumpCountEncode.deeznuts", system.DocumentsDirectory)
	local path4 = system.pathForFile("PlayerCollisionsEncode.deeznuts", system.DocumentsDirectory)
	local path5 = system.pathForFile("TrumpGameCount.deeznuts", system.DocumentsDirectory)

	local file, errorString = io.open(path,"w")
	local file2, errorString2 = io.open(path2,"w")
	local file3, errorString3 = io.open(path3, "w")
	local file4, errorString4 = io.open(path4, "w")
	local file5, errorString5 = io.open(path5, "w")

	if not file then
		print("File error: " .. errorString)
	else
		file:write(CharactersUnlockedEncode)
		io.close(file)
	end

	if not file2 then
		print("File error: " .. errorString2)
	else
		file2:write(GameCountEncode)
		io.close(file2)
	end

	if not file3 then
		print("File error: " .. errorString3)
	else
		file3:write(JumpCountEncode)
		io.close(file3)
	end

	if not file4 then
		print("File error: " .. errorString4)
	else
		file4:write(PlayerCollisionsEncode)
		io.close(file4)
	end

	if not file5 then
		print("File error: " .. errorString5)
	else
		file5:write(TrumpGameCountEncode)
		io.close(file5)
	end

	file = nil
	file2 = nil
	file3 = nil
	file4 = nil
	file5 = nil

end




local function StatsPage(event) 
	local levelselector = gameData.levelselector
	local LevelArray2 = gameData.LevelArray2

	if("ended" == event.phase) then

		composer.removeScene(LevelArray2[levelselector])
		composer.removeScene("characterselector")
		composer.hideOverlay("GameOver")
		composer.gotoScene("Stats")
		audio.pause(2)
		audio.resume(1)
		gameData.levelselector = math.random(9)
	end
end

function scene:create(event) 

	local group = self.view
	local background = display.newImage("Transparent.png", display.contentWidth, display.contentHeight)
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	background.width = display.contentWidth
	background.height =  display.contentHeight
	
	SaveGame()

	local ReturntoMenu = widget.newButton
	{
	left = 125,
	top = 225,
	id = "playbutton",
	defaultFile = "Main_Menu_Button.png",
	overFile = "Main_Menu_Button_Fade.png",
	onRelease = handleButtonEvent
	}

	ReturntoMenu.width = display.contentWidth/2
	ReturntoMenu.height = display.contentHeight/3
	ReturntoMenu.x = display.contentCenterX
	ReturntoMenu.y = display.contentCenterY/.6

	local Player1Wins = widget.newButton
	{

	left = 125,
	top = 225,
	id = "Player1Wins",
	defaultFile = "Player_1_Wins.png"

	}

	Player1Wins.width = display.contentWidth/1.5
	Player1Wins.height = display.contentHeight/3
	Player1Wins.x = display.contentCenterX
	Player1Wins.y = display.contentCenterY/3

	local Stats = widget.newButton
	{

	left = 125,
	top = 225,
	id = "Stats",
	defaultFile = "Stats.png",
	onRelease = StatsPage

	}

	Stats.width = display.contentWidth/3
	Stats.height = display.contentHeight/4
	Stats.x = display.contentCenterX
	Stats.y = display.contentCenterY/1.25

	local Restart = widget.newButton
	{

	left = 125,
	top = 225,
	id = "Stats",
	defaultFile = "Restart.png",
	onRelease = RestartGame

	}

	Restart.width = display.contentWidth/3
	Restart.height = display.contentHeight/4
	Restart.x = display.contentCenterX
	Restart.y = display.contentCenterY/.83


	group:insert(background)
	group:insert(ReturntoMenu)
	group:insert(Player1Wins)
	group:insert(Stats)
	group:insert(Restart)
end

function scene:hide(event)
	local group = self.view
	local parent = event.parent
	if(background) then
		background:destroySelf()
	end
end
function scene:destroy(event)
	local group = self.view
	if(ReturntoMenu) then
		ReturntoMenu:destroySelf()
	end
	if(background) then
		background:destroySelf()
	end


end

function catchBackgroundOverlay(event)
	return true
end
scene:addEventListener( "create", scene )
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene