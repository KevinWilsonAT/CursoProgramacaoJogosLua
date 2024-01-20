--=======================
-- PAUSE.LUA
--=======================

local composer = require("composer")

local scene = composer.newScene()

function scene:create(event)
	local sceneGroup = self.view

	local bg = display.newRect(sceneGroup, centroX, centroY, display.contentWidth, display.contentHeight)
	bg:setFillColor(1, 0, 0)

	local logo = display.newRoundedRect(sceneGroup, centroX, centroY, 300, 300, 20)
	logo:setFillColor(0, 0.5, 1)

	local gameOverText = display.newText(sceneGroup, "Pause", centroX, centroY-50, native.systemFont, 24)

	local replayButton = display.newText(sceneGroup, "Reiniciar", centroX, centroY + 50, native.systemFont, 24)
	local menuButton = display.newText(sceneGroup, "Menu", centroX, centroY + 100, native.systemFont, 24)

	local function botaoReplay()
		composer.removeScene("game")
		composer.gotoScene("game", {effect="fade", time=500})
	end

	replayButton:addEventListener("tap", botaoReplay)

	menuButton:addEventListener("tap", function(event)
		composer.removeScene("game")
		composer.gotoScene("menu", {effect="fade", time=500})
	end)
end

scene:addEventListener("create", scene)

return scene