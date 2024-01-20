-- Exemplos de eventos

-- Evento "tap"

local circle = display.newCircle(display.contentCenterX, display.contentCenterY, 30)

local text = display.newText(" ", display.contentCenterX, display.contentCenterY, native.systemFont, 30)

function showTextCircle()
	text.text = "Clicou no circulo"
	text:setFillColor(1,0,0)
end

circle:addEventListener("tap", showTextCircle)

-- Evento "touch"

function touchDisplay(event)
	if event.phase == "began" then
		-- inicio do toque
		print("Toque começou")
	elseif event.phase == "moved" then
		-- movimento do toque
		print("Toque se movimenta")
	elseif event.phase == "ended" then
		-- fim do toque
		print("Toque terminou")
	end
end

Runtime:addEventListener("touch", touchDisplay)

-- Evento "enterFrame"

local player = display.newRect(0, display.contentCenterY, 100, 100)

function updateFrame()
	-- Atualizacao da posição do jogador
	player.x = player.x + 2
end

Runtime:addEventListener("enterFrame", updateFrame)

-- Evento "key"

function keyPress(event)
	if event.phase == "down" then
		-- tecla pressionada
		print("Tecla pressionada: " .. event.keyName)
	elseif event.phase == "up" then
		-- tecla solta
		print("Tecla soltou")
	end
end

Runtime:addEventListener("key", keyPress)

-- Exemplo Removendo ouvinte

function myListener()
	print("Ouvindo eventos")
end

Runtime:addEventListener("enterFrame", myListener)

-- removendo o ouvinte

timer.performWithDelay(5000, function()
	Runtime:removeEventListener("enterFrame", myListener)
	print("Ouvinte removido")
	end)