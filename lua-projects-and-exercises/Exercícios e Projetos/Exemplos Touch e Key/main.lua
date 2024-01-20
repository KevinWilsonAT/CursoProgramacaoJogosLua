--=================================
-- Exemplos Simples de Touch e Key
--=================================

local alturaTela = display.contentHeight
local larguraTela = display.contentWidth

local centroX = display.contentCenterX
local centroY = display.contentCenterY

-- Exemplo 1 - Movendo um objeto com teclas do teclado

-- Criar um retangulo
local player = display.newRect(centroX, centroY+200, 50, 100)
player:setFillColor(1, 0.8, 0)

local chao = display.newRect(centroX, centroY+300, larguraTela, 100)
chao:setFillColor(0, 1, 0)

-- Função para lidar com eventos de teclado
function movimentandoTeclado(event)
	local velocidade = 10 -- Velocidade do movimento do player

	if event.phase == "down" then
		if event.keyName == "up" then
			player.y = player.y - velocidade
		elseif event.keyName == "down" then
			player.y = player.y + velocidade
		elseif event.keyName == "left" then
			player.x = player.x - velocidade
		elseif event.keyName == "right" then
			player.x = player.x + velocidade
		end
	end
end

-- Adicionando o ouvinte de eventos de Key ao Runtime
Runtime:addEventListener("key", movimentandoTeclado)


-- Exemplo 2 - Mudando a cor de um objeto ao tocar nele
local bolinha = display.newCircle(centroX, centroY-100, 35)
bolinha:setFillColor(1,0,0)

function mudaCorBolinha(event)
	local obj = event.target

	if event.phase == "began" then
		obj:setFillColor(0,1,0)
		transition.to(obj, {time=500, xScale=2, yScale=2, iterations=0})

	elseif event.phase == "ended" then
		obj:setFillColor(1,0,0,0.5)
		transition.cancel()
		transition.to(obj, {time=500, xScale=1, yScale=1})
	end

	return true
end

bolinha:addEventListener("touch", mudaCorBolinha)


-- Exemplo 3 - Mudando cores ao clicar 
local quad1 = display.newRect(70, centroY-250, 50, 50)
local quad2 = display.newRect(centroX, centroY-250, 50, 50)
local quad3 = display.newRect(centroX+90, centroY-250, 50, 50)

function alteraCor(event)

	if event.phase == "began" then
		if event.target == quad1 then
			quad1:setFillColor(1,0,0)

		elseif event.target == quad2 then
			quad2:setFillColor(0,1,0)

		elseif event.target == quad3 then
			quad3:setFillColor(0,0,1)
		end

	elseif event.phase == "ended" then
		if event.target == quad1 then
			quad1:setFillColor(1,1,1)

		elseif event.target == quad2 then
			quad2:setFillColor(1,1,1)

		elseif event.target == quad3 then
			quad3:setFillColor(1,1,1)

		end
	end
end

quad1:addEventListener("touch", alteraCor)
quad2:addEventListener("touch", alteraCor)
quad3:addEventListener("touch", alteraCor)

-- Exemplo 4 - Altera cor retangulo, conforme aperta as teclas R,G e B
local retangulo = display.newRect(centroX, centroY, 150, 100)

function corRetangulo(event)
	if event.phase == "down" then

		if event.keyName == "r" then
			retangulo:setFillColor(1,0,0)

		elseif event.keyName == "g" then
			retangulo:setFillColor(0,1,0)

		elseif event.keyName == "b" then
			retangulo:setFillColor(0,0,1)

		end
	end

	return true
end

Runtime:addEventListener("key", corRetangulo)


-- Exemplo 5 - Criando uma tela "Desenhavel"

local tela = display.newRect(centroX, centroY, larguraTela, alturaTela+300)
tela:setFillColor(1,1,0)
tela.alpha = 0.5

-- Função para desenhar

function desenhar(event)
	local tinta = display.newCircle(event.x, event.y, 5)
	tinta:setFillColor(1,0,0)
end

tela:addEventListener("touch", desenhar)

