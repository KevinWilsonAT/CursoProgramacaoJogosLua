--================
-- TUTORIAL.LUA
--================

local composer = require("composer")
local cena = composer.newScene()

function cena:create(event)
	local grupoTutorial = self.view

	-- Coordenadas Telas
	local larguraTela = display.contentWidth
	local alturaTela = display.contentHeight

	local centroX = display.contentCenterX
	local centroY = display.contentCenterY

	local imagemLixeiras = display.newImageRect(grupoTutorial,"imagens/Lixeiras.png", 1200, 400 )
	imagemLixeiras.x = centroX
	imagemLixeiras.y = centroY
	imagemLixeiras.xScale = 2
	imagemLixeiras.yScale = 2

	local nome = display.newText(grupoTutorial, "Tutorial", centroX, centroY-300, native.systemFont, 200 )
	nome:setFillColor(0,1,0.3)

	local botaoJogar = display.newRoundedRect(grupoTutorial, centroX, centroY+100, 400, 150, 30)
	botaoJogar:setFillColor(0,1,0.3)

	local textoJogar = display.newText(grupoTutorial, "JOGAR", botaoJogar.x, botaoJogar.y, native.systemFont, 100)

	local botaoVoltar = display.newRoundedRect(grupoTutorial, centroX, centroY+300, 530, 150, 30)
	botaoVoltar:setFillColor(0,1,0.3)

	local textoVoltar = display.newText(grupoTutorial, "VOLTAR", botaoVoltar.x, botaoVoltar.y, native.systemFont, 100)

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