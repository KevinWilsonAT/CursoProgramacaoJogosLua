-- Projeto Eventos

-- coordenadas da tela

local dispHeight = display.contentHeight
local dispWidth = display.contentWidth

local centerX = display.contentCenterX
local centerY = display.contentCenterY

local bg = display.newImageRect("images/bg.png", dispWidth+300, dispHeight+250)
bg.x = centerX
bg.y = centerY
bg.alpha = 0.6

-- circulo atras do cogumelo verde

local circle1 = display.newCircle(centerX-100, centerY-40, 70)
circle1:setFillColor(0,1,0)
circle1.alpha = 0.5

-- circulo atras do cogumelo vermelho

local circle2 = display.newCircle(centerX+100, centerY-100, 70)
circle2:setFillColor(1,0,0)
circle2.alpha = 0.5

-- imagem cogumelo verde

local itemGreen = display.newImageRect("images/green.png", 80, 80)
itemGreen.x = centerX - 100
itemGreen.y = centerY - 40

-- transition para animar o cogumelo verde

transition.to(itemGreen, {time = 500, xScale = 1.2, yScale = 1.2, iterations = 0})

-- imagem cogumelo vermelho

local itemRed = display.newImageRect("images/red.png", 120, 80)
itemRed.x = centerX + 100
itemRed.y = centerY - 100

-- transition para animar o cogumelo vermelho

transition.to(itemRed, {time = 500, xScale = 1.2, yScale = 1.2, iterations = 0})

-- imagem mini mario

local miniMario = display.newImageRect("images/minimario.png", 90, 130)
miniMario.x = centerX
miniMario.y = centerY + 200

-- imagem mario grande

local mario = display.newImageRect("images/mario.png", 100, 200)
mario.x = centerX
mario.y = centerY + 150
mario.alpha = 0

-- frase que aparece ao clicar no cogumelo

local phrase = display.newText(" ", centerX, centerY-200, native.systemFont, 30)

-- frase de titulo que vai aparecer do canto direito até o canto esquerdo

local title = display.newText(" ", dispWidth+300, centerY-300, native.systemFont, 50)

function showTextGreen()
	phrase.text = "Isso te dá 1 vida"
	print("Tá funcionando o tap no cogumelo verde")
	phrase:setFillColor(0,1,0)
	transition.to(itemGreen, {
		time = 2000,
		y = -300,
		onComplete = function()
			itemGreen:removeSelf()
			circle1:removeSelf()
			print("Objeto destruido")
		end})
end

function marioBig()
	transition.dissolve(miniMario, mario, 3000)
	transition.to(mario, {time = 1000, xScale = 1.3, yScale = 1.3, iterations = 2})
end

function showTextRed()
	phrase.text = "Isso te dá energia"
	phrase:setFillColor(1,0,0)
	transition.to(itemRed, {
		time = 1000,
		y = -300,
		onComplete = function()
			itemRed:removeSelf()
			circle2:removeSelf()
			marioBig()
			print("Objeto destruido")
		end})
end

-- fucnção para fazer o texto do titulo aparecer 

function showTitle()
	title.text = "Shop - Conhecendo eventos"
	title:setFillColor(0,0,1)
	title.x = title.x + 2
end

-- adiciona o ouvinte de evento no Runtime
Runtime:addEventListener("enterFrame", showTitle)

-- adiciona os ouvintes de eventos nos objetos

itemGreen:addEventListener("tap", showTextGreen)
itemRed:addEventListener("tap", showTextRed)