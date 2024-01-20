-- exemplos simples corpos fisicos

local dispHeight = display.contentHeight
local dispWidth = display.contentWidth

local centerX = display.contentCenterX
local centerY = display.contentCenterY

-- chamar a biblioteca de fisica

local physics = require("physics")

-- inicia simulacao fisica
physics.start()

-- definir forca da gravidade em x e y

physics.setGravity(0, 9.8)

-- define se os objetos colisores serao visiveis
physics.setDrawMode("hybrid")

-- criando paredes

local leftWall = display.newRect(0, centerY, 10, dispHeight+300)
local rightWall = display.newRect(dispWidth, centerY, 10, dispHeight+300)

-- adicionando corpo colisor na parede

physics.addBody(leftWall, "static")
physics.addBody(rightWall, "static")

-- criando chão

local floor = display.newRect(centroX, altTela, largTela, 20)
floor:setFillColor(0.2, 1, 0.5)

-- adicionando corpo colisor no chão

physics.addBody(floor, "static")

-- criando um objeto dinamico

local ball = display.newCircle(centerX, 120, 25)

physics.addBody(ball, "dynamic")

-- criando um objeto cinematico

local box = display.newRect(centerX+100, centerY, 50, 50)

-- adicionando corpo colisor na caixa

physics.addBody(box, "kinematic")

function createBalls()
	local balls = display.newCircle(math.random(dispWidth), 100, 25)
	physics.addBody(balls, "dynamic", {density = 0.2, friction = 0.3, bounce = 0.2})
end

for i = 1, 5 do
	createBalls()
end

function moveBox(event)
	if event.phase == "began" or event.phase == "moved" then
		local x = event.x
		local y = event.y
		box.x = x
		box.y = y
	end
end

box:addEventListener("touch", moveBox)