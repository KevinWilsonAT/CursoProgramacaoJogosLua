--============================
-- PROJETO EVENTOS
--============================

-- Coordenadas da tela
local alturaTela = display.contentHeight
local larguraTela = display.contentWidth

local centroX = display.contentCenterX
local centroY = display.contentCenterY

-- Imagem de Fundo
local bg = display.newImageRect("imagens/bg.png", larguraTela+300, alturaTela+250)
bg.x = centroX
bg.y = centroY
bg.alpha = 0.6

-- Circulo atrás do cogumelo Verde
local circulo1 = display.newCircle(centroX-100, centroY-40, 70)
circulo1:setFillColor(0,1,0)
circulo1.alpha = 0.5

-- Circulo atrás do cogumelo Vermelho
local circulo2 = display.newCircle(centroX+100, centroY-100, 70)
circulo2:setFillColor(1,0,0)
circulo2.alpha = 0.5

-- Imagem Cogumelo Verde
local itemVerde = display.newImageRect("imagens/green.png", 80, 80)
itemVerde.x = centroX-100
itemVerde.y = centroY-40

-- Transition para animar o objeto cogumelo Verde
transition.to(itemVerde, {time = 500, xScale = 1.2, yScale = 1.2, iterations = 0 })

-- Imagem Cogumelo vermelho
local itemVermelho = display.newImageRect("imagens/red.png", 120, 80)
itemVermelho.x = centroX+100
itemVermelho.y = centroY-100

-- Transition para animar o objeto cogumelo vermelho
transition.to(itemVermelho, {time=500, xScale=1.2, yScale=1.2, iterations=0})

-- Imagem Mini Mario
local miniMario = display.newImageRect("imagens/minimario.png", 90, 130)
miniMario.x = centroX
miniMario.y = centroY+200

-- Imagem Mario Grande
local mario = display.newImageRect("imagens/mario.png", 100, 200)
mario.x = centroX
mario.y = centroY+150
mario.alpha = 0

-- Frase que vai aparecer ao clicar no cogumelo
local frase = display.newText(" ", centroX, centroY-200, native.systemFont, 30)

-- Frase de titulo que vai aparecer do canto direito até o canto esquerdo
local titulo = display.newText(" ", larguraTela+300, centroY-300, native.systemFont, 50)

-- Função para aparecer o texto ao clicar no cogumelo Verde, vai fazer o cogumelo sair da tela e desaparecer
function aparecerTextoGreen()
	frase.text = "Isso te dá 01 vida!"
	print("Tá funcionando o tap no cogumelo Verde.")
	frase:setFillColor(0,1,0)
	transition.to(itemVerde, {
		time = 2000,
		y= -300,
		onComplete = function()
			itemVerde:removeSelf()
			circulo1:removeSelf()
			print("Objeto Destruido")
		end})
end

function marioGrande()
	transition.dissolve(miniMario, mario, 3000)
	transition.to(mario, {time=1000, xScale=1.3, yScale=1.3, iterations = 2})
end

function aparecerTextoRed()
	frase.text = "Isso te dá energia!"
	print("Tá funcionando o tap no cogumelo Vermelho")
	frase:setFillColor(1,0,0)
	transition.to(itemVermelho, {
		time=2000,
		y=-300,
		onComplete = function()
			itemVermelho:removeSelf()
			circulo2:removeSelf()
			marioGrande()
			print("Objeto Destruido")
		end})
end

-- Função para fazer o texto do titulo aparecer
function aparecerTitulo()
	titulo.text = "Lojinha: Conhecendo Eventos"
	titulo:setFillColor(0,0,1)
	titulo.x = titulo.x - 2
end

-- Adiciona os ouvintes de eventos nos objetos
itemVerde:addEventListener("tap", aparecerTextoGreen)
itemVermelho:addEventListener("tap", aparecerTextoRed)

-- Adiciona o ouvinte de evento ao Runtime, que é o periodo em que o jogo ta em execução
Runtime:addEventListener("enterFrame", aparecerTitulo)



