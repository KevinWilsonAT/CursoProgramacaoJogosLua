--==========================
-- MENU.LUA
--==========================

-- Chama a biblioteca do Composer
local composer = require("composer")

-- Cria uma nova cena
local scene = composer.newScene()


-- Criamos a função de criar a cena

function scene:create(event)
	local sceneGroup = self.view
	
	-- menu frame and background

	local bgMenuFrame = display.newRect(sceneGroup, centerX, centerY, dispWidth, dispHeight)
	bgMenuFrame:setFillColor(1,1,1)

	local bgMenu = display.newRect(sceneGroup, centerX, centerY, dispWidth-15, dispHeight-15)
	bgMenu:setFillColor(0,0,0)

	-- titleScreen

	local titleText = display.newText(sceneGroup, "DESAFIO 7", centerX, centerY-305, "fonts/monsterfriend.otf", 60)
	local subtitleText = display.newText(sceneGroup, "EVENTOS E CORPOS FÍSICOS", centerX, centerY-250, "fonts/8bit-operator.ttf", 57)

	startBg = display.newRect(sceneGroup, centerX, centerY+200, 330, 130)
	startBg:setFillColor(1,1,0)

	-- Image to use while don't have code to the buttons font

	local startBtn = display.newImageRect(sceneGroup, "images/button.png", 330, 130)
	startBtn.x = centerX
	startBtn.y = centerY+200

	local startText = display.newText(sceneGroup, "START", centerX+6, centerY+195, "fonts/mercy.ttf", 70)
	startText:setFillColor(1,1,0)

	startBtn:addEventListener("tap", function(event)
		composer.gotoScene("tutorial", {effect="slideDown", time=500})
	end)
end

scene:addEventListener("create", scene)

return scene