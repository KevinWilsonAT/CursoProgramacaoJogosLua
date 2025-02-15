--================================
-- GAME.LUA
--================================

local composer = require("composer")

local scene = composer.newScene()

local physics = require ("physics")
physics.start()
physics.setGravity(0, 9.8)


function scene:create(event)
	local sceneGroup = self.view

	local bg = display.newRect(sceneGroup, centerX, centerY, display.contentWidth, display.contentHeight)
	bg:setFillColor(0,0,1)

	local ground = display.newRect(sceneGroup, centerX, centerY+200, 400, 100)
	ground:setFillColor(0,1,0)
	physics.addBody(ground, "static")

	local bolinha = display.newCircle(sceneGroup, centerX, centerY, 20)
	bolinha:setFillColor(1,0,0)
	physics.addBody(bolinha, "dynamic")

	local menuB = display.newRoundedRect(sceneGroup, centerX+120, centerY-200, 40, 40, 10)
	menuB:setFillColor(0,0.5,1)

	local menuBtext = display.newText(sceneGroup, "| |", menuB.x, menuB.y, native.systemFont, 20)

	local gameOverButton = display.newText(sceneGroup, "Game Over", centerX, centerY-150, native.systemFont, 20)

	menuB:addEventListener("tap", function(event)
		composer.gotoScene("pause", {effect="fade", time=500})
	end)

	gameOverButton:addEventListener("tap", function(event)
		composer.gotoScene("gameover", {effect="fade", time=500})
	end)
end

scene:addEventListener("create", scene)

return scene