-- exemplos fisica com imagens

-- chamando biblioteca de fisica
local physics = require("physics")

-- iniciando simulação
physics.start()

-- definindo o valor da gravidade em x e y
physics.setGravity(0, 30)

-- alterando o modo de exibição
physics.setDrawMode("hybrid")

-- coordenadas da tela
local dispWidth = display.contentWidth
local dispHeight = display.contentHeight

local centerX = display.contentCenterX
local centerY = display.contentCenterY

-- imagem de fundo
local bg = display.newImageRect("images/bg.png", dispWidth+300, 200)

bg.x = centerX
bg.y = centerY

physics.addBody(bg, "static", {box={x=0, y=120, halfWidth=bg.width, halfHeight=bg.height*0.3}})

local leftWall = display.newRect(-110, centerY, 10, dispHeight)
physics.addBody(leftWall, "static")

local rightWall = display.newRect(dispWidth+110, centerY, 10, dispHeight)
physics.addBody(rightWall, "static")

local player = display.newImageRect("images/toad.png", 100, 100)
player.x = centerX-250
player.y = centerY

physics.addBody(player, "dynamic", {radius=40})

local bullet = display.newImageRect("images/ball.png", 50, 30)
bullet.x = centerX+300
bullet.y = centerY+40
physics.addBody(bullet, "kinematic", {radius=25, isBullet=true})

function cannon(event)
	if event.phase == "began" then
		bullet:setLinearVelocity(-5000, 0, bullet.x, bullet.y)
	end
end

bullet:addEventListener("touch", cannon)

function shoot()
	local bullet2 = display.newImageRect("images/ball.png", 20, 15)
	bullet2.x = player.x
	bullet2.y = player.y
	bullet2.xScale = -1

	physics.addBody(bullet2, "kinematic", {isBullet=true})
	bullet2:setLinearVelocity(2000, 0, bullet2.x, bullet2.y)
end

player:addEventListener("tap", shoot)

function createMushrooms()
	local mushroom = display.newImageRect("images/mush.png", 20, 20)
	mushroom.x = math.random(dispWidth)
	mushroom.y = centerY-300
	physics.addBody(mushroom, "dynamic", {radius = 10, bounce = 0.5})

	local greenMushroom = display.newImageRect("images/mushlife.png", 20, 20)
	greenMushroom.x = math.random(dispWidth)
	greenMushroom.y = centerY-300
	physics.addBody(greenMushroom, "dynamic", {density = 1, bounce = 0.3})
end

for i = 1, 50 do
	createMushrooms()
end

-- Function to pause physics

function pausePhysics()
	physics.pause()
end

function resumePhysics()
	physics.start()
end

-- Pause Button

local buttonPause = display.newRoundedRect(250, 50, 100, 30, 20)
buttonPause:setFillColor(1,0,0)

local pauseText = display.newText("Pause", 250, 50, native.systemFont, 20)

buttonPause:addEventListener("tap", pausePhysics)

-- Resume Button

local buttonResume = display.newRoundedRect(400, 50, 100, 30, 20)
buttonResume:setFillColor(0,1,0)

local resumeText = display.newText("Resume", 400, 50, native.systemFont, 20)

buttonResume:addEventListener("tap", resumePhysics)