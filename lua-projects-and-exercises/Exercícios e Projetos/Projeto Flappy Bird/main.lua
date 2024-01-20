--====================
-- MAIN.LUA
--====================

local composer = require("composer")

-- Cena que o projeto irá iniciar
composer.gotoScene("inicio")

-- Remove a Barra de Status
display.setStatusBar(display.HiddenStatusBar)

-- Variaveis Globais
audioMorte = audio.loadSound("recursos/audio/die.mp3")

audioPonto = audio.loadSound("recursos/audio/point.mp3")

audioTransicao = audio.loadSound("recursos/audio/wing.mp3")

audioVoar = audio.loadSound("recursos/audio/swoosh.mp3")
