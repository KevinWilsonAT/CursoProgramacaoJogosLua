display.setStatusBar(display.HiddenStatusBar)

-- screen coordinates
local dispWidth = display.contentWidth
local dispHeight = display.contentHeight

local centerX = display.contentCenterX
local centerY = display.contentCenterY

-- call physics library
local physics = require("physics")

-- start simulation
physics.start()

-- define gravity value at x and y
physics.setGravity(0, 30)

-- alterando o modo de exibição
physics.setDrawMode("hybrid")

local dead = false
local lives = 3
local points = 0

-- create blue background

local background = display.newRect(centerX, centerY, dispWidth*2, dispHeight)
background:setFillColor(0,0.6,1)

-- create points text

local pointsText = display.newText("Pontos:" .. points, centerX+150, centerY-130, native.systemFont, 30)
pointsText:setFillColor(1,0,0)

-- create lives hearts

local lives1 = display.newImageRect("images/life.png", 40, 40)
lives1.x = centerX-250
lives1.y = centerY-130

local lives2 = display.newImageRect("images/life.png", 40, 40)
lives2.x = centerX-200
lives2.y = centerY-130

local lives3 = display.newImageRect("images/life.png", 40, 40)
lives3.x = centerX-150
lives3.y = centerY-130

-- creates the floor

local ground = display.newImageRect("images/floor.png", dispWidth*3, 100)
ground.x = centerX
ground.y = centerY+120

-- add static collisor body and change collisor body size

physics.addBody(ground, "static", {friction=2, box={x=0, y=50, halfWidth=ground.width*0.5, halfHeight=ground.height*0.7}})

-- creates the river

local river = display.newImageRect("images/river.png", dispWidth*3, 100)
river.x = centerX
river.y = centerY+150

transition.to(ground, {time=3000, x=1, iterations=0})
transition.to(river, {time=4000, x=1, iterations=0})

-- creates player

local mario = display.newImageRect("images/mario.png", 50, 70)
mario.x = centerX-500
mario.y = centerY-40
mario.rotation=10

-- add a identification to use on collision function

mario.myName = "player"

-- add collisor body

physics.addBody(mario, "dynamic", {density=0.3, radius=30})

-- transition to make player appears when game starts

transition.to(mario, {time=600, x = centerX-250})

function spawnEnemies()
	local goomba = display.newImageRect("images/goomba.png", 40, 50)
	goomba.x = 1500
	goomba.y = centerY+80
	goomba.rotation = -20
	goomba.myName = "enemy"
	physics.addBody(goomba, "kinematic", {radius=25, isSensor=true})

	transition.to(goomba, {x=-200, time=math.random(2000, 6000),
		onComplete = function()
			display.remove(goomba)
		end
	})
end

-- timer that creates random enemies

timer.performWithDelay(math.random(2000, 3000), spawnEnemies, 0)

-- create coins

function createCoins()
	local coin = display.newImageRect("images/coin.png", 30, 20)
	coin.x = dispWidth+300
	coin.y = math.random(50, 200)
	coin.myName = "coin"
	physics.addBody(coin, "kinematic", {radius=20, isSensor=true})

	-- animate the coin
	transition.to(coin, {xScale=2, yScale=2, time=500, iterations=0})

	-- coin track
	transition.to(coin, {x=-100, y=math.random(100, 200), time=5000,
	onComplete=function()
		display.remove(coin)
	end})
end

-- timer that creates coins

timer.performWithDelay(math.random(800, 1000), createCoins, 0)

-- function update score when collect coins

function updatePointsText()
	points = points + 1
	pointsText.text = "Score: " .. points
end

-- function update life counter

function updateLife()
	lives = lives - 1
end

-- function remove heart when lose life

function loseLife()
	if lives == 3 then
		display.remove(lives3)
	elseif lives == 2 then
		display.remove(lives2)
	elseif lives == 1 then
		display.remove(lives1)
	end

	updateLife()
end

-- function to jump

function jump(event)
	if (event.phase == "began") then
		mario:applyLinearImpulse(0, -15, mario.x, mario.y)
	end
end

mario:addEventListener("touch", jump)

-- function to restore player upon colliding with the enemy

function restorePlayer()
	mario.isBodyActive = false
	transition.to(mario, {alpha=1, time=400,
	onComplete = function()
		mario.isBodyActive = true
		dead = false
	end})
end

-- function of collision event

function onCollision(event)
	if event.phase == "began" then
		local obj1 = event.object1
		local obj2 = event.object2

		-- if obj1 is the player and obj2 is the coin OR vice versa 
		if (obj1.myName == "player" and obj2.myName == "coin") or
			(obj1.myName == "coin" and obj2.myName == "player") then

			if obj1.myName == "coin" then
				display.remove(obj1)
			else
				display.remove(obj2)
			end

			updatePointsText()

		elseif (obj1.myName == "player" and obj2.myName == "enemy") or
			(obj1.myName == "enemy" and obj2.myName == "player") then

			if (dead == false) then
				dead = true
				mario.alpha = 0.3
				timer.performWithDelay(1000, restorePlayer)
				loseLife()
			end
		end
	end
end

Runtime:addEventListener("collision", onCollision)