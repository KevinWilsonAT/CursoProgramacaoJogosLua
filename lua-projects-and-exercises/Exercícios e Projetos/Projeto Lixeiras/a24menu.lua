--================
--MENU.LUA
--================

local composer = require("composer")
local cena = composer.newScene()

function cena:create(event)
	local grupoMenu = self.view

	-- Coordenadas Tela
	local larguraTela = display.contentWidth
	local alturaTela = display.contentHeight

	local centroX = display.contentCenterX
	local centroY = display.contentCenterY

	local bg = display.newImageRect(grupoMenu, "imagens/fundomenu.jpg", larguraTela, alturaTela)
	bg.x = centroX
	bg.y = centroY

	local nomeJogo = display.newText(grupoMenu, "ReciclaGame", centroX, centroY-150, native.systemFont, 300 )
	nomeJogo:setFillColor(0, 1, 0.3)

	local botaoJogar = display.newRoundedRect(grupoMenu, centroX, centroY+100, 400, 150, 30)
	botaoJogar:setFillColor(0, 1, 0.3)

	local textoJogar = display.newText(grupoMenu,"JOGAR", botaoJogar.x, botaoJogar.y, native.systemFont, 100 )

	local botaoTutorial = display.newRoundedRect(grupoMenu, centroX, centroY+300, 530, 150, 30)
	botaoTutorial:setFillColor(0, 1, 0.3)

	local textoTutorial = display.newText(grupoMenu, "TUTORIAL", botaoTutorial.x, botaoTutorial.y, native.systemFont, 100)

	function proximaCena(event)
		if (event.target == botaoJogar) then
			composer.gotoScene("game", {time=500, effect="fade"})

		elseif (event.target == botaoTutorial) then
			composer.gotoScene("tutorial", {time=500, effect="fade"})
		end
	end

	botaoJogar:addEventListener("touch", proximaCena)
	botaoTutorial:addEventListener("touch", proximaCena)

end

cena:addEventListener("create", cena)
return cena