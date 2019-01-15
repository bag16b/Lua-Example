local composer = require("composer")
local scene = composer.newScene()
local gameData = require("GameData")
local scaleX = display.pixelWidth/1536
local scaleY = display.pixelHeight/2048
local physicsData = require ("shapedefs").physicsData(scaleX,scaleY)
local characterselector = require("characterselector")



function  scene:create(event)

	if(composer.getScene("ReloadScene")) then
		composer.removeScene("ReloadScene")
	end

	system.activate("multitouch")
	gameoverscreen = false;


	local group = self.view




	local backgroundmusic1 = audio.loadSound("FunTheme.wav")
	local backgroundmusicchannel = audio.play(backgroundmusic1, {channel = 2, loops =-1, fadein = 50})



	local options =
	{
	    params = {
	        background = display.newImage("SOCCER_BACKGROUND.png", display.contentCenterX, display.contentCenterY),
	        ground = display.newImage("SOCCER_GROUND.png",display.contentCenterX,display.contentCenterY),
	        groundphysics = "SOCCER_GROUND",
	        gravity = 30,
	        wallsY = display.contentCenterY/.8,
	        wallsheight = display.contentHeight/3.33,
	        MWallWidth = display.contentWidth,
	        MWallHeight = display.contentHeight/50,
	        MWallY = 0,
	        MWallX = display.contentCenterX,
	        player1x = display.contentCenterX/2,
	        player2x = display.contentCenterX/0.65
	    }
	}






composer.gotoScene("characterselector", options)





end

function scene:show(event)
	local group = self.view
	audio.resume(2)
	gameoverscreen = false
	P1score = 0
	P2score = 0
	if(event.phase == "did") then


local p1bouncetimer = timer.performWithDelay(250,stopP1bounce,0)
	

local p2bouncetimer = timer.performWithDelay(250,stopP2bounce,0)


local p1slowtimer = timer.performWithDelay(250,slowP1jump,0)


local p2slowtimer = timer.performWithDelay(250,slowP2jump,0)

local p1slowxtimer = timer.performWithDelay(25,slowP1x,0)

end
end

function scene:hide(event)
local group = self.view
end

function scene:destroy(event)
local group = self.view

	gameData.PlayerScore[1] = 0
	gameData.PlayerScore[2] = 0



	if(background) then
	background:removeSelf()
end
	if(p1bouncetimer) then
	p1bouncetimer:removeSelf()
end
	if(p2bouncetimer) then
	p2bouncetimer:removeSelf()
end
	if(p1slowtimer) then
	p1slowtimer:removeSelf()
end
	if(p2slowtimer) then
	p2slowtimer:removeSelf()
end
	if(player1) then
	player1:removeSelf()
end
	if(player2) then
	player2:removeSelf()
end
	
end

function scene:overlayEnded(event)
	physics.start()
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)
scene:addEventListener("overlayEnded",scene)









return scene
