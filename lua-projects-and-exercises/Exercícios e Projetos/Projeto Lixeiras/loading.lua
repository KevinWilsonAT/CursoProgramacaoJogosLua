--================
--LOADING.LUA
--================

local composer = require("composer")
local cena = composer.newScene()

function cena:create(event)

	local grupoLoading = self.view

	-- Coordenada Tela
	local larguraTela = display.contentWidth
	local alturaTela = display.contentHeight

	local centroX = display.contentCenterX
	local centroY = display.contentCenterY

	local logoLoading = display.newImageRect(grupoLoading, "imagens/loading.jpg", 800, 600)
	logoLoading.x = centroX
	logoLoading.y = centroY

	function proximaCena()
		composer.gotoScene("menu", {time=1000, effect = "fade"})
	end

	timer.performWithDelay(3000, proximaCena)


end

cena:addEventListener("create", cena)
return cena