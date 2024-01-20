--=====================
-- Projeto Sprites
--=====================

-- Coordenadas da tela
local larguraTela = display.contentWidth
local alturaTela = display.contentHeight

local centroX = display.contentCenterX
local centroY = display.contentCenterY

-- Declaração da Fisica

local physics = require("physics")
physics.start()

physics.setGravity(0, 9.8)
--physics.setDrawMode("hybrid")

-- Declarando os objeto
-- Criando uma nova font
local fontText = native.newFont("font.ttf")

local bg = display.newRect(centroX, centroY, larguraTela, alturaTela+300)
bg:setFillColor(0, 0.5, 0.7)

local texto = display.newText("Bora se movimentar!", centroX, centroY-150, fontText, 40)
texto:setFillColor(0, 1, 0)
transition.blink(texto, {time=2000})

local chao = display.newRect(centroX, centroY+300, larguraTela+100, 200)
chao:setFillColor(0, 1, 0)
physics.addBody(chao, "static", {friction=1})

local spriteSheet = graphics.newImageSheet("player.png", {
  width = 540/6, 
  height = 190/2, 
  numFrames = 12
})

local animacao = {
  {name = "parado", start = 1, count = 3, time = 500, loopCount=0},
  {name = "correr", start = 5, count = 8, time = 800, loopCount=0}
}

local jogador = display.newSprite(spriteSheet, animacao)
jogador.x = centroX
jogador.y = centroY
physics.addBody(jogador, "dynamic", {radius=40})
jogador.direcao = "parado"
jogador:setSequence("parado")
jogador:play()
jogador.isFixedRotation = true

-- Declarando as Funçoes
function verificaTecla(event)
  if event.phase == "down" then -- Quando a tecla é pressionada
    if (event.keyName == "a") or (event.keyName == "left") then
      jogador.xScale = -1 -- Inverte a escala horizontal do jogador para simular a direção esquerda
      jogador.direcao = "esquerda" -- Define a direção do jogador como esquerda
      jogador:setSequence("correr") -- Define a animação de correr
      jogador:play() -- Inicia a animação

    elseif (event.keyName == "d") or (event.keyName == "right") then
      jogador.xScale = 1 -- Restaura a escala horizontal para a direita
      jogador.direcao = "direita" -- Define a direção do jogador como direita
      jogador:setSequence("correr") -- Define a sequencia de animacao correr
      jogador:play()
    end
  end

  if event.phase == "up" then -- Quando a tecla é solta
    if event.keyName == "a" or event.keyName == "d" or
      event.keyName == "left" or event.keyName == "right" then
        jogador.direcao = "parado" -- Define a direcao como paradp
        jogador:setSequence("parado") -- Define a animação como parado
        jogador:play() -- Inicia a animação
    end
  end
end

Runtime:addEventListener("key", verificaTecla)

-- Função para mover o personagem

function moverJogador()
  -- Obtem a velocidade atual do jogador.
  local velocidade = jogador:getLinearVelocity()

  -- Se a direção for esquerda e a velocidade for maior que -150
  if jogador.direcao == "esquerda" and velocidade > -150 then
    jogador:applyLinearImpulse(-0.1, 0, jogador.x, jogador.y)

  elseif jogador.direcao == "direita" and velocidade < 150 then
    jogador:applyLinearImpulse(0.1, 0, jogador.x, jogador.y)

  elseif jogador.direcao == "parado" and velocidade ~= 0 then
    jogador:setLinearVelocity(0, 0)
  end

end

Runtime:addEventListener("enterFrame", moverJogador)





