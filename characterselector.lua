local gameData = require("GameData")
local composer = require("composer")
local scene = composer.newScene()
local scaleX = display.pixelWidth/1536
local scaleY = display.pixelHeight/2048
local physicsData = require ("shapedefs").physicsData(scaleX,scaleY)

function scene:create(event) 
	aTimers = {}
	math.randomseed(os.time())
	local group = self.view

	Font = native.newFont("SoftMarshmallow.otf")

	system.activate("multitouch")

	eitherplayerjumped = false
	playerscored = true

	local playerchooser1 = math.random(14)
	local playerchooser2 = math.random(14)

	local background = event.params.background
	background.width = display.contentWidth
	background.height = display.contentHeight

	local ground1 = event.params.ground
	ground1.width = display.contentWidth
	ground1.height = display.contentHeight

	local leftwall = display.newRect(0,display.contentCenterY,display.contentWidth/150,display.contentHeight)
	local rightwall = display.newRect(display.contentCenterX/.49,display.contentCenterY,display.contentWidth/20,display.contentHeight)
	local Lkillwall = display.newRect(display.contentCenterX/100,event.params.wallsY,50,event.params.wallsheight)
	local Rkillwall = display.newRect(display.contentCenterX/.50,event.params.wallsY,50,event.params.wallsheight)
	local Mkillwall = display.newRect(event.params.MWallX,event.params.MWallY,event.params.MWallWidth,event.params.MWallHeight)

	local ceiling = display.newRect(display.contentCenterX,display.contentCenterY/100,display.contentWidth,display.contentHeight/50)
	ceiling.alpha = 0




	local instructions = display.newText("Avoid the red walls",display.contentCenterX/50,display.contentCenterY/3,Font,display.contentWidth/14)
	instructions:setFillColor(1,0,0)

	local function instructionsFunction()

	instructions.alpha = 0

	end


	transition.to( instructions, { time=3000, delay = 0,  x=(display.contentCenterX/.4), y=display.contentCenterY/3, onComplete = instructionsFunction } )


	arrowsizes = display.contentWidth * 0.00005

		
	local uparrow1 = display.newImage("uparrowredBIG1.png",display.contentCenterX/3.4,display.contentCenterY/.59)
		uparrow1:scale(arrowsizes,arrowsizes)

	local rightarrow1 = display.newImage("redarrowrightBIG1.png",display.contentCenterX/2.15,display.contentCenterY/.54)
		rightarrow1:scale(arrowsizes,arrowsizes)

		
	local leftarrow1 = display.newImage("leftredarrowBIG1.png",display.contentCenterX/8,display.contentCenterY/.54)
		leftarrow1:scale(arrowsizes,arrowsizes)

	local uparrow2 = display.newImage("uparrowblueBIG1.png",display.contentCenterX/.62,display.contentCenterY/.59)
		uparrow2:scale(arrowsizes,arrowsizes)


	local leftarrow2 = display.newImage("leftarrowblueBIG1.png",display.contentCenterX/.695, display.contentCenterY/.54)
		leftarrow2:scale(arrowsizes,arrowsizes)

	local rightarrow2 = display.newImage("rightbluearrowBIG1.png",display.contentCenterX/.56,display.contentCenterY/.54)
		rightarrow2:scale(arrowsizes,arrowsizes)

	local pausebutton = display.newImage("PAUSE_BUTTON.png", display.contentCenterX , 50)
	pausebutton:scale(arrowsizes,arrowsizes)


	local beachball = {
		
		type = "image",
		filename = "beach.png"

	}

	local soccerball = {
		
		type = "image",
		filename = "soccerball.png"
	}



	local baseball = {
		
		type = "image",
		filename = "baseball1.png"
	}
	local basketball = {
		
		type = "image",
		filename = "BASKETBALL_BIG.png"
	}
	local dodgeball = {
		
		type = "image",
		filename = "DODGE_BALL_BIG.png"
	}
	local volleyball = {
		
		type = "image",
		filename = "volleyball.png"

	}
	local tennisball = {
		
		type = "image",
		filename = "tennis.png"

	}
	local golfball = {
		
		type = "image",
		filename = "golfball.png"
	}
	local eightball = {
		
		type = "image",
		filename = "8_BALL.png"

	}
	local whiffleball = {
		
		type = "image",
		filename = "WHIFFLE_BALL.png"

	}
	local bowlingball = {
		
		type = "image",
		filename = "BOWLING_BALL.png"
	}
	local spikeball = {
		
		type = "image",
		filename = "SPIKE_BIG.png"

	}
	local harambeball = {
		
		type = "image",
		filename = "harambe.png"

	}
	local trumpball = {
		
		type = "image",
		filename = "TRUMP_BALL.png"

	}


	player1= display.newCircle(0,0,20)
	player2 = display.newCircle(400,100,20)

	-- print(playerchooser1)
	-- print(gameData.LevelUnlocked[playerchooser1])

	function playerchoosefunction1 ()

		if(playerchooser1 == 1) then
			player1.fill = dodgeball
			player1.width = display.contentHeight/3
			player1.height = display.contentHeight/4
			p1bounce = .65
			p1radius = display.contentHeight/10
			p1density = 4
		

		elseif(playerchooser1 == 2) then
			player1.fill = golfball
			player1.width = display.contentHeight/6
			player1.height = display.contentHeight/8
			p1bounce = .65
			p1radius = display.contentHeight/18
			p1density = 3
		

		elseif(playerchooser1 == 3) then
			player1.fill = basketball
			player1.width = display.contentHeight/2.62
			player1.height = display.contentHeight/3.5
			p1bounce = .8
			p1radius = display.contentHeight/8.5
			p1density = 6
		
		
		elseif(playerchooser1 == 4) then
			player1.fill = baseball
			player1.width = display.contentHeight/3.75
			player1.height = display.contentHeight/5
			p1bounce = .6
			p1radius = display.contentHeight/13
			p1density = 5
		
		
		elseif(playerchooser1 == 5) then
			player1.fill = beachball
			player1.width = display.contentHeight/1.5
			player1.height = display.contentHeight/2
			p1bounce = .8
			p1radius = display.contentHeight/5.5
			p1density = 1.5
			
		elseif(playerchooser1 == 6) then
			if(gameData.LevelUnlocked[playerchooser1] == true) then
			player1.fill = soccerball
			player1.width = display.contentHeight/2.06
			player1.height = display.contentHeight/2.75
			p1bounce = .7
			p1radius = display.contentHeight/9
			p1density = 5
			else
				while(gameData.LevelUnlocked[playerchooser1] == false) do
				playerchooser1 = (math.random(14))
				end
				playerchoosefunction1()
			end
			
		elseif(playerchooser1 == 7) then
			if(gameData.LevelUnlocked[playerchooser1] == true) then
			player1.fill = volleyball
			player1.width = display.contentHeight/2.62
			player1.height = display.contentHeight/3.5
			p1bounce = .7
			p1radius = display.contentHeight/9
			p1density = 4
			else
				while(gameData.LevelUnlocked[playerchooser1] == false) do
				playerchooser1 = (math.random(14))
				end
				playerchoosefunction1()
			end
		
		elseif(playerchooser1 == 8) then
			if(gameData.LevelUnlocked[playerchooser1] == true) then
			player1.fill = tennisball
			player1.width = display.contentHeight/3.75
			player1.height = display.contentHeight/5
			p1bounce = .7
			p1radius = display.contentHeight/18
			p1density = 5
			else
				while(gameData.LevelUnlocked[playerchooser1] == false) do
				playerchooser1 = (math.random(14))
				end
				playerchoosefunction1()
			end
		
		elseif(playerchooser1 == 9) then
			if(gameData.LevelUnlocked[playerchooser1] == true) then
			player1.fill = eightball
			player1.width = display.contentHeight/5.25
			player1.height = display.contentHeight/7
			p1bounce = 0.7
			p1radius = display.contentHeight/15
			p1density = 7
			else
		
				while(gameData.LevelUnlocked[playerchooser1] == false) do
				playerchooser1 = (math.random(14))
				end
				playerchoosefunction1()
			end
		
		elseif(playerchooser1 == 10) then
			if(gameData.LevelUnlocked[playerchooser1] == true) then
			player1.fill = whiffleball
			player1.width = display.contentHeight/4.51
			player1.height = display.contentHeight/6
			p1bounce = 0.5
			p1radius = display.contentHeight/15
			p1density = 3
			else
				while(gameData.LevelUnlocked[playerchooser1] == false) do
				playerchooser1 = (math.random(14))
				end
				playerchoosefunction1()
			end
		

		elseif(playerchooser1 == 11) then
			if(gameData.LevelUnlocked[playerchooser1] == true) then
			player1.fill = bowlingball
			player1.width = display.contentHeight/1.87
			player1.height = display.contentHeight/2.5
			p1bounce = .8
			p1radius = display.contentHeight/5.25
			p1density = 6
			else
				while(gameData.LevelUnlocked[playerchooser1] == false) do
				playerchooser1 = (math.random(14))
				end
				playerchoosefunction1()
			end
		
		elseif(playerchooser1 == 12) then
			if(gameData.LevelUnlocked[playerchooser1] == true) then
			player1.fill = spikeball
			player1.width = display.contentHeight/3.75
			player1.height = display.contentHeight/5
			p1bounce = .7
			p1radius = display.contentHeight/10
			p1density = 6
			else
				while(gameData.LevelUnlocked[playerchooser1] == false) do
				playerchooser1 = (math.random(14))
				end
				playerchoosefunction1()
			end
		
		elseif(playerchooser1 == 13) then
			if(gameData.LevelUnlocked[playerchooser1] == true) then
			player1.fill = harambeball
			player1.width = display.contentHeight/2.25
			player1.height = display.contentHeight/3
			p1bounce = .9
			p1radius = display.contentHeight/8
			p1density = 7.5
			else
				while(gameData.LevelUnlocked[playerchooser1] == false) do
				playerchooser1 = (math.random(14))
				end
				playerchoosefunction1()
			end
		
		elseif(playerchooser1 == 14) then
			if(gameData.LevelUnlocked[playerchooser1] == true) then
			player1.fill = trumpball
			player1.width = display.contentHeight/3.75
			player1.height = display.contentHeight/5
			p1bounce = .7
			p1radius = display.contentHeight/10
			p1density = 5
			else
				while(gameData.LevelUnlocked[playerchooser1] == false) do
				playerchooser1 = (math.random(14))
				print(playerchooser1)
				end
				playerchoosefunction1()
			end
		end
		

		player1.myName = "player1"

	end

	function playerchoosefunction2 ()

		

		

		if(playerchooser2 == 1) then
			player2.fill = dodgeball
			player2.width = display.contentHeight/3
			player2.height = display.contentHeight/4
			p2bounce = .65
			p2radius = display.contentHeight/10
			p2density = 4
		

		elseif(playerchooser2 == 2) then
			player2.fill = golfball
			player2.width = display.contentHeight/6
			player2.height = display.contentHeight/8
			p2bounce = .65
			p2radius = display.contentHeight/18
			p2density = 3
		

		elseif(playerchooser2 == 3) then
			player2.fill = basketball
			player2.width = display.contentHeight/2.62
			player2.height = display.contentHeight/3.5
			p2bounce = .8
			p2radius = display.contentHeight/8.5
			p2density = 6
		
		
		elseif(playerchooser2 == 4) then
			player2.fill = baseball
			player2.width = display.contentHeight/3.75
			player2.height = display.contentHeight/5
			p2bounce = .6
			p2radius = display.contentHeight/13
			p2density = 5
		
		
		elseif(playerchooser2 == 5) then
			player2.fill = beachball
			player2.width = display.contentHeight/1.5
			player2.height = display.contentHeight/2
			p2bounce = .8
			p2radius = display.contentHeight/5.5
			p2density = 1.5
		
		
		elseif(playerchooser2 == 6) then
			if(gameData.LevelUnlocked[playerchooser2] == true) then
			player2.fill = soccerball
			player2.width = display.contentHeight/2.06
			player2.height = display.contentHeight/2.75
			p2bounce = .7
			p2radius = display.contentHeight/9
			p2density = 5
			else
				while(gameData.LevelUnlocked[playerchooser2] == false) do
				playerchooser2 = (math.random(14))
				end
				playerchoosefunction2()
			end
		
		elseif(playerchooser2 == 7) then
			if(gameData.LevelUnlocked[playerchooser2] == true) then
			player2.fill = volleyball
			player2.width = display.contentHeight/2.62
			player2.height = display.contentHeight/3.5
			p2bounce = .7
			p2radius = display.contentHeight/9
			p2density = 4
			else
				while(gameData.LevelUnlocked[playerchooser2] == false) do
				playerchooser2 = (math.random(14))
				end
				playerchoosefunction2()
			end
		
		elseif(playerchooser2 == 8) then
			if(gameData.LevelUnlocked[playerchooser2] == true) then
			player2.fill = tennisball
			player2.width = display.contentHeight/3.75
			player2.height = display.contentHeight/5
			p2bounce = .7
			p2radius = display.contentHeight/18
			p2density = 5
			else
				while(gameData.LevelUnlocked[playerchooser2] == false) do
				playerchooser2 = (math.random(14))
				print(playerchooser2)
				end
				playerchoosefunction2()
			end
		
		elseif(playerchooser2 == 9) then
			if(gameData.LevelUnlocked[playerchooser2] == true) then
			
			player2.fill = eightball
			player2.width = display.contentHeight/5.25
			player2.height = display.contentHeight/7
			p2bounce = 0.7
			p2radius = display.contentHeight/15
			p2density = 7
			else
		
				while(gameData.LevelUnlocked[playerchooser2] == false) do
				playerchooser2 = (math.random(14))
				end
				playerchoosefunction2()
			end
		
		elseif(playerchooser2 == 10) then
			if(gameData.LevelUnlocked[playerchooser2] == true) then
			player2.fill = whiffleball
			player2.width = display.contentHeight/4.51
			player2.height = display.contentHeight/6
			p2bounce = 0.5
			p2radius = display.contentHeight/15
			p2density = 3
			else
				while(gameData.LevelUnlocked[playerchooser2] == false) do
				playerchooser2 = (math.random(14))
				end
				playerchoosefunction2()
			end
		

		elseif(playerchooser2 == 11) then

			if(gameData.LevelUnlocked[playerchooser2] == true) then
			player2.fill = bowlingball
			player2.width = display.contentHeight/1.87
			player2.height = display.contentHeight/2.5
			p2bounce = .8
			p2radius = display.contentHeight/5.25
			p2density = 6
			ran = true
			else
				while(gameData.LevelUnlocked[playerchooser2] == false) do
				playerchooser2 = (math.random(14))
				end
				playerchoosefunction2()
			end
		
		elseif(playerchooser2 == 12) then
			if(gameData.LevelUnlocked[playerchooser2] == true) then
			player2.fill = spikeball
			player2.width = display.contentHeight/3.75
			player2.height = display.contentHeight/5
			p2bounce = .7
			p2radius = display.contentHeight/10
			p2density = 6
			else
				while(gameData.LevelUnlocked[playerchooser2] == false) do
				playerchooser2 = (math.random(14))
				end
				playerchoosefunction2()
			end
		
		elseif(playerchooser2 == 13) then
			if(gameData.LevelUnlocked[playerchooser2] == true) then
			player2.fill = harambeball
			player2.width = display.contentHeight/2.25
			player2.height = display.contentHeight/3
			p2bounce = .9
			p2radius = display.contentHeight/8
			p2density = 7.5
			else
				while(gameData.LevelUnlocked[playerchooser2] == false) do
				playerchooser2 = (math.random(14))
				end
				playerchoosefunction2()
			end
		
		elseif(playerchooser2 == 14) then
			if(gameData.LevelUnlocked[playerchooser2] == true) then
			player2.fill = trumpball
			player2.width = display.contentHeight/3.75
			player2.height = display.contentHeight/5
			p2bounce = .7
			p2radius = display.contentHeight/10
			p2density = 5
			else
				while(gameData.LevelUnlocked[playerchooser2] == false) do
				playerchooser2 = (math.random(14))
				print(playerchooser2)
				end
				playerchoosefunction2()
			end
		end
		player2.myName = "player2"
	end

	playerchoosefunction1()
	playerchoosefunction2()




	local P1grounded = false;
	local P1groundedwait = false;

	Lkillwall:setFillColor(1,0,0)
	Rkillwall:setFillColor(1,0,0)
	Mkillwall:setFillColor(1,0,0)


	local physics = require "physics"
	physics.start()
	-- physics.setDrawMode("hybrid")
	physics.setGravity(0, event.params.gravity)

	physics.addBody(ground1,"static",physicsData:get(event.params.groundphysics))
	physics.addBody(leftwall, "static")
	physics.addBody(Lkillwall, "static")
	physics.addBody(Rkillwall, "static")
	physics.addBody(Mkillwall, "static")
	physics.addBody(rightwall,"static")
	physics.addBody(ceiling,"static")
	physics.addBody(player2,"dynamic",{bounce=p2bounce,radius=p2radius, density=p2density})
	physics.addBody(player1,"dynamic",{bounce=p1bounce, radius=p1radius, density=p1density})



	local function pushplayer1up()
		local p1xvelocity, p1yvelocity = player1:getLinearVelocity()
		if(p1yvelocity == 0) then
			player1:applyLinearImpulse(0,-10000, player1.x, player2.y)
			gameData.JumpCount[1] = gameData.JumpCount[1] + 1
			eitherplayerjumped = true
			P1grounded = false;
			if(gameData.JumpCount[1] >= 100) then
				gameData.LevelUnlocked[10] = true
				print("its unlocked")

			end
		elseif(P1grounded == true) then 
			gameData.JumpCount[1] = gameData.JumpCount[1] + 1
			eitherplayerjumped = true
			if(gameData.JumpCount[1] >= 100) then
				gameData.LevelUnlocked[10] = true
				print("its unlocked")
			end
			local applyImpulse = -8000
			if (applyImpulse < -0.5) then
				applyImpulse = -9000
			end
			print(p1yvelocity)
			print("applyImpulse")
			print(applyImpulse)
			player1: applyLinearImpulse(0, applyImpulse, player1.x, player1.y)
		P1grounded = false;
	end
	end

	uparrow1:addEventListener("tap",pushplayer1up)

	local function pushplayer1left(event)


		if(event.phase == "began") then
		player1: applyLinearImpulse(-1500, 0, player1.x, player1.y)

		end
	end
	leftarrow1:addEventListener("touch",pushplayer1left)

	local function pushplayer1right(event)
		local p1xvelocity,p1yvelocity = player1:getLinearVelocity()
		

		if(event.phase == "began") then

			

			

			player1: applyLinearImpulse(1500, 0,player1.x,player1.y)
		end
	end


	rightarrow1:addEventListener("touch",pushplayer1right)

	local function pushplayer2up()
		local p2xvelocity, p2yvelocity = player2:getLinearVelocity()
		if(p2yvelocity == 0) then
			player2:applyLinearImpulse(0,-10000, player2.x, player2.y)
			eitherplayerjumped = true
			P2grounded = false;
		elseif(P2grounded == true) then 
			local applyImpulse = -8000
			eitherplayerjumped = true
			if (applyImpulse < -0.5) then
				applyImpulse = -9000
			end
			print(p2yvelocity)
			print("applyImpulse")
			print(applyImpulse)
			player2: applyLinearImpulse(0, applyImpulse, player2.x, player2.y)
			P2grounded = false;
	end
	end
	uparrow2:addEventListener("tap",pushplayer2up)

	local function pushplayer2left(event)

		if(event.phase == "began") then
		player2: applyLinearImpulse(-1500,0,player2.x, player2.y)
		
		elseif(event.phase == "moved") then

		elseif(event.phase == "ended") then
		
		end
	end
	leftarrow2:addEventListener("touch",pushplayer2left)

	local function pushplayer2right(event)

		if(event.phase == "began") then
		player2: applyLinearImpulse(1500,0,player2.x,player2.y)
		end
	end

	rightarrow2:addEventListener("touch",pushplayer2right)

	local pauseoptions = {
		isModal = true
	}


	local function pausebuttonfunction()
		composer.showOverlay("PauseMenu", pauseoptions)
		physics.pause()
		if(countdowntimer) then
			timer.pause(countdowntimer)
		end
		if(resumephysicstimer) then
			timer.pause(resumephysicstimer)
		end
		if(WallDownTimer) then
			timer.pause(WallDownTimer)
		end
		if(aTimers[1]) then
			timer.pause(aTimers[1])
		end
	end
	pausebutton:addEventListener("tap",pausebuttonfunction)





	local function onLocalCollision(self, event)
		
		if (event.phase == "began" and event.other.myName == "player1") then

			P1grounded = true;
			--print ("grounded1")

	end

		if (event.phase == "began" and event.other.myName == "player2") then

			P2grounded = true;
			--print ("grounded2")



	end
	end

	ground1.collision = onLocalCollision
	ground1:addEventListener ("collision")

		
	function stopP1bounce()
		if(player1 and player1.isBodyActive == true) then
		local p1xvelocity, p1yvelocity = player1:getLinearVelocity()
		if (p1yvelocity < 30 and p1yvelocity > -30) then
			player1:setLinearVelocity(p1xvelocity, 0)
		end
		end
	end

	function stopP2bounce()
		if(player2 and player2.isBodyActive == true) then
		local p2xvelocity, p2yvelocity = player2:getLinearVelocity()
		if (p2yvelocity < 30 and p2yvelocity > -30) then
			player2:setLinearVelocity(p2xvelocity, 0)
		end
	end
	end

	function slowP1x()
		if(player1 and player1.isBodyActive == true) then
			local p1xvelocity, p1yvelocity = player1:getLinearVelocity()
			if(p1xvelocity > 1000) then
				player1:setLinearVelocity(1000, p1yvelocity)
			end
			if(p1xvelocity < -1000) then
				player1:setLinearVelocity(-1000, p1yvelocity)
			end
		end


	end

	function slowP1jump()
		if(player1 and player1.isBodyActive == true) then
			local p1xvelocity, p1yvelocity = player1:getLinearVelocity()
			if (p1yvelocity < -700) then
			player1:setLinearVelocity(p1xvelocity, -700)
			end
		end
	end

	function slowP2jump()
		if(player2 and player2.isBodyActive == true) then
		local p2xvelocity, p2yvelocity = player2:getLinearVelocity()
		if (p2yvelocity < -700) then
			player2:setLinearVelocity(p2xvelocity, -700)
		end
	end
	end




	local function resumePhysics(event) 
		if(player1.isBodyActive == true) then

	player1:setLinearVelocity(0,0)
	player2:setLinearVelocity(0,0)
	physics.start()
	resumephysicstimer = nil
	end
	end

	local secondsLeft = 3;
	clockText = display.newText("3", display.contentCenterX, 200, native.systemFont, display.contentWidth/10)
	clockText:setFillColor(1,0,0)

	

	local function updateTime()
		secondsLeft = secondsLeft - 1
		clockText.text = secondsLeft
		if(secondsLeft <= 0) then
		 clockText.text = ""
		 countdowntimer = nil
		end
	end

	local function SetPlayerScoredToFalse()
		playerscored = false

	end

	function MoveWallDown(event)

		if(Mkillwall.isBodyActive == true) then
			Mkillwall.y = Mkillwall.y+1
		end
	
		if(playerscored == true) then
			timer.cancel(event.source)
		end

	end


	function MoveWallDownStart(event)
	print("workingfnction")
		aTimers[1] = timer.performWithDelay(50,MoveWallDown,display.pixelHeight)

	end

	

	local player1x = event.params.player1x
	local player2x = event.params.player2x

	local function resetBalls(event) 

		Mkillwall.y = 0
		player1.x = player1x
		player1.y = display.contentCenterY/2
		player2.x = player2x
		player2.y = display.contentCenterY/2
		player1.rotation = 0
		player2.rotation = 0
		physics.pause()
		player1:setLinearVelocity(0,0)
		player2:setLinearVelocity(0,0)
		secondsLeft = 3;
		clockText.text = "3"
		scoreplayer1 = false
		scoreplayer2 = false
		ScoredToFalseTimer = nil
		MoveWallDownTimer = nil
		WallDownTimer = nil
		playerscored = true
		aTimers[1] = nil

				
		

		if(gameData.PlayerScore[1] >= 3) then


			gameData.GameCount[1] = gameData.GameCount[1] + 1

			if(gameData.levelselector == 9) then
				gameData.TrumpGameCount[1] = gameData.TrumpGameCount[1] + 1
			end

			if(gameData.TrumpGameCount[1] >= 20) then
				gameData.LevelUnlocked[14] = true
			end
			
			if(gameData.GameCount[1] >= 5) then
			gameData.LevelUnlocked[6] = true
			end
			if(gameData.GameCount[1] >= 25) then
				gameData.LevelUnlocked[7] = true
			end
			if(gameData.GameCount[1] >= 60) then
				gameData.LevelUnlocked[8] = true
			end
			if(gameData.GameCount[1] >= 100) then
				gameData.LevelUnlocked[9] = true
			end
			composer.showOverlay("GameOver")
			gameoverscreen = true
			clockText.text = ""
			
		
		elseif(gameData.PlayerScore[2] >= 3 and gameoverscreen == false) then


			gameData.GameCount[1] = gameData.GameCount[1] + 1

			if(gameData.levelselector == 9) then
				gameData.TrumpGameCount[1] = gameData.TrumpGameCount[1] + 1
			end

			if(gameData.TrumpGameCount[1] >= 20) then
				gameData.LevelUnlocked[14] = true
			end
			
			if(gameData.GameCount[1] >= 5) then
				gameData.LevelUnlocked[6] = true
			end
			if(gameData.GameCount[1] >= 25) then
				gameData.LevelUnlocked[7] = true
			end
			if(gameData.GameCount[1] >= 60) then
				gameData.LevelUnlocked[8] = true
			end
			if(gameData.GameCount[1] >= 100) then
				gameData.LevelUnlocked[9] = true
			end
			composer.showOverlay("GameOver2")
			gameoverscreen = true
			clockText.text = ""
			
		else
			countdowntimer = timer.performWithDelay(1000,updateTime, secondsLeft)
			resumephysicstimer = timer.performWithDelay(3000, resumePhysics)
			if(playerscored == true) then

				ScoredToFalseTimer = timer.performWithDelay(1,SetPlayerScoredToFalse)
				WallDownTimer = timer.performWithDelay(33000,MoveWallDownStart)
			end
	end
	end


	local P1scoreDisplay = display.newText(gameData.PlayerScore[1], display.contentCenterX/7, display.contentCenterY/10, native.systemFont, display.contentWidth/15)

	local P2scoreDisplay = display.newText(gameData.PlayerScore[2], display.contentCenterX/.55, display.contentCenterY/10, native.systemFont, display.contentWidth/15)

	scoreplayer1 = false;
	scoreplayer2 = false;

	


	local function onLocalCollision(self, event)


		if(event.phase == "began" and event.other.myName == "player1" and scoreplayer1 == false) then
			gameData.PlayerScore[2] = gameData.PlayerScore[2] + 1;
			scoreplayer1 = true;
			P2scoreDisplay.text = gameData.PlayerScore[2]
			timer.performWithDelay(1,resetBalls)
		 	playerscored = true
			

			
	end
		if(event.phase == "began" and event.other.myName == "player2" and scoreplayer2 == false) then
			gameData.PlayerScore[1] = gameData.PlayerScore[1] + 1;
			scoreplayer2 = true;
			P1scoreDisplay.text = gameData.PlayerScore[1]
			timer.performWithDelay(1,resetBalls)
			playerscored = true
	end
	end



	Lkillwall.collision = onLocalCollision
	Lkillwall:addEventListener ("collision")

	local function onLocalCollision(self, event)


		if(event.phase == "began" and event.other.myName == "player1" and scoreplayer1 == false) then

			gameData.PlayerScore[2] = gameData.PlayerScore[2] + 1;
			scoreplayer1 = true
			P2scoreDisplay.text = gameData.PlayerScore[2]
			timer.performWithDelay(1,resetBalls)
			playerscored = true
	end
		if(event.phase == "began" and event.other.myName == "player2" and scoreplayer2 == false) then

			gameData.PlayerScore[1] = gameData.PlayerScore[1] + 1;
			P1scoreDisplay.text = gameData.PlayerScore[1]
			scoreplayer2 = true
			timer.performWithDelay(1,resetBalls)
			playerscored = true
	end
	end



	Rkillwall.collision = onLocalCollision
	Rkillwall:addEventListener ("collision")

	local function onLocalCollision(self, event)


		if(event.phase == "began" and event.other.myName == "player1" and scoreplayer1 == false) then
			gameData.PlayerScore[2] = gameData.PlayerScore[2] + 1;
			scoreplayer1 = true;
			P2scoreDisplay.text = gameData.PlayerScore[2]
			timer.performWithDelay(1,resetBalls)
			playerscored = true
			
	end
		if(event.phase == "began" and event.other.myName == "player2" and scoreplayer2 == false) then
			gameData.PlayerScore[1] = gameData.PlayerScore[1] + 1;
			scoreplayer2 = true;
			P1scoreDisplay.text = gameData.PlayerScore[1]
			timer.performWithDelay(1,resetBalls)
			playerscored = true
	end
	end



	Mkillwall.collision = onLocalCollision
	Mkillwall:addEventListener ("collision")

	local function PlayersCollide(self, event)

		if(event.phase == "began" and event.other.myName == "player2") then

			gameData.PlayerCollisions[1] = gameData.PlayerCollisions[1] + 1

		end

	end

	player1.collision = PlayersCollide
	player1:addEventListener ("collision")

	resetBalls()


	if(gameData.levelselector == 8) then

		local sniperbutton = display.newRect(display.contentCenterX/6,display.contentCenterY/1.8,display.contentWidth/6,display.contentHeight/10)
		sniperbutton.alpha = 0.5
		local intervention = audio.loadSound("Intervention.mp3")
		local rekd = display.newImage("Crosshairs.png", display.contentCenterX/1.4,display.contentCenterY/1.15)
		rekd.alpha = 0
		
		group:insert(sniperbutton)

		local function removeRekd()
			rekd.alpha = 0

		end

		local function Sniper(event)

			if(event.phase == "began") then
				
				audio.stop(3)
				local interventionchannel = audio.play(intervention, {channel = 3, loops = 0, duration = 1000})
				rekd.alpha = 1
				rekd.width = display.contentHeight/4
				rekd.height = display.contentHeight/4
				timer.performWithDelay(250,removeRekd)
				gameData.LevelUnlocked[13] = true
			end


		end
		sniperbutton:addEventListener("touch",Sniper)
		
	end

	

	


	group:insert(background)
	group:insert(ground1)	
	group:insert(pausebutton)
	group:insert(Lkillwall)
	group:insert(leftwall)
	group:insert(rightwall)
	group:insert(Rkillwall)
	group:insert(Mkillwall)
	group:insert(leftarrow1)
	group:insert(uparrow1)
	group:insert(rightarrow1)
	group:insert(leftarrow2)
	group:insert(uparrow2)
	group:insert(rightarrow2)
	group:insert(player1)
	group:insert(player2)
	group:insert(P1scoreDisplay)
	group:insert(P2scoreDisplay)
	group:insert(instructions)

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

function scene:destroy(event)
local group = self.view

	gameData.PlayerScore[1] = 0
	gameData.PlayerScore[2] = 0

	if(eitherplayerjumped == false) then
		gameData.LevelUnlocked[11] = true
	end



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
	for id, value in pairs(timer._runlist) do
     timer.cancel(value)
end
	if(clockText) then
	clockText:removeSelf()
end
	if(MoveWallDownTimer) then
	MoveWallDownTimer:removeSelf()
end

physics.stop()
	
end

function scene:overlayEnded(event)

	if(aTimers[1] ~= nil) then
		timer.resume(aTimers[1])
	end
	if(countdowntimer ~= nil) then
		timer.resume(countdowntimer)
	end
	if(resumephysicstimer ~= nil) then
		timer.resume(resumephysicstimer)
	
	elseif(resumephysicstimer == nil) or (countdowntimer == nil) then
		physics.start()
	end
end


scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("destroy",scene)
scene:addEventListener("overlayEnded",scene)


return scene