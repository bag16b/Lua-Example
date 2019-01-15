
local composer = require ("composer")
local scene = composer.newScene()
local gameData = require("GameData")
local widget  = require ("widget")

function gotoMainMenu(event)
	if ("ended" == event.phase) then

	composer.gotoScene("MainMenu")
	composer.removeScene("levelselect")
end
end

function CharPlusOne(event)
	if("ended" == event.phase) then
		if(levelnum > table.getn(gameData.LevelArray) - 1) then
			levelnum = 1
			
		else
			levelnum = levelnum + 1
		
		end
	end
		if(backgroundselect) then
		backgroundselect:removeSelf()
		backgroundselect = display.newImage(gameData.LevelArray[levelnum], display.contentCenterX,display.contentCenterY)
		backgroundselect.width = display.contentWidth
		backgroundselect.height = display.contentHeight
		sceneGroup:insert(1,backgroundselect)
		
		end
	if(Names) then
		Names:removeSelf()

			Names = display.newText(LevelText[levelnum], display.contentCenterX,display.contentCenterY*1.5, Font, 150)
			Names:setFillColor(1,0,0)
	
		
		sceneGroup:insert(Names)
	end
end

function CharMinusOne(event)
	if("ended" == event.phase) then
		if(levelnum < 2) then
			levelnum = table.getn(gameData.LevelArray)
			
		else
			levelnum = levelnum - 1
			
		end
	end
	if(backgroundselect) then
		backgroundselect:removeSelf()
		backgroundselect = display.newImage(gameData.LevelArray[levelnum], display.contentCenterX,display.contentCenterY)
		
		backgroundselect.width = display.contentWidth
		backgroundselect.height = display.contentHeight
		sceneGroup:insert(1,backgroundselect)
		
	end
	if(Names) then
		Names:removeSelf()
		
			Names = display.newText(LevelText[levelnum], display.contentCenterX,display.contentCenterY*1.5, Font, 150)
			Names:setFillColor(1,0,0)
			
		sceneGroup:insert(Names)
	end
	
end



function scene:create (event)
	sceneGroup = self.view
	LevelText = {"Grassy","Moon","Soccer","Beach", "Cloud", "Underwater", "Volcano", "Zoo", "Wall"}
	

	levelnum = 1

	backgroundselect = display.newImage(gameData.LevelArray[levelnum], display.contentCenterX, display.contentCenterY)
	backgroundselect.width = display.contentWidth
	backgroundselect.height = display.contentHeight

	Font = native.newFont("SoftMarshmallow.otf")

	Names = display.newText(LevelText[levelnum], display.contentCenterX,display.contentCenterY*1.5, Font, 150)
	Names:setFillColor(1,0,0)



	
	local backbutton = widget.newButton({
    	left = 0,
    	top =  display.contentCenterY/.63,
    	height = display.contentHeight/5,
    	width = display.contentWidth/5,
    	defaultFile = "backbutton.png",
    	overFile = "backbutton.png",
    	onRelease = gotoMainMenu
    	})

	local levelright = widget.newButton({
		left = display.contentCenterX/.75,
		top = display.contentCenterY,
		height = display.contentHeight/5,
		width = display.contentWidth/5, 
		defaultFile = "changeright.png",
		overFile = "changeright.png",
		onRelease = CharPlusOne
		})

	local levelleft = widget.newButton({
		left = display.contentCenterX/5,
		top = display.contentCenterY,
		height = display.contentHeight/5,
		width = display.contentWidth/5, 
		defaultFile = "changeleft.png",
		overFile = "changeleft.png",
		onRelease = CharMinusOne
		})
	


    
	sceneGroup:insert(backgroundselect)
	sceneGroup:insert(backbutton)
	sceneGroup:insert(levelleft)
	sceneGroup:insert(levelright)
	sceneGroup:insert(Names)

end






function scene:show(event)
	local group = self.view
	local phase = event.phase



	if (phase == "will") then
	levelnum = 1
	end
end


function scene:exitScene(event)
	local group = self.view
end



function scene:destroy(event)
	local group = self.view
	if(backgroundselect) then
		backgroundselect:removeSelf()
	end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroy", scene)
return scene