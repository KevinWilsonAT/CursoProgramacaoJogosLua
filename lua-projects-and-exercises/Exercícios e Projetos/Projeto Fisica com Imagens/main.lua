--=============================
-- Exemplos Fisica com imagens
--=============================

-- Chamando a Biblioteca de física
local physics = require ("physics")

-- Iniciando a simulação de física
physics.start()

-- Definindo o valor da gravidade em X e Y
physics.setGravity(0, 30)

-- Alterando o modo de exibição: pode ser "normal", "hybrid", "debug"
--physics.setDrawMode("hybrid")


-- Coordenadas da tela
local larguraTela = display.contentWidth
local alturaTela = display.contentHeight

local centroX = display.contentCenterX
local centroY = display.contentCenterY


-- Imagem de fundo
local bg = display.newImageRect("imagens/bg.png", larguraTela+300, 200)
bg.x = centroX
bg.y = centroY+60
physics.addBody(bg, "static", {box={x=0, y=120, halfWidth=bg.width, halfHeight=bg.height*0.3}})

local paredeEsquerda = display.newRect(-110, centroY, 10, alturaTela)
paredeEsquerda.alpha = 0

physics.addBody(paredeEsquerda, "static")

local paredeDireita = display.newRect(larguraTela+110, centroY, 10, alturaTela)
paredeDireita.alpha = 0

physics.addBody(paredeDireita, "static")

local player = display.newImageRect("imagens/toad.png", 100, 100)
player.x = centroX-250
player.y = centroY

physics.addBody(player, "dynamic", {radius=44})

local bullet = display.newImageRect("imagens/ball.png", 50, 30)
bullet.x = centroX+300
bullet.y = centroY+100
physics.addBody(bullet, "kinematic", {radius=25, isBullet=true})

function canhao(event)
    if event.phase == "began" then

        bullet:setLinearVelocity(-5000, 0, bullet.x, bullet.y)
    end
end

bullet:addEventListener("touch", canhao)

function atirar()
    local bala = display.newImageRect("imagens/ball.png", 20, 15)
    bala.x = player.x
    bala.y = player.y 
    bala.xScale = -1
    physics.addBody(bala, "kinematic", {isBullet=true})

    bala:setLinearVelocity(2000, 0, bala.x, bala.y)
end

player:addEventListener("tap", atirar)

-- Função para criar cogumelos
function criarCogumelos()
    local cogumelo = display.newImageRect("imagens/mush.png", 20, 20)
    cogumelo.x = math.random(larguraTela)
    cogumelo.y = centroY-300
    physics.addBody(cogumelo, "dynamic", {radius=10, bounce=0.5})

    local cogumeloVerde = display.newImageRect("imagens/mushlife.png", 20, 20)
    cogumeloVerde.x = math.random(larguraTela)
    cogumeloVerde.y = centroY-300
    physics.addBody(cogumeloVerde, "dynamic", {density=1, bounce=10})

end

for i = 1,100 do
    criarCogumelos()  
end


-- Função para pausar a simulação de física
function pausarFisica()
    physics.pause()
end

function retomarFisica()
    physics.start()
end

-- botão para Pausar
local botaoPausar = display.newRoundedRect(250, 50, 100, 30, 20)
botaoPausar:setFillColor(1,0,0)

local pauseText = display.newText("Pause", 250, 50, native.systemFont, 20)

botaoPausar:addEventListener("tap", pausarFisica)

-- Botão para retomar
local botaoRetomar = display.newRoundedRect(400, 50, 100, 30, 20)
botaoRetomar:setFillColor(0,1,0)

local retomarText = display.newText("Start", 400, 50, native.systemFont, 20)

botaoRetomar:addEventListener("tap", retomarFisica)





