local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")
local gameData = require("GameData")

local function handleButtonEvent(event) 
	local levelselector = gameData.levelselector
	if("began" == phase) then
		playbutton:setFillColor(1,0,0)

	end
	if("ended" == event.phase ) then
	
		
		if(levelselector == 1) then
		
				composer.gotoScene("BasicLevel")
				composer.removeScene("MainMenu")
		
		end

		if (levelselector == 2) then
			
				composer.gotoScene("moonlevel")
				composer.removeScene("MainMenu")
			
		end

		if (levelselector == 3) then
			
				composer.gotoScene("soccerlevel")
				composer.removeScene("MainMenu")
			
		end

		if (levelselector == 4) then
			
				composer.gotoScene("beachlevel")
				composer.removeScene("MainMenu")
			
		end
		

		if (levelselector == 5) then
			
				composer.gotoScene("cloudlevel")
				composer.removeScene("MainMenu")
			
		end
		

		if (levelselector == 6) then
			
				composer.gotoScene("underwaterlevel")
				composer.removeScene("MainMenu")
			
		end

		if (levelselector == 7) then
		
				composer.gotoScene("volcanolevel")
				composer.removeScene("MainMenu")
			
		end

		if (levelselector == 8) then
	
				composer.gotoScene("zoolevel")
				composer.removeScene("MainMenu")
			
		end
		
		if(levelselector == 9) then
				composer.gotoScene("walllevel")
				composer.removeScene("MainMenu")
		end

		audio.pause(1)
	
	end
end


local function gotoSettings(event)
	
	if("ended" == event.phase ) then
		
	
		composer.gotoScene("SettingsMenu")
		composer.removeScene("MainMenu")
		
	
	end
end

local function levelselect(event)
	if("ended"== event.phase) then
	

	composer.gotoScene("levelselect")
	composer.removeScene("MainMenu")
	end
end


local function charactermenu(event)
	
	if("ended" == event.phase ) then
	
	
		composer.gotoScene("CharacterMenu")
		composer.removeScene("MainMenu")
		
	
	end
end



local function musicbutton(event)


	if("ended" == event.phase and onbool == 0) then
		
		musicoff.alpha = 0
		musicon.alpha = 1
		onbool = onbool + 1
		audio.setVolume(1)

	elseif("ended" == event.phase and onbool == 1) then
		
		musicoff.alpha = 1
		musicon.alpha = 0
		onbool = 0
		audio.setVolume(0)
	end
	end





function scene:create(event)
	local group = self.view
	local background = display.newImage("mainmenu.png", display.contentWidth, display.contentHeight)
	system.activate("multitouch")
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	background.width = display.contentWidth
	background.height = display.contentHeight
	


	local backgroundmusic = audio.loadSound("GamePossibleSong.wav")
	local backgroundmusicchannel = audio.play(backgroundmusic, {channel = 1, loops =-1, fadein = 5000})


	onbool = gameData.MusicBool


	
	
	
	local Settingbutton = widget.newButton({
		left= 0,
		top = 282,
		width = 102,
		height = 52,
		defaultFile = "SETTINGS_BUTTON_BIG.png",
		overfile = "SETTINGS_BUTTON_BIG_DIM.png",
		onRelease = gotoSettings,
		})

	Settingbutton.x = display.contentCenterX  - (display.contentWidth/2.5)
	Settingbutton.y = display.contentCenterY  + (display.contentHeight/2.5)
	Settingbutton.width = display.contentWidth * .25
	Settingbutton.height = display.contentHeight *.25

	local playbutton = widget.newButton
	{
	
	left = 80,
	top = 120,
	width = 300,
	height = 200,
	id = "playbutton",
	defaultFile = "START_BUTTON.png",
	overFile = "START_BUTTON_DIM.png",
	onRelease = handleButtonEvent,
	}

	playbutton.x = display.contentCenterX
	playbutton.y = display.contentCenterY
	playbutton.width = display.contentWidth * .75
	playbutton.height = display.contentHeight *.75

	
	local characterbutton = widget.newButton({
		left = 104,
		top = 284,
		width = 98,
		height = 47,
		defaultFile = "characterbutton.png",
		overFile = "characterbuttondim.png",
		onRelease = charactermenu,
		})
	characterbutton.x = display.contentCenterX + (display.contentWidth/3)
	characterbutton.y = display.contentCenterY + (display.contentHeight/2.5)
	characterbutton.width = display.contentWidth * .2
	characterbutton.height = display.contentHeight *.2

	local levelbut = widget.newButton({
		left = 200,
		top = 278,
		width = 110,
		height = 55,
		defaultFile = "level.png",
		overFile = "leveldim.png",
		onRelease = levelselect,
		})

	levelbut.x = display.contentCenterX + (display.contentWidth/10)
	levelbut.y = display.contentCenterY + (display.contentHeight/2.5)
	levelbut.width = display.contentWidth * .24
	levelbut.height = display.contentHeight *.24

	

	musicon = widget.newButton({
		left = 300,
		top = 278,
		width = 110,
		height = 55,
		defaultFile = "musictab.png",
		onRelease = musicbutton
		})

	musicon.x = display.contentCenterX - (display.contentWidth/6)
	musicon.y = display.contentCenterY + (display.contentHeight/2.5)
	musicon.width = display.contentWidth * .25
	musicon.height = display.contentHeight *.25
	
	musicoff = widget.newButton({
		left = 300,
		top = 278,
		width = 110,
		height = 55,
		defaultFile = "musicdim.png",
		onRelease = musicbutton
		})


	musicoff.x = display.contentCenterX - (display.contentWidth/6)
	musicoff.y = display.contentCenterY + (display.contentHeight/2.5)
	musicoff.width = display.contentWidth * .25
	musicoff.height = display.contentHeight *.25


	local function setMusicBool()


	if(onbool == 0) then
		musicon.alpha = 0
		musicoff.alpha = 1
	end

	if(onbool == 1) then
		musicon.alpha = 1
		musicoff.alpha = 0
	end

	end

	
	
	setMusicBool()

	group:insert(background)
	group:insert(playbutton)
	group:insert(Settingbutton)
	group:insert(characterbutton)
	group:insert(levelbut)
	group:insert(musicon)
	group:insert(musicoff)
	group:insert(levelbut)
	
	
end






function scene:show(event)
	local group = self.view
	audio.resume(1)
end


function scene:hide(event)
	local group = self.view
end



function scene:destroy(event)
	local group = self.view
	if playbutton then
		playbutton:removeSelf()
		playbutton = nil
	end
	if(musicoff) then
		musicoff = nil
	end
	if(musicon) then
		musicon = nil
	end
	gameData.MusicBool = onbool
	
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene

