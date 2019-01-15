local composer = require("composer")
display.setStatusBar(display.HiddenStatusBar)
local scene = composer.newScene()
local gameData = require("GameData")
local widget = require("widget")




function StatsButtonFunction (event)

	composer.gotoScene("Stats")
	composer.removeScene("SettingsMenu")

end

local function handleButtonEvent(event) 
	
	if("ended" == event.phase ) then
	
		composer.gotoScene("MainMenu")
		composer.removeScene("Stats")

	end
end

function CreditsButtonFunction(event)

	if("ended" == event.phase) then

	composer.gotoScene("Credits")

	end
end




function scene:create(event)

local group = self.view

local Font = native.newFont("SoftMarshmallow.otf")


local background = display.newImage("SETTINGS_MENU.png",display.contentCenterX,display.contentCenterY)

background.width = display.contentWidth
background.height = display.contentHeight


local StatsButton = widget.newButton
	{

	left = display.contentCenterX,
    top =  display.contentCenterY/.63,
	id = "playbutton",
	defaultFile = "STATS_BUTTON.png",
	overFile = "STATS_BUTTON.png",
	onRelease = StatsButtonFunction

	}

StatsButton.x = display.contentCenterX
StatsButton.y = display.contentCenterY/.95
StatsButton.width = display.contentWidth/2.5
StatsButton.height = display.contentWidth/4

local CreditsButton = widget.newButton
	{

	left = display.contentCenterX,
    top =  display.contentCenterY/.63,
	height = display.contentHeight/5,
    width = display.contentWidth/5,
	defaultFile = "CREDITS_BUTTON.png",
	overFile = "CREDITS_BUTTON.png",
	onRelease = CreditsButtonFunction

	}

CreditsButton.x = display.contentCenterX
CreditsButton.y = display.contentCenterY/.65
CreditsButton.width = display.contentWidth/2.5
CreditsButton.height = display.contentWidth/4

local ReturntoMenu = widget.newButton
	{
	left = 0,
    top =  display.contentCenterY/.63,
	id = "playbutton",
	height = display.contentHeight/5,
    width = display.contentWidth/5,
	defaultFile = "backbutton.png",
	overFile = "backbutton.png",
	onRelease = handleButtonEvent
	}





group:insert(background)
group:insert(CreditsButton)
group:insert(StatsButton)
group:insert(ReturntoMenu)

end

scene:addEventListener("create", scene)

return scene