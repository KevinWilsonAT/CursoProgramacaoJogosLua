--====================================
-- Projeto Colisões
--====================================

-- Coordenadas da tela
local larguraTela = display.contentWidth
local alturaTela = display. contentHeight

local centroX = display.contentCenterX
local centroY = display.contentCenterY


-- Chamando a biblioteca de física
local physics = require ("physics")

-- Iniciando a Simulação de física
physics.start()

-- Definindo o valor da gravidade em x e y
physics.setGravity(0, 30)

-- Alterando o modo de exibição
--physics.setDrawMode("hybrid")


local morto = false

local vidas = 3
local pontos = 0


-- Criar Fundo azul

local background = display.newRect(centroX, centroY, larguraTela*2, alturaTela)
background:setFillColor(0,0.6,1)

-- Cria o texto dos pontos
local pontosText = display.newText("Pontos: " .. pontos, centroX+150, centroY-130, native.systemFont, 30)
pontosText:setFillColor(1,0,0)

-- Cria os corações de vidas
local vida1 = display.newImageRect("imagens/vida.png", 40, 40)
vida1.x = centroX-250
vida1.y = centroY-130

local vida2 = display.newImageRect("imagens/vida.png", 40, 40)
vida2.x = centroX-200
vida2.y = centroY-130

local vida3 = display.newImageRect("imagens/vida.png", 40, 40)
vida3.x = centroX-150
vida3.y = centroY-130

-- Cria o chão
local ground = display.newImageRect("imagens/ground.png", larguraTela*3, 100)
ground.x = centroX
ground.y = centroY+120

-- Adicionar corpo colisor estatico, e altera o tamanho do corpo colisor
physics.addBody(ground, "static", {friction=2, box={x=0, y=0, halfWidth=ground.width, halfHeight=ground.height*0.2}})

-- Cria o riozinho
local rio = display.newImageRect("imagens/water.png", larguraTela*3, 100)
rio.x = centroX
rio.y = centroY+150

transition.to(ground, {time=3000, x=1, iterations=0})
transition.to(rio, {time=4000, x=1, iterations=0})

-- Cria o nosso player
local mario = display.newImageRect("imagens/mario.png", 50, 70)
mario.x = centroX-500
mario.y = centroY+40
mario.rotation = 10

-- Adiciona uma identificação para usar na função de colisão
mario.myName = "player"

-- Adiciona o corpo colisor do Mario
physics.addBody(mario, "dynamic", {density=0.3, radius=30})

-- Transition para ele aparecer quando iniciar o jogo
transition.to(mario, {time=600, x=centroX-250})


function criarInimigos()

    local goomba = display.newImageRect("imagens/goomba.png", 40, 50)
    goomba.x = 1500
    goomba.y = centroY+80
    goomba.rotation =-20
    goomba.myName = "enemy"
    physics.addBody(goomba, "kinematic", {radius=25, isSensor=true})

    transition.to(goomba, {x=-200, time=math.random(2000, 6000), onComplete = function()
                display.remove(goomba)
            end})
end

-- Timer que cria Inimigos aleatorios
timer.performWithDelay(math.random(2000, 3000), criarInimigos, 0)


-- Função para criar moedas
function criarMoedas()

    local moeda = display.newImageRect("imagens/coin.png", 30, 20)
    moeda.x = larguraTela+300
    moeda.y = math.random(50, 200)
    moeda.myName = "moeda"
    physics.addBody(moeda, "kinematic", {radius = 20, isSensor=true})

    -- Transition para animar a moeda
    transition.to(moeda, {xScale=2, yScale=2, time=500, iterations=0})

    -- Transition para movimentar a moeda da direita para esquerda e depois remove-la do jogo
    transition.to(moeda, {x= -100, y=math.random(100, 200), time=5000, onComplete = function()
                    display.remove(moeda)
                end})
end

-- Timer que chama e cria moedas aleatorias na tela
timer.performWithDelay(math.random(800,1000), criarMoedas, 0)

-- Função para atualizar os pontos quando coletar moedas
function atualizarPontostext()
    pontos = pontos + 1
    pontosText.text = "Pontos: " .. pontos
end

-- Função pra atualizar a quantidade de vidas
function atualizaVida()
    vidas = vidas - 1
end

-- Função para remover coração quando perder vida
function perderVida()
    print("perdeu vida")

    if vidas == 3 then
        display.remove(vida3)

    elseif vidas == 2 then
        display.remove(vida2)

    elseif vidas == 1 then
        display.remove(vida1)
    end

    atualizaVida()
end

-- Função Mario Pular
function pular(event)
    if (event.phase == "began") then

        mario:applyLinearImpulse(0, -15, mario.x, mario.y)

    end
end

Runtime:addEventListener("touch", pular)


-- Função restaurar Player ao colidir com inimigo
function restorePlayer()
    mario.isBodyActive = false
    transition.to(mario, {alpha=1, time=400,
    onComplete = function()
        mario.isBodyActive = true
        morto = false
    end})
end

-- Função de Evento de Colisão
function onCollision (event)

    if event.phase == "began" then
        local obj1 = event.object1
        local obj2 = event.object2

        -- Se o obj1 for o player e o obj2 for a moeda OU vice versa
        if (obj1.myName == "player" and obj2.myName == "moeda") or 
            (obj1.myName == "moeda" and obj2.myName == "player") then

                if obj1.myName == "moeda" then
                    display.remove(obj1)
                else
                    display.remove(obj2)
                end

                atualizarPontostext()

        elseif (obj1.myName == "player" and obj2.myName == "enemy") or 
                (obj1.myName == "enemy" and obj2.myName == "player") then

                if (morto == false) then

                    morto = true -- Morto vira true
                    mario.alpha = 0.3 -- Diminui a transparencia do player para simular dano
                    timer.performWithDelay(1000, restorePlayer) -- timer para restaurar o player ao normal
                    perderVida() -- Remove um coração de vida

                end
        end
    end
end

Runtime:addEventListener("collision", onCollision)






