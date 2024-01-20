-- desativa barra de notificacao
display.setStatusBar(display.HiddenStatusBar)

-- altera cor background da tela
display.setDefault("background", 0.2, 0.2, 0.2)

-- config tela

local dispWidth = 320
local dispHeight = 480

local centerX = display.contentCenterX
local centerY = display.contentCenterY

-- criar chao

local floor = display.newRect(centerX, dispHeight+50, dispWidth, 110)
floor:setFillColor(0, 1, 0)

-- criar personagem
local player = display.newImageRect("man.png", 300, 300)
player.x = centerX
player.y = dispHeight-50

-- criar gotas de chuva
local function createRainDrop()
	local drop = display.newRect(
		math.random(0, dispWidth), -- posicao x aleatoria
		-100, -- posicao y fora da tela na parte superior
		5, -- largura gota
		20) -- comprimento gota
	drop:setFillColor(0,0,1)
	drop.alpha = 0.7

	local transitionTime = math.random(1500, 3000)
	transition.to(drop, {
		y = dispHeight + 10,
		time = transitionTime,
		onComplete = function(obj)
			display.remove(obj)
		end
	})
end

local function createRain()
	createRainDrop()
	timer.performWithDelay(300, createRain)
end

createRain()