--=====================================
--MAIN.LUA
--=====================================

-- Importa a biblioteca de Composer (Cenas)
local composer = require("composer")

-- Coordenadas Globais de tela
centerX = display.contentCenterX
centerY = display.contentCenterY

-- Iniciar o Composer
composer.gotoScene("menu", {effect="fade", time=1000})