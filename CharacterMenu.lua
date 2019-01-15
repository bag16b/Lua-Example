
local composer = require ("composer")
local scene = composer.newScene()
local gameData = require("GameData")

local widget  = require ("widget")

function gotoMainMenu(event)
	if ("ended" == event.phase) then
	

	composer.gotoScene("MainMenu")
	composer.removeScene("CharacterMenu")
end
end

function CharPlusOne(event)
	if("ended" == event.phase) then
		if(characternum > table.getn(array) - 1) then
			characternum = 1
			
		else
			characternum = characternum + 1
		
		end
	end
	if(currentCharacter) then
		currentCharacter:removeSelf()
		currentCharacter = display.newImage(array[characternum], display.contentCenterX,display.contentCenterY)
		currentCharacter.width = characterWidth[characternum]
		currentCharacter.height = characterHeight[characternum]
		charGroup:insert(currentCharacter)
	end
	if(UnlockText) then
		UnlockText:removeSelf()
		if (gameData.LevelUnlocked[characternum] == false) then
			UnlockText = display.newText(characterText[characternum], display.contentCenterX,display.contentCenterY*1.5, Font, display.contentWidth/14)
			UnlockText:setFillColor(1,0,0)	
			
		else
			UnlockText = display.newText(characterText[1], display.contentCenterX,display.contentCenterY*1.5, Font, display.contentWidth/14)
			UnlockText:setFillColor(1,0,0)	
			
		end
		charGroup:insert(UnlockText)
	end
	if(gameData.LevelUnlocked[characternum] == false) then
		currentCharacter:setFillColor(0.05,0.05,0.05)
	else
		currentCharacter:setFillColor(1,1,1)
	end
end

function CharMinusOne(event)
	if("ended" == event.phase) then
		if(characternum < 2) then
			characternum = table.getn(array)
			
		else
			characternum = characternum - 1
			
		end
	end
	if(currentCharacter) then
		currentCharacter:removeSelf()
		currentCharacter = display.newImage(array[characternum], display.contentCenterX,display.contentCenterY)
		currentCharacter.width = characterWidth[characternum]
		currentCharacter.height = characterHeight[characternum]
		charGroup:insert(currentCharacter)
		
	end
	if(UnlockText) then
		UnlockText:removeSelf()
		if (gameData.LevelUnlocked[characternum] == false) then
			UnlockText = display.newText(characterText[characternum], display.contentCenterX,display.contentCenterY*1.5, Font, display.contentWidth/14)
			UnlockText:setFillColor(1,0,0)
		
		else
			UnlockText = display.newText(characterText[1], display.contentCenterX,display.contentCenterY*1.5, Font, display.contentWidth/14)
			UnlockText:setFillColor(1,0,0)
			
		
		end
		charGroup:insert(UnlockText)
	end
	if(gameData.LevelUnlocked[characternum] == false) then
		currentCharacter:setFillColor(0.05,0.05,0.05)
	else
		currentCharacter:setFillColor(1,1,1)
	end
end




function scene:create (event)
	
	charGroup = self.view
	local background = display.newImage("characterscreen.png", display.contentCenterX, display.contentCenterY)
	background.width = display.contentWidth
	background.height = display.contentHeight

    array = {"DODGE_BALL_BIG.png","golfball.png","BASKETBALL_BIG.png","baseball1.png", "beach.png", "soccerball.png", "volleyball.png", "tennis.png", "8_BALL.png", "WHIFFLE_BALL.png" , "BOWLING_BALL.png", "SPIKE_BIG.png", "harambe.png","TRUMP_BALL.png"}
    characterWidth = {display.contentWidth/3,display.contentWidth/3.5,display.contentWidth/2.25,display.contentWidth/2.25,display.contentWidth/2.25, display.contentWidth/2.75,display.contentWidth/2,display.contentWidth/3,display.contentWidth/2.5,display.contentWidth/2.5,display.contentWidth/2.5,display.contentWidth/3, display.contentWidth/3,display.contentWidth/3,display.contentWidth/3}
    characterHeight = {display.contentHeight/3,display.contentHeight/3.5,display.contentHeight/2.25,display.contentHeight/2.25,display.contentHeight/2.25,display.contentHeight/2.75, display.contentHeight/2,display.contentHeight/3,display.contentHeight/2.5,display.contentHeight/2.5,display.contentHeight/2.5,display.contentHeight/3,display.contentHeight/3,display.contentHeight/3,display.contentWidth/3}
    characterText = {"Unlocked!","Unlocked!","Unlocked!","Unlocked!","Unlocked!", "Play 5 games","Play 25 games","Play 60 games", "Play 100 games","Jump 100 times","Secret","Secret","Secret","Secret"}
    

	characternum = 1
	currentCharacter = display.newImage(array[characternum], display.contentCenterX,display.contentCenterY)
	currentCharacter.width = display.contentWidth/3
	currentCharacter.height = display.contentHeight/3

	Font = native.newFont("SoftMarshmallow.otf")

	UnlockText = display.newText(characterText[characternum], display.contentCenterX,display.contentCenterY*1.5, Font, display.contentWidth/14)
	UnlockText:setFillColor(1,0,0)
	
	

	local charright = widget.newButton({
		left = display.contentCenterX/.75,
		top = display.contentCenterY,
		height = display.contentHeight/5,
		width = display.contentWidth/5, 
		defaultFile = "changeright.png",
		overFile = "changeright.png",
		onRelease = CharPlusOne
		})

	local charleft = widget.newButton({
		left = display.contentCenterX/5,
		top = display.contentCenterY,
		height = display.contentHeight/5,
		width = display.contentWidth/5, 
		defaultFile = "changeleft.png",
		overFile = "changeleft.png",
		onRelease = CharMinusOne
		})
	


	local backbutton = widget.newButton({
    	left = 0,
    	top =  display.contentCenterY/.63,
    	height = display.contentHeight/5,
    	width = display.contentWidth/5,
    	defaultFile = "backbutton.png",
    	overFile = "backbutton.png",
    	onRelease = gotoMainMenu
    	})
	


    charGroup:insert(background)
	charGroup:insert(backbutton)
	charGroup:insert(charright)
	charGroup:insert(charleft)
	charGroup:insert(currentCharacter)
	charGroup:insert(UnlockText)

end






function scene:show(event)
	local group = self.view
end


function scene:exitScene(event)
	local group = self.view
end



function scene:destroy(event)
	local group = self.view
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroy", scene)
return scene




