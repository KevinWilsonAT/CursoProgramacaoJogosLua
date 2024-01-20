--====================
-- GAME.LUA
--====================

local composer = require("composer")
local cena = composer.newScene( )

function cena:create( event )
	local grupoGame = self.view

	-- Coordenadas Tela

	local larguraTela = display.contentWidth
	local alturaTela = display.contentHeight
	local centroX = display.contentCenterX
	local centroY = display.contentCenterY

	local physics = require("physics")
	physics.start( )
	physics.setGravity( 0, 0 )
	physics.setDrawMode( "hybrid" )

	local click = audio.loadSound( "audio/efeito-click.mp3" )
	local erro = audio.loadSound( "audio/erro.mp3" )
	local audioRua = audio.loadStream("audio/somCidade.wav")
	--audio.play(audioRua)

	local fundoGame = display.newImageRect( grupoGame, "imagens/fundo-jogo.jpg", larguraTela, alturaTela )
	fundoGame.x = centroX
	fundoGame.y = centroY

	local pontos = 0
	local textoPontos = display.newText(grupoGame, pontos, centroX, 100, native.systemFont, 120)

	local lixeiraAmarela = display.newImageRect(grupoGame, "imagens/lixo-amarelo.png", 200, 400)
	lixeiraAmarela.x = centroX-450
	lixeiraAmarela.y = centroY+150

	physics.addBody(lixeiraAmarela, "static")
	lixeiraAmarela.myName = "lixeira amarela"

	local lixeiraVermelha = display.newImageRect(grupoGame, "imagens/lixo-vermelho.png", 200, 400 )
	lixeiraVermelha.x = centroX-150
	lixeiraVermelha.y = centroY+150

	physics.addBody(lixeiraVermelha, "static")
	lixeiraVermelha.myName = "lixeira vermelha"

	local lixeiraAzul = display.newImageRect(grupoGame, "imagens/lixo-azul.png", 200, 400)
	lixeiraAzul.x = centroX+150
	lixeiraAzul.y = centroY+150

	physics.addBody(lixeiraAzul, "static")
	lixeiraAzul.myName = "lixeira azul"

	local lixeiraVerde = display.newImageRect(grupoGame, "imagens/lixo-verde.png", 200, 400)
	lixeiraVerde.x = centroX+450
	lixeiraVerde.y = centroY+150

	physics.addBody(lixeiraVerde, "static")
	lixeiraVerde.myName = "lixeira verde"

	local metal = display.newImageRect(grupoGame, "imagens/lata.png", 150, 250)
	metal.x = centroX+900
	metal.y = centroY

	physics.addBody(metal, "dynamic")
	metal.myName = "lixo amarelo"
	metal.isSensor = true

	local vidro = display.newImageRect(grupoGame, "imagens/vidro.png", 250, 300)
	vidro.x = centroX-900
	vidro.y = centroY

	physics.addBody(vidro, "dynamic")
	vidro.myName = "lixo verde"
	vidro.isSensor = true

	local papel = display.newImageRect(grupoGame, "imagens/papel.png", 300, 170)
	papel.x = centroX+500
	papel.y = centroY-300

	physics.addBody(papel, "dynamic")
	papel.myName = "lixo azul"
	papel.isSensor = true

	local plastico = display.newImageRect(grupoGame, "imagens/plastico.png", 150, 220 )
	plastico.x = centroX-500
	plastico.y = centroY-300

	physics.addBody(plastico, "dynamic")
	plastico.myName = "lixo vermelho"
	plastico.isSensor = true

	function moverLixo(event)
		local lixo = event.target

		if (event.phase == "began") then
			display.currentStage:setFocus(lixo)
			lixo.touchOffsetX = event.x - lixo.x
			lixo.touchOffsetY = event.y - lixo.y

		elseif (event.phase == "moved") then
			lixo.x = event.x - lixo.touchOffsetX
			lixo.y = event.y - lixo.touchOffsetY

		elseif (event.phase == "ended" or event.phase == "cancelled") then
			display.currentStage:setFocus(nil)
		end
	end

	metal:addEventListener("touch", moverLixo)
	vidro:addEventListener("touch", moverLixo)
	papel:addEventListener("touch", moverLixo)
	plastico:addEventListener("touch", moverLixo)


	function limparTela()
		-- Remover os objetos da tela
		display.remove(lixeiraAmarela)
		display.remove(lixeiraVermelha)
		display.remove(lixeiraAzul)
		display.remove(lixeiraVerde)

		display.remove(metal)
		display.remove(vidro)
		display.remove(papel)
		display.remove(plastico)

		-- Remover event listener do Runtime
		Runtime:removeEventListener("collision", colisao)

		--Remover Audio
		audio.stop()

	end

	function gameOver()
		composer.removeScene("game") -- Remove a cena atual
		composer.gotoScene("gameover", {effect="fade", time=500}) -- Vai para a cena do gameover
	end

	function fimDeJogo()
		composer.removeScene("game")
		composer.gotoScene("fim", {effect="fade", time=500})
	end




	function colisao(event)
		if (event.phase == "began") then

			local obj1 = event.object1
			local obj2 = event.object2

			--Verificar a colisão entre lixos e lixeiras corretos para ganhar pontos
			if (obj1.myName == "lixo verde" and obj2.myName == "lixeira verde") or (obj1.myName == "lixeira verde" and obj2.myName == "lixo verde") or
				(obj1.myName == "lixo azul" and obj2.myName == "lixeira azul") or (obj1.myName == "lixeira azul" and obj2.myName == "lixo azul") or
				(obj1.myName == "lixo vermelho" and obj2.myName == "lixeira vermelha") or (obj1.myName == "lixeira vermelha" and obj2.myName == "lixo vermelho") or
				(obj1.myName == "lixo amarelo" and obj2.myName == "lixeira amarela") or (obj1.myName == "lixeira amarela" and obj2.myName == "lixo amarelo") then
				
				if obj1.myName == "lixo verde" or obj1.myName == "lixo azul" or obj1.myName == "lixo vermelho" or obj1.myName == "lixo amarelo" then
					display.remove(obj1)
				end

				if obj2.myName == "lixo verde" or obj2.myName == "lixo azul" or obj2.myName == "lixo vermelho" or obj2.myName == "lixo amarelo" then
					display.remove(obj2)
				end

				pontos = pontos + 50
				textoPontos.text = pontos
				audio.play(click)

				-- Verificar a colisão entre os lixos e as lixeiras incorretas e perder pontos
			elseif  (obj1.myName == "lixo verde" and (obj2.myName == "lixeira azul" or obj2.myName == "lixeira vermelha" or obj2.myName == "lixeira amarela")) or
					(obj1.myName == "lixo azul" and (obj2.myName == "lixeira verde" or obj2.myName == "lixeira vermelha" or obj2.myName == "lixeira amarela")) or
					(obj1.myName == "lixo vermelho" and (obj2.myName == "lixeira verde" or obj2.myName == "lixeira azul" or obj2.myName == "lixeira amarela" )) or
					(obj1.myName == "lixo amarelo" and (obj2.myName == "lixeira verde" or obj2.myName == "lixeira azul" or obj2.myName == "lixeira vermelha")) or

					(obj2.myName == "lixo verde" and (obj1.myName == "lixeira azul" or obj1.myName == "lixeira vermelha" or obj1.myName == "lixeira amarela")) or
					(obj2.myName == "lixo azul" and (obj1.myName == "lixeira verde" or obj1.myName == "lixeira vermelha" or obj1.myName == "lixeira amarela")) or
					(obj2.myName == "lixo vermelho" and (obj1.myName == "lixeira verde" or obj1.myName == "lixeira azul" or obj1.myName == "lixeira amarela")) or
					(obj2.myName == "lixo amarelo" and (obj1.myName == "lixeira verde" or obj1.myName == "lixeira azul" or obj1.myName == "lixeira vermelha")) then

				if obj1.myName == "lixo verde" or obj1.myName == "lixo azul" or obj1.myName == "lixo vermelho" or obj1.myName == "lixo amarelo" then
					display.remove(obj1)
				end

				if obj2.myName == "lixo verde" or obj2.myName == "lixo azul" or obj2.myName == "lixo vermelho" or obj2.myName == "lixo amarelo" then
					display.remove(obj2)
				end

				pontos = pontos - 10
				if pontos < 0 then
					pontos = 0
					gameOver()
					limparTela()
				end
				textoPontos.text = pontos
				audio.play(erro)
			end

			if pontos >= 200 then
				limparTela()
				fimDeJogo()
			end
		end
	end

	Runtime:addEventListener("collision", colisao)


end

cena:addEventListener("create", cena)
return cena