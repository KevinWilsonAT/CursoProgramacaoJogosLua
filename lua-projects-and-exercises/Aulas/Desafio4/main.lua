local cX = display.contentCenterX
local cY = display.contentCenterY

local title = display.newText("DESAFIO 4", cX, cY-350, native.systemFont, 50, center)

local square_eye = display.newRect(cX-400, cY-220, 150, 150)
square_eye:setFillColor(1, 0, 0)

local rsquare_eye = display.newRoundedRect(cX+400, cY-220, 150, 150, 20)
rsquare_eye:setFillColor(1, 1, 0)

local voice_circle1 = display.newCircle(cX-100, cY+10, 30)
voice_circle1:setFillColor(1, 0, 0)

local voice_circle2 = display.newCircle(cX, cY+10, 30)
voice_circle2:setFillColor(0, 0, 1)

local voice_circle3 = display.newCircle(cX+100, cY+10, 30)
voice_circle3:setFillColor(0, 1, 0)

local wave_mouth = display.newImageRect("image.png", 500, 500)
wave_mouth.x = cX
wave_mouth.y = cY+270