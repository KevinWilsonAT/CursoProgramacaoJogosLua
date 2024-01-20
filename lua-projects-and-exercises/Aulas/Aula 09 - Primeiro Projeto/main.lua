-- chama as configurações da biblioteca de física dentro do código

local physics = require ("physics")

-- inicia a física do projeto
physics.start()

-- mostrar corpo colisor dos objetos
physics.setDrawMode("hybrid")

-- local largTela = display.contentWidth
-- local altTela = display.contentHeight

-- definimos os valores do centro da tela em x e y

local centerX = display.contentCenterX
local centerY = display.contentCenterY


-- inserindo obejtos do projeto

local initialPoints = 0

local background = display.newImageRect("Images/bg.png", 800, 600)
background.x = centerX
background.y = centerY

-- criar um círculo preto para ser a pontuação

local circPoints = display.newCircle(centerX, centerY-200, 50)
circPoints:setFillColor(0,0,0)
circPoints.strokeWidth = 2
circPoints:setStrokeColor(1,1,0)

-- criar um objeto de texto para mostrar a pontuação

local pointText = display.newText(initialPoints, centerX, centerY-200, native.systemFont, 60)
pointText:setFillColor(1,1,0)

-- criar um chão invisível a partir de um retângulo

local floor = display.newRect(centerX, centerY+260, 400, 80)
floor.alpha = 0

-- criar uma imagem para ser o baby mario

local babyMario = display.newImageRect("Images/babymario.png", 112, 112)
babyMario.x = centerX
babyMario.y = centerY

-- aplicando corpos colisores aos objetos

-- cria o corpo colisor no objeto floor (estático, não afetado pela gravidade)

physics.addBody(floor, "static")

-- cria o corpo colisor no objeto babyMario (dinâmico, afetado pela gravidade)

physics.addBody(babyMario, "dynamic", {radius=50, bounce=0})

-- criando funções

-- função que ao clicar no baby mario, empurra ele para cima
-- somar pontos a todo clique

local function pushBabyMario()
	-- applyLinearImpulse aplica um empurrão ao objeto
	-- os 2 primeiros parâmetros indicam a qtde de força direcional em X e Y
	-- para empurrar somente para cima, altere somente Y
	-- informar onde aplicar essa força direcional: X e Y do objeto

	babyMario:applyLinearImpulse(0, -0.75, babyMario.x, babyMario.y)
	initialPoints = initialPoints + 1
	pointText.text = initialPoints
end

local function losePoints()
	initialPoints = 0
	pointText.text = initialPoints
end

-- aqui chamamos as funções

-- adicionando a função de empurrar no baby mario
babyMario:addEventListener("tap", pushBabyMario)

-- adicionando a função de perder pontos
floor:addEventListener("collision", losePoints)