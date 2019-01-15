local composer = require("composer")
display.setStatusBar(display.HiddenStatusBar)
local scene = composer.newScene()
local gameData = require("GameData")
local widget = require("widget")

local function handleButtonEvent(event) 
	
	if("ended" == event.phase ) then
	
		composer.gotoScene("MainMenu")
		composer.removeScene("Stats")

	end
end


function scene:create(event)

local group = self.view

local Font = native.newFont("SoftMarshmallow.otf")


local GameCount = display.newText(gameData.GameCount[1], display.contentCenterX/.86,display.contentCenterY/.725, Font,display.contentWidth/10)

local JumpCount = display.newText(gameData.JumpCount[1], display.contentCenterX/.86,display.contentCenterY/1.25,Font,display.contentWidth/10)


local background = display.newImage("STATS_PAGE.png",display.contentCenterX,display.contentCenterY)

background.width = display.contentWidth
background.height = display.contentHeight


-- GameCount:setFillColor(1,0,0)
-- JumpCount:setFillColor(1,0,0)

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
group:insert(GameCount)
group:insert(JumpCount)
group:insert(ReturntoMenu)

end

function scene:destroy(event)

end

scene:addEventListener("create", scene)
scene:addEventListener("destroy", scene)

return scene