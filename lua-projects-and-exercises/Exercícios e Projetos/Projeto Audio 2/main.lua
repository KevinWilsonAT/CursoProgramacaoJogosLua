--=======================
-- Recapitulando Audios
--=======================

local physics = require ("physics") -- Chama a biblioteca de Física
physics.start() -- Inicia a Física
physics.setGravity(0, 0) -- Define a gravidade
physics.setDrawMode("normal")

--====================================
-- Criando um plano de fundo infinito
--====================================

display.setDefault("textureWrapX", "mirroredRepeat")

--1º Criamos um retangulo de fundo
local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth*1.2, display.contentHeight*2)

--2º Aqui preenchemos o retangulo criado, usando uma imagem como "textura"
background.fill = {type = "image", filename = "imagens/bg.jpg"}

-- 3º Criamos a função para usarmos o transition

local function animateBackground()
	transition.to(background.fill, {time=18000, x=1, delta=true, onComplete=animateBackground})
end

-- 4º Chamamos a função
animateBackground()

--=======================================
-- Adicionar Objetos da Cena
--=======================================

local player = display.newImageRect("imagens/astro.png", 250, 300)
player.x = display.contentCenterX
player.y = display.contentCenterY
player.xScale = -1
player:rotate(15)
physics.addBody(player, "dynamic", {radius=100})

local dialogue = display.newText("Perdi a comunicação com a nave...", 1000, 250, native.systemFont, 50)
local dialogue1 = display.newText("Meu oxigênio está acabando...", 3000, 300, native.systemFont, 50)
local dialogue2 = display.newText("Preciso continuar...", 5000, 350, native.systemFont,50)
local dialogue3 = display.newText("Pela Annie...", 5000, 400, native.systemFont, 50)

transition.to(dialogue, {time=10000, x=-1000, iterations=1})
transition.to(dialogue1, {time=15000, x=-1000, iterations=1})
transition.to(dialogue2, {time=20000, x=-1000, iterations=1})
transition.to(dialogue3, {time=25000, x=-1000, iterations=1})

--===========================
-- Adicionar Audios
--===========================

local audioJet = audio.loadSound("audio/jetpack.wav")
local audioBg = audio.loadStream("audio/space1.wav")
local laser = audio.loadSound("audio/laser.wav")
local audioRadio = audio.loadSound("audio/badradio.mp3")

-- Reservar os canais 1, 2, 3, 4
audio.reserveChannels(4)

-- Define o volume dos canais
audio.setVolume(0.05, {channel=3})
audio.setVolume(0.1, {channel=2})
audio.setVolume(0.1, {channel=4})

-- Insere e dá play no audio, adicionando ao canal
audio.play(audioBg, {channel=3, loops=-1})
audio.play(audioRadio, {channel=2, loops=0})

--=======================
-- Adicionar a Fumacinha
--=======================

local function fumacinha()
	local fumacita = display.newCircle(player.x, player.y, 30)
	transition.to(fumacita, {time=500, alpha=0, onComplete = function()
	display.remove(fumacita)
	end})
	player:toFront()

end

Runtime:addEventListener("enterFrame", fumacinha)

--==================
-- Mover o Player
--==================

local function moverPlayer(event)
	local player = event.target
	local phase = event.phase

	-- Quando a fase de toque for igual a began então
	if (phase == "began") then
		-- Todas as mudanças de direção enquanto o mouse estiver apertado
		-- serão focadas no player
		display.currentStage:setFocus(player)

		--Salva a posição inicial do player
		player.touchOffesetX = event.x - player.x
		player.touchOffesetY = event.y - player.y
		audio.play(audioJet, {channel=1, loops=-1})

	elseif (phase == "moved") then
		-- Move o player na vertical e na horizontal
		player.x = event.x - player.touchOffesetX
		player.y = event.y - player.touchOffesetY
		audio.resume(1)

	elseif (phase == "ended" or phase == "cancelled") then
		-- Retira o foco de toque do player
		display.currentStage:setFocus(nil)
		audio.pause(1)
	end
end

player:addEventListener("touch", moverPlayer)

--=====================
-- Atirar
--====================

local botaoShape = display.newRoundedRect(display.contentCenterX, display.contentCenterY+450, 180, 120, 30)
botaoShape:setFillColor(0,1,0)

local botaoTiro = display.newRoundedRect(display.contentCenterX, display.contentCenterY+450, 150, 90, 30)
botaoTiro:setFillColor(1,0,0)

-- Adicionar a função de atirar
local function atirar()
	audio.play(laser, {channel=4})

	--Criar o tiro
	local tiro = display.newRect(player.x, player.y, 35, 10)
	tiro:setFillColor(1,0,0)
	physics.addBody(tiro, "dynamic", {radius=4, isSensor=true})
	tiro.isBullet = true

	-- Define a movimentação do tiro no jogo
	transition.to(tiro, {x=1500, time=500, 

	-- Ao completar a transição, o objeto tiro é removido
	onComplete = function()
	display.remove(tiro)
	end})
end

player:addEventListener("tap", atirar)

