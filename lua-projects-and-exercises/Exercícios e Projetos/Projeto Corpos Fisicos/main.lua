--========================
-- EXEMPLO ELABORADO FISICA
--=========================

-- Coordenadas de tela
local alturaTela = display.contentHeight
local larguraTela = display.contentWidth

local centroX = display.contentCenterX
local centroY = display.contentCenterY

-- Chamando a biblioteca de física
local physics = require("physics")

-- Configurar e iniciar a física
physics.start()
physics.setGravity(0, 9.8)

-- Desativando a barra de notificação
display.setStatusBar(display.HiddenStatusBar)

-- Define se os corpo colisores vão ser visiveis
physics.setDrawMode("hybrid")

local background = display.newRect(centroX, centroY, larguraTela, alturaTela+300)
background:setFillColor(0.5, 0.8, 1)

-- Criando paredes
local paredeEsquerda = display.newRect(0, centroY, 10, alturaTela+300)
paredeEsquerda:setFillColor(0,0,1)

--Adicionando corpo colisor na parede
physics.addBody(paredeEsquerda, "static")

local paredeDireita = display.newRect(larguraTela, centroY, 10, alturaTela+300)
paredeDireita:setFillColor(0,0,1)

physics.addBody(paredeDireita, "static")

-- Criando um teto
local teto = display.newRect(centroX, -100, larguraTela, 100)
teto:setFillColor(0,0,1)

physics.addBody(teto, "static")

-- Criando um chão
local chaozin = display.newRect(centroX, alturaTela+100, larguraTela, 100)
chaozin:setFillColor(0,0,1)

physics.addBody(chaozin, "static")

-- Criando um objeto dinamico
local box = display.newRect(centroX, 50, 50, 50)
box:setFillColor(1,0,0)
box.linearDamping = 1.0

physics.addBody(box, "dynamic", {density=1000, friction=0.3, bounce=0.0, linearDamping=10.0, angularDamping=10})

-- Função para fazer o objeto pular quando tocado
function jumpBox(event)
	if event.phase == "began" then
		-- Aplica uma força na coordenada Y do objeto
		box:applyLinearImpulse(math.random(-100,100), math.random(-100,100), box.x, box.y)
	end
end

box:addEventListener("touch", jumpBox)



