--==================================
-- Exemplos Elaborados Touch e Key
--==================================

-- Coordenadas da tela

local dispHeight = display.contentHeight
local dispWidth = display.contentWidth

local centerX = display.contentCenterX
local centerY = display.contentCenterY


--Imagem de fundo
local bg = display.newImageRect("images/bg.png", dispWidth+300, dispHeight+300)
bg.x = centerX
bg.y = centerY

-- Imagem da estrela
local star = display.newImageRect("images/star.png", 100, 100)

star.x = centerX-100
star.y = centerY-250

transition.to(star, {time=500, xScale=1.3, yScale=1.3, iterations=0})

-- Imagem da flor
local flower = display.newImageRect("images/flower.png", 100, 100)

flower.x = centerX
flower.y = centerY-250

transition.to(flower, {time=500, xScale=1.3, yScale=1.3, iterations=0})

-- Imagem da cogumelo
local mushroom = display.newImageRect("images/green.png", 100, 100)

mushroom.x = centerX+100
mushroom.y = centerY-250

transition.to(mushroom, {time=500, xScale=1.3, yScale=1.3, iterations=0})

-- Imagem da caixa
local box = display.newImageRect("images/box.png", 120, 100)

box.x = centerX
box.y = centerY-150

transition.to(box, {time=500, xScale=1.3, yScale=1.3, iterations=0})

function onTouch(event)
	local target = event.target

	if event.phase == "began" then
		-- usamos para definir o foco do objeto
		display.getCurrentStage():setFocus(target)

		-- definimos que o foco do toque no objeto é true
		target.isFocus = true

		-- armazenamos as coordenadas x e  y do objeto
		target.markX = target.x
		target.markY = target.y

	elseif target.isFocus then

		-- verifica se a fase do evento de toque está em moved (arrastando)
		if event.phase == "moved" then
			-- altera as coordenadas do objeto de acordo com as coordenadas do movimento do dedo
			-- o que permite o movimento do objeto de acordo com o movimento do dedo
			target.x = event.x - event.xStart + target.markX
			target.y = event.y - event.yStart + target.markY

		elseif event.phase == "ended" or event.phase == "cancelled" then

			-- remove o foco do toque do objeto
			display.getCurrentStage():setFocus(nil)

			-- o toque nao esta mais focado no objeto
			target.isFocus = false
		end
	end

	return true
end

star:addEventListener("touch", onTouch)
mushroom:addEventListener("touch", onTouch)
flower:addEventListener("touch", onTouch)
box:addEventListener("touch", onTouch)

-- movimentação de objeto usando o teclado

local boo = display.newImageRect("images/boo.png", 200, 200)

boo.x = centerX
boo.y = centerY+150

local keyState = {up = false, down = false, left = false, right = false}

function onKeyEvent(event)
	-- velocidade de movimento
	local speed = 5

	if event.phase == "down" then
		if event.keyName == "up" then
			keyState.up = true
		elseif event.keyName == "down" then
			keyState.down = true
		elseif event.keyName == "left" then
			keyState.left = true
		elseif event.keyName == "right" then
			keyState.right = true
		end

	-- quando soltar a tecla
	elseif event.phase == "up" then
		if event.keyName == "up" then
			keyState.up = false
		elseif event.keyName == "down" then
			keyState.down = false
		elseif event.keyName == "left" then
			keyState.left = false
		elseif event.keyName == "right" then
			keyState.right = false
		end
	end
end

-- função para mover o objeto

function updatePlayer()
	local spd = 5

	if keyState.up then
		boo.y = boo.y - spd
	end

	if keyState.down then
		boo.y = boo.y + spd
	end

	if keyState.left then
		boo.x = boo.x - spd
		boo.xScale = 1
	end

	if keyState.right then
		boo.x = boo.x + spd
		boo.xScale = -1
	end
end

Runtime:addEventListener("key", onKeyEvent)

Runtime:addEventListener("enterFrame", updatePlayer)