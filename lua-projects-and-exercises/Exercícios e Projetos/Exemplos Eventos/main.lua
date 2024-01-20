--================================
-- Exemplos de Eventos
--================================

-- Exemplos Evento "Tap"
local circulo = display.newCircle(display.contentCenterX, display.contentCenterY, 30)

local texto = display.newText(" ", display.contentCenterX, display.contentCenterY, native.systemFont, 30)

function mostrarTextoNoCirculo()
	texto.text = "Clicou no círculo!"
	texto:setFillColor(1,0,0)
end

circulo:addEventListener("tap", mostrarTextoNoCirculo)


-- Exemplo evento Touch

function toqueNaTela(event)
	if event.phase == "began" then
		-- Inicio do toque
		print("Toque começou.")
	elseif event.phase == "moved" then
		-- Movimento do toque
		print("Toque em movimento")
	elseif event.phase == "ended" then
		-- Fim do toque
		print("Toque terminou")
	end
end

Runtime:addEventListener("touch", toqueNaTela)


-- Exemplo de Evento "enterFrame"
local jogador = display.newRect(0, display.contentCenterY, 100, 100)

function atualizacaoDeQuadro()
	--Atualização da posição do jogador
	jogador.x = jogador.x + 2
end

Runtime:addEventListener("enterFrame", atualizacaoDeQuadro)


-- Exemplo Evento "key"

function teclaPressionada(event)
	if event.phase == "down" then
		-- Tecla pressionada
		print("Tecla pressionada: " .. event.keyName)
	elseif event.phase == "up" then
		-- Tecla solta
		print("Tecla solta: " .. event.keyName)
	end
end

Runtime:addEventListener("key", teclaPressionada)

-- Exemplo Removendo Ouvinte

function meuOuvinte()
	print("Ouvindo eventos!")
end

Runtime:addEventListener("enterFrame", meuOuvinte)

-- Removendo o ouvinte após 5 segundos
timer.performWithDelay(5000, function()
	Runtime:removeEventListener("enterFrame", meuOuvinte)
	print("Ouvinte removido!")
	end)

