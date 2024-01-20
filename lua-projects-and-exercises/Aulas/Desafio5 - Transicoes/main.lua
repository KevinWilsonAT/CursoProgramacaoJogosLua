display.setStatusBar(display.HiddenStatusBar)

local cX = display.contentCenterX
local cY = display.contentCenterY

local functionGroup = display.newGroup()

local colorFlag = display.newRect(cX-2, cY-265, 225, 65) -- Bandeira
colorFlag:setFillColor(0.2, 0.2, 0.2)

local title = display.newText("DESAFIO 5", cX, cY-265, native.systemFont, 30, center) -- Texto
title:setFillColor(0, 0, 0)

local colorArm = display.newRect(cX-105, cY-214, 20, 37) -- Braço
colorArm:setFillColor(0.2, 0.2, 0.2)

local colorHand = display.newRoundedRect(cX-105, cY-184, 29, 25, 8) -- Mão
colorHand:setFillColor(0.2, 0.2, 0.2)

local colorFinger = display.newRoundedRect(cX-99, cY-162, 8, 25, 8) -- Dedo
colorFinger:setFillColor(0.2, 0.2, 0.2)

local circleRed = display.newCircle(cX-100, cY-100, 50) -- Circulo Vermelho
circleRed:setFillColor(1, 0, 0)

local circleDarkGreen = display.newCircle(cX+100, cY-100, 50) -- Circulo Verde Escuro
circleDarkGreen:setFillColor(0, 0.5, 0)

local circleBlue = display.newCircle(cX+100, cY+100, 50) -- Circulo Azul
circleBlue:setFillColor(0, 0, 1)

local circleYellow = display.newCircle(cX-100, cY+100, 50) -- Circulo Amarelo
circleYellow:setFillColor(1, 1, 0)

-- Ciclo do conjunto bandeira e braço

function flagCycle()
	transition.to(title, {title:setFillColor(1, 1, 1), time=750})
	transition.to(colorFlag, {colorFlag:setFillColor(1, 0, 0), time=750})
	transition.to(colorArm, {colorArm:setFillColor(1, 0, 0), time=750})
	transition.to(colorHand, {colorHand:setFillColor(1, 0, 0), time=750})
	transition.to(colorFinger, {colorFinger:setFillColor(1, 0, 0), time=750,
	onComplete =function()
		transition.to(colorFlag, {colorFlag:setFillColor(1, 1, 0), time=750})
		transition.to(colorArm, {colorArm:setFillColor(1, 1, 0), time=750})
		transition.to(colorHand, {colorHand:setFillColor(1, 1, 0), time=750})
		transition.to(colorFinger, {colorFinger:setFillColor(1, 1, 0), time=750,
		onComplete = function()
			transition.to(colorFlag, {colorFlag:setFillColor(0, 0, 1), time=750})
			transition.to(colorArm, {colorArm:setFillColor(0, 0, 1), time=750})
			transition.to(colorHand, {colorHand:setFillColor(0, 0, 1), time=750})
			transition.to(colorFinger, {colorFinger:setFillColor(0, 0, 1), time=750,
			onComplete = function()
				transition.to(colorFlag, {colorFlag:setFillColor(0, 0.5, 0), time=750})
				transition.to(colorArm, {colorArm:setFillColor(0, 0.5, 0), time=750})
				transition.to(colorHand, {colorHand:setFillColor(0, 0.5, 0), time=750})
				transition.to(colorFinger, {colorFinger:setFillColor(0, 0.5, 0), time=750})
			end})
		end})
	end})
end

-- Ciclo do Circulo Vermelho
function circleRedCycle()
	transition.to(circleRed, {x = cX+100, time = 750,
	onComplete =function()
		transition.to(circleRed, {y = cY+100, time = 750,
		onComplete = function()
			transition.to(circleRed, {x = cX-100, time=750,
			onComplete = function()
				transition.to(circleRed, {y = cY-100, time=750})
			end})
		end})
	end})
end

-- Ciclo do Circulo Verde Escuro
function circleDarkGreenCycle()
	transition.to(circleDarkGreen, {y = cY+100, time = 750,
	onComplete =function()
		transition.to(circleDarkGreen, {x = cX-100, time = 750,
		onComplete = function()
			transition.to(circleDarkGreen, {y = cY-100, time=750,
			onComplete = function()
				transition.to(circleDarkGreen, {x = cX+100, time=750})
			end})
		end})
	end})
end

-- Ciclo do Circulo Azul
function circleBlueCycle()
	transition.to(circleBlue, {x = cX-100, time = 750,
	onComplete =function()
		transition.to(circleBlue, {y = cY-100, time = 750,
		onComplete = function()
			transition.to(circleBlue, {x = cX+100, time=750,
			onComplete = function()
				transition.to(circleBlue, {y = cY+100, time=750})
			end})
		end})
	end})
end

-- Ciclo do Circulo Amarelo
function circleYellowCycle()
	transition.to(circleYellow, {y = cY-100, time = 750,
	onComplete =function()
		transition.to(circleYellow, {x = cX+100, time = 750,
		onComplete = function()
			transition.to(circleYellow, {y = cY+100, time=750,
			onComplete = function()
				transition.to(circleYellow, {x = cX-100, time=750})
			end})
		end})
	end})
end

-- Função para chamar todos os ciclos dos Circulos ao mesmo tempo
function cycles()
	flagCycle()
	circleRedCycle()
	circleDarkGreenCycle()
	circleBlueCycle()
	circleYellowCycle()
end

-- Repetir a animação inifinitamente
timer.performWithDelay(3000, cycles, 0)