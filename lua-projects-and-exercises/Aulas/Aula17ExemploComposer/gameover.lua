local composer = require("composer")

local scene = composer.newScene()

function scene:create(event)
	local sceneGroup = self.view

	local bg = display.newRect(sceneGroup, centerX, centerY, display.contentWidth, display.contentHeight)
	bg:setFillColor(1,0,0)

	local logo = display.newRoundedRect(sceneGroup, centerX, centerY, 300, 300, 20)
	logo:setFillColor(1,0.5,0)

	local gameOverText = display.newText(sceneGroup, "GAME OVER", centerX, centerY-50, native.systemFont, 24)

	local replayButton = display.newText(sceneGroup, "Replay", centerX, centerY+50, native.systemFont, 24)
	
	local menuButton = display.newText(sceneGroup, "Menu", centerX, centerY+100, native.systemFont, 24)

	replayButton:addEventListener("tap", function(event)
		composer.removeScene("game")
		composer.gotoScene("game", {effect="fade", time=500})
	end)

	menuButton:addEventListener("tap", function(event)
		composer.removeScene("game")
		composer.gotoScene("menu", {effect="fade", time=500})
	end)
end

scene:addEventListener("create", scene)

return scene