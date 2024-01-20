display.setDefault("background", 0.2, 0.4, 0.6)

display.setStatusBar(display.HiddenStatusBar)

local dispHeight = display.contentHeight
local dispWidth = display.contentWidth

print("Altura da Tela:" .. dispHeight)
print("Largura da Tela:" .. dispWidth)

local centerX = display.contentCenterX
local centerY = display.contentCenterY

print("Centro X da Tela:" .. centerX)
print("Centro Y da Tela:" .. centerY)

local bg = display.newRect(centerX, centerY, dispWidth, dispHeight)
bg:setFillColor(0.3, 0.7, 0.6)

local circle = display.newCircle(centerX, 420, 50)
circle:setFillColor(1,0,0)
circle.strokeWidth = 3
circle:setStrokeColor(0,0,0)

local rectangle = display.newRect(centerX, 420, 90, 50)
rectangle:setFillColor(0,0,1)
rectangle.strokeWidth = 3
rectangle:setStrokeColor(0,0,0)

local square = display.newRect(centerX, 420, 80, 80)
square:setFillColor(0,1,0)
square.strokeWidth = 3
square:setStrokeColor(0,0,0)

circle:toFront()
circle:toBack()

local circleZero = display.newCircle(0, 0, 10)
local circleMiddle = display.newCircle(centerX, centerY, 10)
local circleBottom = display.newCircle(320, 480, 10)

local astronaut = display.newImageRect("astronauta.jpg", 150, 150)

astronaut.x = 0
astronaut.y = 0
astronaut.anchorX = 0
astronaut.anchorY = 0
astronaut.rotation = 0

print("Posição AnchorX imagem astronauta:" .. astronaut.anchorX)
print("Posição AnchorY imagem astronauta:" .. astronaut.anchorY)

-- newLine(xInicio, yInicio, xFinal, yFinal)

local lineUp = display.newLine(0, 0, 320, 0)
lineUp.strokeWidth = 3
lineUp:setStrokeColor(1,0,0)

local lineL1 = display.newLine(0, 0, 0, 480)
lineL1.strokeWidth = 3
lineL1:setStrokeColor(1,0,0)

local lineBottom = display.newLine(0, 480, 320, 480)
lineBottom.strokeWidth = 3
lineBottom:setStrokeColor(1,0,0)

local lineR1 = display.newLine(320, 0, 320, 480)
lineR1.strokeWidth = 3
lineR1:setStrokeColor(1,0,0)

local lineUpper = display.newLine(60, 20, 260, 20)
lineUpper.strokeWidth = 3
lineUpper:setStrokeColor(0,1,0)

local lineL2 = display.newLine(60, 20, 60, 450)
lineL2.strokeWidth = 3
lineL2:setStrokeColor(0,1,0)

local lineR2 = display.newLine(260, 20, 260, 450)
lineR2.strokeWidth = 3
lineR2:setStrokeColor(0,1,0)

local lineLower = display.newLine(60, 450, 260, 450)
lineLower.strokeWidth = 3
lineLower:setStrokeColor(0,1,0)