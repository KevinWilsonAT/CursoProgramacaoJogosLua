--==========================
-- TUTORIAL.LUA
--==========================

-- Chama a biblioteca do Composer
local composer = require("composer")

-- Cria uma nova cena
local scene = composer.newScene()


-- Criamos a função de criar a cena

function scene:create(event)

	local sceneGroup = self.view

	-- small tutorial

	local titleText = display.newText(sceneGroup, "TUTORIAL", centerX, centerY-310, "fonts/monsterfriend.otf", 60)

	local tutTitleText = display.newImageRect(sceneGroup, "images/text-tut.png", dispWidth-40, dispHeight-230)
	tutTitleText.x = centerX
	tutTitleText.y = centerY+45

	local text = display.newText(sceneGroup,"SOMENTE O AMARELO POR ENQUANTO", centerX-155, centerY+300, "fonts/8bit-operator.ttf", 70)
	text:setFillColor(1,1,0)

	tutBg = display.newRect(sceneGroup, centerX+575, centerY+285, 330, 130)
	tutBg:setFillColor(1,1,0)


	local tutBtn = display.newImageRect(sceneGroup,"images/button.png", 330, 130)
	tutBtn.x = centerX+575
	tutBtn.y = centerY+285

	local tutText = display.newText(sceneGroup, "PLAY", centerX+585, centerY+280, "fonts/mercy.ttf", 85)
	tutText:setFillColor(1,1,0)

	transition.to(tutTitleText, {time=3000, y = 400, iterations=0, transition=easing.outElastic})

	tutBtn:addEventListener("tap", function(event)
		composer.gotoScene("game", {effect="fade", time=500})
	end)
end

scene:addEventListener("create", scene)

return scene