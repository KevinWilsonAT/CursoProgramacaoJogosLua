--=====================================
--MAIN.LUA
--=====================================

-- Import composer library (Scenes)
local composer = require("composer")

-- screen settings and global display Coordinates

display.setStatusBar(display.HiddenStatusBar)

dispWidth = display.contentWidth+500
dispHeight = display.contentHeight

centerX = display.contentCenterX
centerY = display.contentCenterY

-- Iniciar o Composer
composer.gotoScene("menu")