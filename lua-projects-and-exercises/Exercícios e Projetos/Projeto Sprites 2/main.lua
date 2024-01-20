--===========================
-- Recapitulação Sprites
--==========================

--Coordenadas da tela
local larguraTela = display.contentWidth
local alturaTela = display.contentHeight

local centroX = display.contentCenterX
local centroY = display.contentCenterY

-- Declaração da Física

local physics = require("physics")
physics.start()

physics.setGravity(0, 9.8)
--physics.setDrawMode("hybrid")

local bg = display.newImageRect("imagens/bg1.png", larguraTela, alturaTela+300)
bg.x = centroX
bg.y = centroY

local ground = display.newRect(centroX, centroY+300, larguraTela, 80)
physics.addBody(ground, "static")

--------------------
-- SPRITES COELHO
--------------------

-- Cria uma tabela para armazenar as spriteSheets
local coelhoSprites = {
    idle = graphics.newImageSheet("imagens/bunny/idle.png", {
        width = 272/8, -- Largura Frame = Total da largura da imagem dividido pelo total de frames
        height = 44,
        numFrames = 8
    }),

    run = graphics.newImageSheet("imagens/bunny/run.png", {
        width = 408/12,
        height = 44,
        numFrames = 12
    }),

    hit = graphics.newImageSheet("imagens/bunny/hit.png", {
        width = 170/5,
        height = 44,
        numFrames = 5
    })
}

--Definindo as sequencias de animação

local animCoelho = {
    {name="idle", sheet=coelhoSprites.idle, start=1, count=4, time=600, loopCount=0 },
    {name="run", sheet=coelhoSprites.run, start=1, count=12, time=400, loopCount=0},
    {name="hit", sheet=coelhoSprites.hit, start=1, count=5, time=400, loopCount=0}
}

-- Criamos um objeto de exibição (sprite), usando a tabela com as folhas de imagens
-- A sintaxe é: display.newSprite(folha de Sprite, animações)
local coelho = display.newSprite(coelhoSprites.idle, animCoelho)

-- Definindo a posição inicial do personagem
coelho.x = centroX-100
coelho.y = centroY+100
coelho.xScale = -2
coelho.yScale = 2
physics.addBody(coelho, "dynamic", {friction=1, radius=40})
coelho.isFixedRotation=true

-- Inicie a animação de idle como padrão
coelho:setSequence("idle")
coelho:play()

---------------------------
-- SPRITES PLAYER
---------------------------
-- Criar uma tabela para armazenar as folhas de imagens (sprites)
local playerSprites = {
    ataq = graphics.newImageSheet("imagens/player/ataq.png", {
        width = 768/8,
        height = 80,
        numFrames = 8
    }),
    run = graphics.newImageSheet("imagens/player/run.png", {
        width = 640/8,
        height = 80,
        numFrames = 8
    }),
    idle = graphics.newImageSheet("imagens/player/idle.png", {
        width = 256/4,
        height = 80,
        numFrames = 4
    })
}

-- Define as sequencias das animações
local playerAnim = {
    {name= "idle", sheet=playerSprites.idle, start=1, count=4, time=600, loopCount=0},
    {name= "run", sheet=playerSprites.run, start=1, count=8, time=600, loopCount=0 },
    {name= "ataq", sheet=playerSprites.ataq, start=1, count=8, time=600, loopCount=0}

}

local player = display.newSprite(playerSprites.idle, playerAnim)

-- Definindi a posição inicial do personagem
player.x = centroX+100
player.y = centroY+200
player.xScale = -2
player.yScale = 2

physics.addBody(player, "dynamic", {radius=45})
player.isFixedRotation = true

-- Iniciar a animação de idle como padrão
player:setSequence("idle")
player:play()

-------------------------------
-- Sprite Player
-------------------------------

-- Crie uma tabela armazenar suas folhas de imagens
local ghostSprites = {
    aparecer = graphics.newImageSheet("imagens/ghost/aparecer.png", {
        width=176/4,
        height=30,
        numFrames=4
    }),
    desaparecer = graphics.newImageSheet("imagens/ghost/desaparecer.png", {
        width = 176 / 4,
        height=30,
        numFrames=4
    }),
    idle = graphics.newImageSheet("imagens/ghost/idle.png", {
        width = 440/10,
        height = 30,
        numFrames = 10
    })
}

-- Definir as sequencias de animação
local ghostAnim = {
    {name = "idle", sheet= ghostSprites.idle, start=1, count=10, time=600, loopCount=0},
    {name = "aparecer", sheet=ghostSprites.aparecer, start=1, count = 4, time=600, loopCount=0},
    {name = "desaparecer", sheet=ghostSprites.desaparecer, start=1, count=1, loopCount=0}
}

-- Criamos o objeto de exibição usando a tabela comas as folhas de imagens
local ghost = display.newSprite(ghostSprites.idle, ghostAnim)

-- Definir a posição inicial do personagem
ghost.x = centroX
ghost.y = centroY
ghost.xScale = -2
ghost.yScale = 2

physics.addBody(ghost, "kinematic", {radius=45})

-- Iniciar a animação de idle como padrão
ghost:setSequence("idle")
ghost:play()

-------------------------------------------
-- Sprite Sol
--------------------------

local spriteSol = graphics.newImageSheet("imagens/sun.png", {
    width = 192/6,
    height = 32,
    numFrames = 6
})

local animSol = {
    {name= "sun", start=1, count=6, time=600, loopCount=0}
}

local sol = display.newSprite(spriteSol, animSol)
sol.x = centroX
sol.y = centroY-200
sol.xScale = 3
sol.yScale = 3

sol:setSequence("sun")
sol:play()

-- Funções

local function andarParaEsquerda()
    player:setSequence("run")
    player:play()
    player.xScale = -2 
    player:setLinearVelocity(-100,0) -- Aplica uma força no eixo X(horizontal)
end

local function andarParaDireita()
    player:setSequence("run")
    player:play()
    player.xScale = 2
    player:setLinearVelocity(100,0) -- Aplica uma força no eixo X(horizontal)
end

local function pararMovimento()
    player:setSequence("idle")
    player:play()
    player:setLinearVelocity(0,0)
end

local function ataque()
    player:setSequence("ataq")
    player:play()

    coelho:setSequence("hit")
    coelho:play()

    ghost:setSequence("desaparecer")
    ghost:play()
end

local function pararAtaque()
    player:setSequence("idle")
    player:play()

    ghost:setSequence("aparecer")
    ghost:play()
end

-- Função para Movimentar o Player

local function movimentarPlayer(event)
    if (event.phase == "began") then
        if event.x < player.x then
            andarParaEsquerda()
        elseif event.x > player.x then
            andarParaDireita()
        end

    elseif (event.phase == "ended") then
        pararMovimento()
    end
end

local function botaoAtaq(event)
    if (event.phase == "began") then
        ataque()

    elseif (event.phase == "ended") then
        pararAtaque()
        coelho:setSequence("idle")
        coelho:play()

        ghost:setSequence("idle")
        ghost:play()
    end
end

local buttonAtaq = display.newRoundedRect(centroX, centroY+320, 100, 80, 20)
buttonAtaq:setFillColor(0,0,1)

-- Associar a função de toque ao botao
buttonAtaq:addEventListener("touch", botaoAtaq)

-- Associar a função de toque ao player
player:addEventListener("touch", movimentarPlayer)




