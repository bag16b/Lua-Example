local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")
local gameData = require("GameData")

local function handleButtonEvent(event) 

	local levelselector = gameData.levelselector
	local LevelArray2 = gameData.LevelArray2

	if("began" == phase) then


end
	if("ended" == event.phase ) then
	
		composer.gotoScene("MainMenu")
		audio.pause(2)
		composer.removeScene(LevelArray2[levelselector])
		composer.removeScene("characterselector")
		composer.removeScene("PauseMenu")
		gameData.levelselector = math.random(9)

	end
end
local function ResumeButtonFunction(event) 
	if("began" == phase) then


end
	if("ended" == event.phase ) then

	
		composer.hideOverlay("PauseMenu")
		
	end
end

local function musicbutton(event)
	print(onbool)


	if("ended" == event.phase and onbool == 0) then
		
		print("turn on")
		MusicNo.alpha = 0
		MusicYes.alpha = 1
		onbool = 1
		audio.setVolume(1)
		

	elseif("ended" == event.phase and onbool == 1) then
		print("turn off")
		MusicNo.alpha = 1
		MusicYes.alpha = 0
		onbool = 0
		audio.setVolume(0)
end
end


local function setMusicBool()


if(onbool == 0) then
	MusicYes.alpha = 0
	MusicNo.alpha = 1
end

if(onbool == 1) then
	MusicYes.alpha = 1
	MusicNo.alpha = 0
end

end

function scene:create(event) 
	local group = self.view
	local background = display.newImage("Pause_Menu.png", 200, 200)
 
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	background.width = display.contentWidth/2
	background.height = display.contentHeight/2

	onbool = gameData.MusicBool
	
	


	local ReturntoMenu = widget.newButton
	{
	--shape = "roundedRect",
	left = 100,
	top = 225,
	width = 200,
	height = 100,
	id = "playbutton",
	defaultFile = "Main_Menu_Button.png",
	overFile = "Main_Menu_Button_Fade.png",
	--label = "Play",
	onRelease = handleButtonEvent,
	--fillColor = { default={1,0,0,1}, over={0,1,0,1}},
	
	

	}

	ReturntoMenu.x = display.contentCenterX
	ReturntoMenu.y = display.contentCenterY/0.725
	ReturntoMenu.width = display.contentWidth/3
	ReturntoMenu.height = display.contentHeight/6

	local ResumeButton = widget.newButton
	{
	--shape = "roundedRect",
	left = 135,
	top = 160,
	width = 175,
	height = 75,
	id = "playbutton",
	defaultFile = "Resume_Button.png",
	overFile = "Resume_Button_Fade.png",
	--label = "Play",
	onRelease = ResumeButtonFunction,
	--fillColor = { default={1,0,0,1}, over={0,1,0,1}},
	
	}

	ResumeButton.x = display.contentCenterX
	ResumeButton.y = display.contentCenterY/0.9
	ResumeButton.width = display.contentWidth/3
	ResumeButton.height = display.contentHeight/6



	MusicYes = widget.newButton
	{
	--shape = "roundedRect",
	left = 340,
	top = 50,
	width = 175,
	height = 125,
	id = "playbutton",
	defaultFile = "FULL_CHECKBOX.png",
	overFile = "FULL_CHECKBOX.png",
	--label = "Play",
	onRelease = musicbutton,
	--fillColor = { default={1,0,0,1}, over={0,1,0,1}},
	
	}

	MusicYes.x = display.contentCenterX/.8
	MusicYes.y = display.contentCenterY/1.15
	MusicYes.width = display.contentHeight/7
	MusicYes.height = display.contentHeight/9
	

	MusicNo = widget.newButton
	{
	--shape = "roundedRect",
	left = 340,
	top = 50,
	width = 175,
	height = 125,
	defaultFile = "EMPTY_CHECKBOX.png",
	overFile = "EMPTY_CHECKBOX.png",
	--label = "Play",
	onRelease = musicbutton,
	--fillColor = { default={1,0,0,1}, over={0,1,0,1}},
	
	}

	MusicNo.x = display.contentCenterX/.8
	MusicNo.y = display.contentCenterY/1.15
	MusicNo.width = display.contentHeight/7
	MusicNo.height = display.contentHeight/9
	
	setMusicBool()


	
	group:insert(background)
	group:insert(ReturntoMenu)
	group:insert(ResumeButton)
	group:insert(MusicYes)
	group:insert(MusicNo)

end

function scene:hide(event)
	local group = self.view
	local parent = event.parent
	parent:overlayEnded()
end
function scene:destroy(event)
	if(ReturntoMenu) then
		ReturntoMenu:destroySelf()
	end
	gameData.MusicBool = onbool
end

function catchBackgroundOverlay(event)
	return true
end
scene:addEventListener( "create", scene )
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
return scene