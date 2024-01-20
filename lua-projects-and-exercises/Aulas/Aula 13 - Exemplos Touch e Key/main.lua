local dispHeight = display.contentHeight
local dispWidth = display.contentWidth

local centerX = display.contentCenterX
local centerY = display.contentCenterY

-- movendo um objeto com teclas do teclado

local player = display.newRect(centerX, centerY+200, 50, 100)
player:setFillColor(1,0.8,0)

local floor = display.newRect(centerX, centerY+300, dispWidth, 100)
floor:setFillColor(0,1,0)

--função movimentos do teclado

function movingKeyboard(event)
	local spd = 10 -- velocidade do movimento do player

	if event.phase == "down" then
		if event.keyName == "up" then
			player.y = player.y - spd
		elseif event.keyName == "down" then
			player.y = player.y + spd
		elseif event.keyName == "left" then
			player.x = player.x - spd
		elseif event.keyName == "right" then
			player.x = player.x + spd
		end
	end
end

Runtime:addEventListener("key", movingKeyboard)

-- mudando cor de um objeto ao tocar nele

local ball = display.newCircle(centerX, centerY-100,35)
ball:setFillColor(1,0,0)

function changeColorBall(event)
	local obj = event.target

	if event.phase == "began" then
		obj:setFillColor(0,1,0)
		transition.to(obj, {time = 500, xScale = 2, yScale = 2, iterations = 0})
	elseif event.phase == "ended" then
		obj:setFillColor(1, 0, 0, 0.5)
		transition.cancel()
		transition.to(obj, {time = 500, xScale = 1, yScale = 1})
	end
	return true
end

ball:addEventListener("touch", changeColorBall)

-- mudando cores ao clicar

local sq1 = display.newRect(70, centerY-250, 50, 50)
local sq2 = display.newRect(centerX, centerY-250, 50, 50)
local sq3 = display.newRect(centerX+90, centerY-250, 50, 50)

function changeColor(event)

	if event.phase == "began" then
		if event.target == sq1 then
			sq1:setFillColor(1,0,0)
		elseif event.target == sq2 then
			sq2:setFillColor(0,1,0)
		elseif event.target == sq3 then
			sq3:setFillColor(0,0,1)
		end

	elseif event.phase == "ended" then
		if event.target == sq1 then
			sq1:setFillColor(1,1,1)
		elseif event.target == sq2 then
			sq2:setFillColor(1,1,1)
		elseif event.target == sq3 then
			sq3:setFillColor(1,1,1)
		end
	end
end

sq1:addEventListener("touch", changeColor)
sq2:addEventListener("touch", changeColor)
sq3:addEventListener("touch", changeColor)

-- altera cor retangulo ao apertar as teclas R, G e B

local rect = display.newRect(centerX, centerY, 150, 100)

function colorRect(event)

	if event.phase == "down" then
		if event.keyName == "r" then
			rect:setFillColor(1,0,0)
		elseif event.keyName == "g" then
			rect:setFillColor(0,1,0)
		elseif event.keyName == "b" then
			rect:setFillColor(0,0,1)
		end
	end

	return true
end

Runtime:addEventListener("key", colorRect)

-- criar tela desenhavel

local screen = display.newRect(centerX, centerY, dispWidth, dispHeight+300)
screen:setFillColor(1,1,0)
screen.alpha = 0.5

-- função desenhar

function draw(event)
	local pencil = display.newCircle(event.x, event.y, 5)
	pencil:setFillColor(1,0,0)
end

screen:addEventListener("touch", draw)