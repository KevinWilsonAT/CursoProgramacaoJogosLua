display.setStatusBar(display.HiddenStatusBar)

-- screen coordinates
local dispWidth = display.contentWidth+500
local dispHeight = display.contentHeight

local centerX = display.contentCenterX
local centerY = display.contentCenterY

-- calling physics library
local physics = require("physics")

-- menu frame and background

local menuGroup = display.newGroup()

local bgMenuFrame = display.newRect(menuGroup, centerX, centerY, dispWidth, dispHeight)
bgMenuFrame:setFillColor(1,1,1)

local bgMenu = display.newRect(menuGroup, centerX, centerY, dispWidth-15, dispHeight-15)
bgMenu:setFillColor(0,0,0)

-- titleScreen

local titleGroup = display.newGroup()

-- Image to use while don't have code to the title screen / tutorial screen font

local titleText = display.newText(titleGroup, "DESAFIO 7", centerX, centerY-305, "fonts/monsterfriend.otf", 60)
local subtitleText = display.newText(titleGroup, "EVENTOS E CORPOS FÍSICOS", centerX, centerY-250, "fonts/8bit-operator.ttf", 57)

startBg = display.newRect(titleGroup, centerX, centerY+200, 330, 130)
startBg:setFillColor(1,1,0)

-- Image to use while don't have code to the buttons font

local startBtn = display.newImageRect(titleGroup, "images/button.png", 330, 130)
startBtn.x = centerX
startBtn.y = centerY+200

local startText = display.newText(titleGroup, "START", centerX+6, centerY+195, "fonts/mercy.ttf", 70)
startText:setFillColor(1,1,0)

-- small tutorial

local tutGroup = display.newGroup()

local titleText = display.newText(tutGroup, "TUTORIAL", centerX, centerY-310, "fonts/monsterfriend.otf", 60)

-- Image to use while don't have code to the tutorial text screen font

local tutText = display.newImageRect(tutGroup, "images/text-tut.png", dispWidth-40, dispHeight-230)
tutText.x = centerX
tutText.y = centerY+45

local text = display.newText(tutGroup,"SOMENTE O AMARELO POR ENQUANTO", centerX-155, centerY+300, "fonts/8bit-operator.ttf", 70)
text:setFillColor(1,1,0)

tutBg = display.newRect(tutGroup, centerX+575, centerY+285, 330, 130)
tutBg:setFillColor(1,1,0)

-- Image to use while don't have code to the buttons font

local tutBtn = display.newImageRect(tutGroup,"images/button.png", 330, 130)
tutBtn.x = centerX+575
tutBtn.y = centerY+285

local tutPlText = display.newText(tutGroup, "PLAY", centerX+585, centerY+280, "fonts/mercy.ttf", 85)
tutPlText:setFillColor(1,1,0)

tutGroup.alpha = 0

local playerGroup = display.newGroup()

-- player hp

local plDead = false

local playerHp = 200
local playerMaxHp = 20

local playerHpBarFrame = display.newRect(playerGroup, centerX, centerY+355, 200, 50)
playerHpBarFrame:setFillColor(1,0,0)

local playerHpBar = display.newRect(playerGroup, centerX, centerY+355, playerHp, 50)
playerHpBar:setFillColor(1,1,0)

playerGroup.alpha = 0

-- player

local playerYellow = display.newImageRect(playerGroup, "images/SOUL-yellow.png", 50, 50)
playerYellow.x = centerX + 500
playerYellow.y = centerY + 200
playerYellow.myName = "player"

-- player bullet

local justiceBullet = display.newRoundedRect(centerX, playerYellow.y, 15,40,10)
justiceBullet:setFillColor(1,1,0) -- yellow
justiceBullet.alpha = 0
justiceBullet.myName = "bullet"

-- player score

local scoreGroup = display.newGroup()

local score = display.newText(scoreGroup, "SCORE", centerX-550, centerY-250, "fonts/8bit-operator.ttf", 80)
score:setFillColor(1,1,0)

local scoreText = display.newText(scoreGroup, "0", centerX-550, centerY-180, "fonts/8bit-operator.ttf", 80)
scoreText:setFillColor(1,1,0)

scoreGroup.alpha = 0

local points = 0

function updateScore()
	points = points + 20
	scoreText.text = points
end

-- enemy

local enemyGroup = display.newGroup()

local enDead = false

local enemyWhite = display.newImageRect(enemyGroup, "images/SOUL-white-enemy.png", 50, 50)
enemyWhite.x = centerX
enemyWhite.y = centerY-300
enemyWhite.myName = "plEnemy"

-- enemy hp

local enemyHp = 400

local enemyHpBarFrame = display.newRect(playerGroup, centerX, centerY-355, 400, 50)
enemyHpBarFrame:setFillColor(0.5,0.5,0.5)

local enemyHpBar = display.newRect(playerGroup, centerX, centerY-355, enemyHp, 50)
enemyHpBar:setFillColor(1,1,1)

enemyGroup.alpha = 0

-- enemy shoot

local minxEnemyBullet = enemyWhite.x-320 -- left x enemy bullet limit on game frame 
local maxxEnemyBullet = enemyWhite.x+320 -- right x enemy bullet limit on game frame

local function enemyShoot()

	local enemyBullet = display.newRoundedRect(enemyGroup, math.random(minxEnemyBullet, maxxEnemyBullet), -- random x enemy position
		enemyWhite.y, -- y enemy position
		15,40,10) -- enemy bullet width, length and radius
		enemyBullet:setFillColor(1,1,1)
		physics.addBody(enemyBullet, "kinematic", {radius=10, isSensor=true})
		enemyBullet.myName = "enemy"
		enemyWhite.x = enemyBullet.x

	local transitionTime = math.random(1000, 2000)
	transition.to(enemyBullet, {
		y = dispHeight + 10,
		time = transitionTime,
		onComplete = function(obj)
			display.remove(obj)
		end
	})
end

local function bulletHell()
	enemyShoot()
	timer.performWithDelay(275, bulletHell)
end

function updatePlHp()
	playerHp = playerHp - 20
end

-- function shrink player hp when hit by enemy bullet

function losePlHp()
	updatePlHp()
	playerHpBar.width = playerHp
end

-- function to restore player upon colliding with the enemy bullet

function restorePlayer()
	transition.to(playerYellow, {alpha=1, time=300,
	onComplete = function()
		plDead = false
	end})
end

--======================

function updateEnHp()
	enemyHp = enemyHp - 20
end

-- function shrink enemy hp when hit by player bullet

function loseEnHp()
	updateEnHp()
	enemyHpBar.width = enemyHp
end

-- function to restore enemy upon colliding with the player
function restoreEnemy()
	transition.to(enemyWhite, {alpha=1, time=300,
	onComplete = function()
		enDead = false
	end})
end

-- game screen

local framesGroup = display.newGroup()

local frameU = display.newRect(framesGroup, centerX, centerY-266, 710, 10)
local frameL = display.newRect(framesGroup, centerX-350, centerY+15, 10, 552)
local frameR = display.newRect(framesGroup, centerX+350, centerY+15, 10, 552)
local frameD = display.newRect(framesGroup, centerX, centerY+296, 710, 10)
framesGroup.alpha = 0

-- tutorial enter

function tutorialEnter(event)

	if (event.phase == "began") then
		if event.target == startBtn then
			titleGroup:removeSelf()

			tutGroup.alpha = 1
			transition.to(tutText, {time=3000, y = 400, iterations=0, transition=easing.outElastic})
		end
	end
end

-- tutorial exit

function tutorialExit(event)

	if (event.phase == "began") then
		if event.target == tutBtn then
			menuGroup:removeSelf()
			tutGroup:removeSelf()

			framesGroup.alpha = 1

			-- simulation start
			physics.start()
			physics.setGravity(0, 0)

			physics.addBody(playerYellow, "dynamic", {radius=25})
			physics.addBody(enemyWhite, "dynamic", {radius=25})

			physics.addBody(frameU, "static")
			physics.addBody(frameL, "static")
			physics.addBody(frameR, "static")
			physics.addBody(frameD, "static")

			playerYellow.x = centerX
			playerYellow.y = centerY + 200
			playerGroup.alpha = 1
			enemyGroup.alpha = 1
			scoreGroup.alpha = 1

			bulletHell()
		end
	end
end


startBtn:addEventListener("touch", tutorialEnter)
tutBtn:addEventListener("touch", tutorialExit)

-- alterando o modo de exibição
physics.setDrawMode("normal")

-- shooting game

--player movement

local keyState = {up = false, w= false, down = false, s=false, left = false, a=false, right = false, d=false}

function onKeyEvent(event)
	-- velocidade de movimento
	local speed = 5

	if (event.phase == "down") then
		if (event.keyName == "up") or (event.keyName == "w") then
			keyState.up = true
		elseif (event.keyName == "down") or (event.keyName == "s") then
			keyState.down = true
		elseif (event.keyName == "left") or (event.keyName == "a") then
			keyState.left = true
		elseif (event.keyName == "right") or (event.keyName == "d") then
			keyState.right = true
		end

	-- quando soltar a tecla
	elseif (event.phase == "up") then
		if (event.keyName == "up") or (event.keyName == "w") then
			keyState.up = false
		elseif (event.keyName == "down") or (event.keyName == "s") then
			keyState.down = false
		elseif (event.keyName == "left") or (event.keyName == "a") then
			keyState.left = false
		elseif (event.keyName == "right") or (event.keyName == "d") then
			keyState.right = false
		end
	end
end

-- move player update

function updatePlayer()
	local spd = 6

	if keyState.up then
		playerYellow.y = playerYellow.y - spd
	end

	if keyState.down then
		playerYellow.y = playerYellow.y + spd
	end

	if keyState.left then
		playerYellow.x = playerYellow.x - spd
	end


	if keyState.right then
		playerYellow.x = playerYellow.x + spd
	end
end

Runtime:addEventListener("key", onKeyEvent)

Runtime:addEventListener("enterFrame", updatePlayer)

-- shoot bullet

local keyShoot = {space = false, enter = false, z = false}

function shoot()
	justiceBullet.alpha = 1
	justiceBullet.x = playerYellow.x
	justiceBullet.y = playerYellow.y
	justiceBullet.xScale = 1

	physics.addBody(justiceBullet, "kinematic", {radius=10, isSensor=true})
	justiceBullet:setLinearVelocity(0, -2000, 0, 0)
end

function shootBullet(event)

	if event.phase == "down" then
		if event.keyName == "space" or event.keyName == "enter" or event.keyName == "z" then
			keyState.z = true
			shoot()
		end

	-- quando soltar a tecla
	elseif event.phase == "up" then
		if event.keyName == "space" or event.keyName == "enter" or event.keyName == "z" then
			keyState.z = false
		end
	end
end

-- function of collision event

function onCollision(event)
	if event.phase == "began" then
		local obj1 = event.object1
		local obj2 = event.object2

		if (obj1.myName == "bullet" and obj2.myName == "plEnemy") or
			(obj1.myName == "plEnemy" and obj2.myName == "bullet") then

			if (enDead == false) then
				enDead = true
				enemyWhite.alpha = 0.3
				timer.performWithDelay(1000, restoreEnemy)
				loseEnHp()
			end

			updateScore()

		elseif (obj1.myName == "player" and obj2.myName == "enemy") or
			(obj1.myName == "enemy" and obj2.myName == "player") then

			if (plDead == false) then
				plDead = true
				playerYellow.alpha = 0.3
				timer.performWithDelay(1000, restorePlayer)
				losePlHp()
			end
		end
	end
end

Runtime:addEventListener("collision", onCollision)

Runtime:addEventListener("key", shootBullet)