

local composer = require ("composer")
local scene = composer.newScene()

local widget  = require ("widget")

function gotoMainMenu(event)
	if ("ended" == event.phase) then
	print("working")

	composer.gotoScene("MainMenu")
end
end



function scene:create (event)
	print ("scene1 create...wow")
	local sceneGroup = self.view
	local background = display.newImage("Settings_Menu.png", display.contentCenterX, display.contentCenterY)
	background.width = display.contentWidth
	background.height = display.contentHeight
	
	local backbutton = widget.newButton({
    	left = 0,
    	top =  display.contentCenterY/.63,
    	height = display.contentHeight/5,
    	width = display.contentWidth/5,
    	defaultFile = "backbutton.png",
    	overFile = "backbutton.png",
    	onRelease = gotoMainMenu
    	})
	


    sceneGroup: insert(background)
	sceneGroup:insert(background)
	sceneGroup:insert(backbutton)

end






function scene:enterScene(event)
	local group = self.view
end


function scene:exitScene(event)
	local group = self.view
end



function scene:destroy(event)
	local group = self.view
end

scene:addEventListener("create", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroy", scene)
return scene











