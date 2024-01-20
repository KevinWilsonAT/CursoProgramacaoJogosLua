-- exemplo elaborado fisica

display.setStatusBar(display.HiddenStatusBar)

local dispHeight = display.contentHeight
local dispWidth = display.contentWidth

local centerX = display.contentCenterX
local centerY = display.contentCenterY

-- chamando a biblioteca de fisica
local physics = require("physics")

-- configurar para iniciar a fisica
physics.start()
physics.setGravity()

-- define se os corpos colisores são visiveis
physics.setDrawMode("hybrid")

local background = display.newRect(centerX, centerY, dispWidth, dispHeight+300)
background:setFillColor(0.5, 0.8, 1)

-- criando paredes

local leftWall = display.newRect(0, centerY, 10, dispHeight+300)
leftWall:setFillColor(0,0,1)
physics.addBody(leftWall, "static")

local rightWall = display.newRect(dispWidth, centerY, 10, dispHeight+300)
rightWall:setFillColor(0,0,1)
physics.addBody(rightWall, "static")

-- criando teto

local ceiling = display.newRect(centerX, centerY-255, dispWidth, 20)
ceiling:setFillColor(0,0,1)
physics.addBody(ceiling, "static")

-- criando chão

local floor = display.newRect(centerX, dispHeight+16, dispWidth, 20)
floor:setFillColor(0,0,1)
physics.addBody(floor, "static")

-- objeto dinamico

local box = display.newRect(centerX, 50, 50, 50)
box:setFillColor(1,0,0)

physics.addBody(box, "dynamic", {density = 1, friction = 0.3, bounce = 0.5})

-- objeto pular ao ser tocado

function jumpBox(event)
	if event.phase == "began" then
		-- aplica forca na coordenada Y do objeto
		box:applyLinearImpulse(0, -100, box.x, box.y)
	end
end

box:addEventListener("touch", jumpBox)