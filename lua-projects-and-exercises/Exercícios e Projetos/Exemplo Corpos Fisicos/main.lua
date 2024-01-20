--=================================
-- EXEMPLOS SIMPLES CORPOS FISICOS
--================================

-- Coordenadas de tela
local alturaTela = display.contentHeight
local larguraTela = display.contentWidth

local centroX = display.contentCenterX
local centroY = display.contentCenterY

-- Chamar a Biblioteca de física
local physics = require("physics")

-- Inicia a simulação de física
physics.start()

-- Define a força da gravidade em X e Y
physics.setGravity(0, 9.8)

-- Define se os corpos colisores vão ser visiveis
physics.setDrawMode("normal")

-- Criando paredes
local paredeEsquerda = display.newRect(0, centroY, 10, alturaTela+300)

--Adicionanando corpo colisor na parede
physics.addBody(paredeEsquerda, "static")

local paredeDireita = display.newRect(larguraTela, centroY, 10, alturaTela+300)

-- Adicionando corpo colisor na parede
physics.addBody(paredeDireita, "static")

-- Criando um chão
local chao = display.newRect(centroX, alturaTela+100, larguraTela, 20)
chao:setFillColor(0.2, 1, 0.5)

-- Adicionando corpo colisor no chão
physics.addBody(chao, "static")

-- Criando um objeto dinâmico
local boleta = display.newCircle(centroX, 120, 25)

physics.addBody(boleta, "dynamic")

-- Criando um objeto cinematico
local caixa = display.newRect(centroX+100, centroY, 50, 50)

-- Adicionando corpo colisor na caixa
physics.addBody(caixa, "kinematic")

function criarBolinhas()
    local bolinha = display.newCircle(math.random(larguraTela), 100, 10)
    physics.addBody(bolinha, "dynamic", {density=0.2, friction = 0.3, bounce = 0.2})
end

-- Crie bolinhas
for i = 1, 50 do
    criarBolinhas()
end

function moveCaixa(event)
    if event.phase == "began" or event.phase == "moved" then
        local x = event.x
        local y = event.y
        caixa.x = x
        caixa.y = y
    end
end

caixa:addEventListener("touch", moveCaixa)










