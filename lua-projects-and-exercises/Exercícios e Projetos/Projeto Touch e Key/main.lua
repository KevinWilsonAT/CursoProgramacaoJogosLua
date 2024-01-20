--==================================
-- Exemplos Elaborados Touch e Key
--==================================

-- Coordenadas da tela

local alturaTela = display.contentHeight
local larguraTela = display.contentWidth

local centroX = display.contentCenterX
local centroY = display.contentCenterY


--Imagem de fundo
local bg = display.newImageRect("imagens/bg.png", larguraTela+300, alturaTela+300)
bg.x = centroX
bg.y = centroY

-- Imagem da estrela
local star = display.newImageRect("imagens/star.png", 100, 100)
star.x = centroX-100
star.y = centroY-250
transition.to(star, {time=500, xScale=1.3, yScale=1.3, iterations=0})

-- Imagem da Flor
local flower = display.newImageRect("imagens/flower.png", 100, 100)
flower.x = centroX
flower.y = centroY-250
transition.to(flower, {time=500, xScale=1.3, yScale=1.3, iterations=0})

-- Imagem do cogumelo
local green = display.newImageRect("imagens/green.png", 100, 100)
green.x = centroX+100
green.y = centroY-250
transition.to(green, {time=500, xScale=1.3, yScale=1.3, iterations=0})

-- Imagem Caixa
local box = display.newImageRect("imagens/box.png", 120, 100)
box.x = centroX
box.y = centroY-150
transition.to(box, {time=500, xScale=1.3, yScale=1.3, iterations=0})


-- Função que será chamada quando ocorrer toque no objeto
function onTouch(event)

	-- Criamos para armazenar o objeto de destino do evento
	local target = event.target

	-- Verificamos se a fase do evento é began (inicio do toque)
	if event.phase == "began" then
		-- Usamos para definir o foco no objeto
		display.getCurrentStage():setFocus(target)

		--Definimos que o foco do toque no objeto é true
		target.isFocus = true

		-- Armazenamos as coordenadas x e y do objeto
		target.markX = target.x
		target.markY = target.y

	elseif target.isFocus then

		-- Verifica a fase do evento de toque se ta em "moved" (arrastando)
		if event.phase == "moved" then
			-- Altera as coordenadas do objeto com base
			-- no movimento do dedo, permitindo que o objeto
			-- seja movido de acordo com o movimento do dedo
			target.x = event.x - event.xStart + target.markX
			target.y = event.y - event.yStart + target.markY

		elseif event.phase == "ended" or event.phase == "cancelled" then

			-- Remove o foco do toque do objeto
			display.getCurrentStage():setFocus(nil)

			-- o toque não está mais focado no objeto
			target.isFocus = false
		end
	end
	-- Indicamos que o evento foi tratado com sucesso
	-- e n precisa ser propagado para outros objetos
	return true
end

-- Aplicamos os ouvinte de evento a um objeto
star:addEventListener("touch", onTouch)
green:addEventListener("touch", onTouch)
flower:addEventListener("touch", onTouch)
box:addEventListener("touch", onTouch)


-- Exemplo 2 - Movimentação de objeto mais elaborada usando teclado

local boo = display.newImageRect("imagens/boo.png", 200, 200)
boo.x = centroX
boo.y = centroY+150

-- Variavel para rastrear o estado das teclas
local estadoTecla = {up = false, down = false, left=false, right=false}

function onKeyEvent(event)

	if event.phase == "down" then
		if event.keyName == "up" then
			estadoTecla.up = true

		elseif event.keyName == "down" then
			estadoTecla.down = true

		elseif event.keyName == "left" then
			estadoTecla.left = true

		elseif event.keyName == "right" then
			estadoTecla.right = true	
		end

	-- Quando soltar a tecla
	elseif event.phase == "up" then
		if event.keyName == "up" then
			estadoTecla.up = false

		elseif event.keyName == "down" then
			estadoTecla.down = false

		elseif event.keyName == "left" then
			estadoTecla.left = false

		elseif event.keyName == "right" then
			estadoTecla.right = false
		end
	end
end

-- Função de atualizãção para mover o objeto
function updatePlayer()
	local velocidade = 5

	if estadoTecla.up then
		boo.y = boo.y - velocidade
	end

	if estadoTecla.down then
		boo.y = boo.y + velocidade
	end

	if estadoTecla.left then
		boo.x = boo.x - velocidade
		boo.xScale = 1
	end

	if estadoTecla.right then
		boo.x = boo.x + velocidade
		boo.xScale = -1
	end
end

-- Adiciona o ouvinte de eventos de teclado
Runtime:addEventListener("key", onKeyEvent)

-- Adiciona uma função de atualização de enterFrame
Runtime:addEventListener("enterFrame", updatePlayer )
