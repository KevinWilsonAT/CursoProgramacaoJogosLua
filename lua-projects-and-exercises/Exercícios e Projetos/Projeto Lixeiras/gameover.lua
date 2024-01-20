--================
-- TUTORIAL.LUA
--================

local composer = require("composer")
local cena = composer.newScene()

function cena:create(event)
	local grupoGameover = self.view

	-- Coordenadas Telas
	local larguraTela = display.contentWidth
	local alturaTela = display.contentHeight

	local centroX = display.contentCenterX
	local centroY = display.contentCenterY

	local nome = display.newText(grupoGameover, "GAMEOVER", centroX, centroY-300, native.systemFont, 200 )
	nome:setFillColor(0,1,0.3)

	local botaoJogar = display.newRoundedRect(grupoGameover, centroX, centroY+100, 400, 150, 30)
	botaoJogar:setFillColor(0,1,0.3)

	local textoJogar = display.newText(grupoGameover, "JOGAR", botaoJogar.x, botaoJogar.y, native.systemFont, 100)

	local botaoVoltar = display.newRoundedRect(grupoGameover, centroX, centroY+300, 530, 150, 30)
	botaoVoltar:setFillColor(0,1,0.3)

	local textoVoltar = display.newText(grupoGameover, "VOLTAR", botaoVoltar.x, botaoVoltar.y, native.systemFont, 100)

	function proximaCena(event)
		if(event.target == botaoJogar) then
			composer.gotoScene("game", {time=500, effect="fade"})

		elseif (event.target == botaoVoltar) then
			composer.gotoScene("menu", {time=500, effect="fade"})
		end
	end

	botaoJogar:addEventListener("touch", proximaCena)
	botaoVoltar:addEventListener("touch", proximaCena)


end

cena:addEventListener("create", cena)
return cena