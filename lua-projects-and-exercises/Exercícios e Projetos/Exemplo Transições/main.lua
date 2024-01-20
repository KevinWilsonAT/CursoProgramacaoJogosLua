--===================================
-- USANDO TRANSIÇÕES
--=================================

-- Desativando a barra de notificações
display.setStatusBar(display.HiddenStatusBar)

-- Alterar a cor do background da tela
display.setDefault("background", 0.2, 0.2, 0.2)

-- Configuração da Tela
local larguraTela = display.contentWidth
local alturaTela = display.contentHeight

local centroX = display.contentCenterX
local centroY = display.contentCenterY

-- Exemplo de transition.dissolve

local bg1 = display.newRect(centroX, centroY, larguraTela, alturaTela)
bg1:setFillColor(1, 0.7, 0.5)

local bg2 = display.newRect(centroX, centroY, larguraTela, alturaTela)
bg2:setFillColor(0.5, 0.7, 0.5)

transition.dissolve(bg1, bg2, 5000)

-- Exemplo de transition.to movendo objetos e alterando propriedades

local retangulo = display.newRect(100, 100, 80, 50)

-- Defina os parametros da animação

local parametros = {

	time = 2000, -- Tempo em milisegundos (1 segundo)
	x = 50,		-- Posição final em X
	y = 380,	-- Posição final em Y
	rotation = 90, -- Rotação final (em graus)
	xScale = 2,		-- Escala final em X
	yScale = 2,		-- Escala final em Y
	alpha = 0.5 	-- Transparencia Final
	
	}

	transition.to(retangulo, parametros)

-- Exemplo - transition.to movendo objetos

local circuloAzul = display.newCircle(100, 100, 32)
circuloAzul:setFillColor(0,0,1)

transition.to(circuloAzul, {x = 200, time = 750})

local circuloVerde = display.newCircle(250, 100, 24)
circuloVerde:setFillColor(0, 1, 0)

transition.to(circuloVerde, {delay = 750, y= 250 })
transition.blink(circuloVerde)

local circuloAmarelo = display.newCircle(250, 250, 20)
circuloAmarelo:setFillColor(1,1,0)

transition.to(circuloAmarelo, {delay= 1250, x= 100, y= 50})

local circuloRosa = display.newCircle(40, centroY, 20)
circuloRosa:setFillColor(1,0,1)

transition.to(circuloRosa, {delay= 1750, y= 900})

local quadradoBranco = display.newRect(100, 100, 50, 70)

transition.to(quadradoBranco, {x = 200, y = 350, rotation = 360, time = 1000 })

-- Exemplo de transition.dissolve

local retangulo1 = display.newRect(centroX, 0, 200, 40)
retangulo1:setFillColor(0,0,0)

local retangulo2 = display.newRect(centroX, 0, 200, 40)
retangulo2:setFillColor(1,1,0)

transition.dissolve(retangulo1, retangulo2, 2000)

local nome = display.newText("Alerta! Perigo!", centroX, 0, native.systemFont, 30)
nome:setFillColor(1,0,0)

local piscar = transition.blink(nome)

-- Pausando transitions

-- transition.pause()
-- transition.resume()

-- transition.cancel()


-- Exemplo de função onComplete
local quadradex = display.newRect(0, 500, 100, 100)

-- Cria uma transição com parametros
transition.to(quadradex, {
	x = larguraTela - 50,
	time = 2000,
	onComplete = function()
		print("Transição completa: Objeto chegou no fim da tela.")
	end

})

-- Exemplo de Timer

local function timerCabo()
	print("Timer acabou!")
end

timer.performWithDelay(2000, timerCabo, 5)

-- Exemplo de math.random

-- Sem argumento
local numeroDecimal = math.random()
print(numeroDecimal)

-- Com argumento
local numeroInteiro = math.random(1, 10)
print(numeroInteiro)



-- Cria um quadrado vermelho que vai ser o inimigo

local inimigo = display.newRect(centroX, centroY, 50, 50)
inimigo:setFillColor(1,0,0)

-- Função para mover o inimigo aleatoriamente por toda a tela
function moverInimigo()
	transition.to(inimigo, {
		time = math.random(500, 2000),
		x = math.random(0, larguraTela),
		y = math.random(0, alturaTela)
	})
end

-- Timer para fazer o inimigo se mover infinitamente
timer.performWithDelay(1000, moverInimigo, 0)

function deletaInimigo()
	--Diminuir a opacidade do inimigo
	transition.to(inimigo, {time = 200, alpha = 0})

	-- Aparece um texto quando clicamo em cima do inimigo
	local texto = display.newText("Acertou ele!", centroX, centroY, native.systemFont, 20)
	texto:setFillColor(0,1,0)

	--Função que faz o inimigo aparecer de novo
	function reiniciar()
		transition.to(inimigo, {time = 500, alpha = 1})
		display.remove(texto)
	end

	timer.performWithDelay(2000, reiniciar, 0)
end

inimigo:addEventListener("tap", deletaInimigo)



