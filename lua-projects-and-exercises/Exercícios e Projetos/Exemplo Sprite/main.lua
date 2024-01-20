--================================
-- Animações com sprites
--===============================

--Primeiramente chamamos a SpriteSheet
local spriteSheet = graphics.newImageSheet("player.png", {
  width = 540/6, -- largura do frame
  height = 190/2, -- altura do frame
  numFrames = 12, -- numero de frames
  sheetContentWidth = 540, -- largura total do spritesheet
  sheetContentHeight = 190 -- altura total do spritesheet
})

-- Precisamos organizar as animações do spriteSheet que foi carregado
-- Sintaxe: nome, inicio, contagem de frames até o final, tempo, loop

local animacao = {
  {name = "parado", start = 1, count = 3, time = 500, loopCount = 0},
  {name = "correr", start = 5, count = 8, time = 500, loopCount = 0}
}

-- Antes de iniciar, precisamos juntar o spritesheet e a animação em um só objeto
-- Para juntar as duas informações, utilizamos a função display.newSprite(spriteSheet, animacao)

local jogador = display.newSprite(spriteSheet, animacao)
jogador.x = display.contentCenterX
jogador.y = display.contentCenterY
jogador.xScale = 2
jogador.yScale = 2

-- Agora, definimos qual animação será a inicial
jogador:setSequence("parado")

-- E iniciamos a animação
jogador:play()

-- Bora criar botoes que mudam as animações

local buttonIdle = display.newRoundedRect(70, 50, 100, 50, 20)
buttonIdle:setFillColor(0, 0, 1)

local buttonRun = display.newRoundedRect(250, 50, 100, 50, 20)
buttonRun:setFillColor(0, 1, 0)

local buttonPause = display.newRoundedRect(160, 120, 100, 50, 20)
buttonPause:setFillColor(1, 0, 0)

local textIdleButton = display.newText("Idle", buttonIdle.x, buttonIdle.y, native.systemFont, 25)
local textRunButton = display.newText("Run", buttonRun.x, buttonRun.y, native.systemFont, 25)
local textPauseButton = display.newText("Pause", buttonPause.x, buttonPause.y, native.systemFont, 25)

function idle()
  jogador:setSequence("parado")
  jogador:play()
end

function run()
  jogador:setSequence("correr")
  jogador:play()
end

function pause()
  jogador:pause()
end

buttonRun:addEventListener("tap", run)
buttonIdle:addEventListener("tap", idle)
buttonPause:addEventListener("tap", pause)