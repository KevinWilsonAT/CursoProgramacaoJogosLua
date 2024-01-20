--========================
-- UTILIZANDO AUDIO
--========================

-- Coordenadas de tela

local alturaTela = display.contentHeight
local larguraTela = display.contentWidth

local centroX = display.contentCenterX
local centroY = display.contentCenterY

--Utilizando para sons curtos
-- Parametros:
local audioTiro = audio.loadSound("audio/tiro.wav")

-- Utilizando para sons de fundo
-- Parametros:

local audioBg = audio.loadStream("audio/audio_bg.mp3")

-- Reservar um canal para musica de fundo
audio.reserveChannels(1)

-- Controlar o volume do canal
local volume = 0.3
audio.setVolume(volume, {channel = 1})

-- Dar Play no som
audio.play(audioBg, {channel = 1, loops = -1})

-- Criando Botoes
local botaoTiro = display.newCircle(centroX, centroY+200, 32)
botaoTiro:setFillColor(1, 0, 0)

-- Botão para pausar a música de fundo
local botaoPausar = display.newRoundedRect(centroX-50, centroY-150, 80, 50, 20)
botaoPausar:setFillColor(1, 0, 0)

local textoPausar = display.newText("Pausar", botaoPausar.x, botaoPausar.y, native.systemFont, 20)

-- Botão para retomar a musica de fundo
local botaoRetomar = display.newRoundedRect(centroX+50, centroY-150, 80, 50, 20)
botaoRetomar:setFillColor(0, 1, 0)

local textoRetomar = display.newText("Play", botaoRetomar.x, botaoRetomar.y, native.systemFont, 20)

-- Botão para aumentar volume

local botaoVolumeUp = display.newRoundedRect(centroX-50, centroY-80, 80, 50, 20)
botaoVolumeUp:setFillColor(0, 0, 1)

local textoAumentar = display.newText("+", botaoVolumeUp.x, botaoVolumeUp.y, native.systemFont, 60)

-- Botão para diminuir volume
local botaoVolumeDown = display.newRoundedRect(centroX+50, centroY-80, 80, 50, 20)
botaoVolumeDown:setFillColor(1, 0.6, 0)

local textoDiminuir = display.newText("-", botaoVolumeDown.x, botaoVolumeDown.y, native.systemFont, 60)

-- Função para o som de tiro
function tocarTiro()
    audio.play(audioTiro)
end

-- Função para pausar audio
function pausarAudio()
    audio.pause(1) -- pausa o canal de musica de fundo
end

-- Função Retomar Audio
function retomarAudio()
    audio.resume(1) -- Retoma o canal de fundo
end

function aumentarVolume(event)
    if event.phase == "began" then
        if volume < 1 then
            volume = volume + 0.1
            audio.setVolume(volume, {channel = 1})
        end
    end
end

function diminuirVolume(event)
    if event.phase == "began" then
        if volume > 0 then
            volume = volume - 0.1
            audio.setVolume(volume, {channel = 1})
        end
    end
end

botaoTiro:addEventListener("tap", tocarTiro)
botaoPausar:addEventListener("tap", pausarAudio)
botaoRetomar:addEventListener("tap", retomarAudio)
botaoVolumeUp:addEventListener("touch", aumentarVolume)
botaoVolumeDown:addEventListener("touch", diminuirVolume)
