--=====================================
--MAIN.LUA
--=====================================

-- Importa a biblioteca de Composer (Cenas)
local composer = require("composer")

-- Coordenadas Globais de tela
centroX = display.contentCenterX
centroY = display.contentCenterY



-- Iniciar o Composer
composer.gotoScene("menu", {effect="fade", time=1000})