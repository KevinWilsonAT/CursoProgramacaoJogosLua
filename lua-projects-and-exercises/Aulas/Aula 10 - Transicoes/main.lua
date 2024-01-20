-- desativar barra notificação

display.setStatusBar(display.HiddenStatusBar)

display.setDefault("background", 0.2, 0.2, 0.2)

local dispWidth = display.contentWidth
local dispHeight = display.contentHeight

local centerX = display.contentCenterX
local centerY = display.contentCenterY

-- exemplo transition dissolve

local bg1 = display.newRect(centerX, centerY, dispWidth, dispHeight)
bg1:setFillColor(1, 0.7, 0.5)

local bg2 = display.newRect(centerX, centerY, dispWidth, dispHeight)
bg2:setFillColor(0.5, 0.7, 0.5)	

transition.dissolve(bg1, bg2, 2000)

-- trasition.to movendo objeto e alterando propriedades

local rectangle = display.newRect(100, 100, 80, 50)

-- parametros da animação
local parameters = {
	time = 2000,
	x = 50,
	y = 380,
	rotation = 90,
	xScale = 2,
	yScale = 2,
	alpha = 0.5
}

transition.to(rectangle, parameters)

local circBlue = display.newCircle(100, 100, 32)
circBlue:setFillColor(0,0,1)

transition.to(circBlue, {x = 250, time = 750})

local circGreen = display.newCircle(250, 100, 24)
circGreen:setFillColor(0,1,0)

transition.to(circGreen, {delay = 750, y = 250})
transition.blink(circGreen)

local circYellow = display.newCircle(250, 250, 20)
circYellow:setFillColor(1,1,0)

transition.to(circYellow, {delay = 1250, y = 50})


local circPink = display.newCircle(40, centerY, 20)
circPink:setFillColor(1,0,1)

transition.to(circPink, {delay = 1750, y = 900})

local sqWhite = display.newRect(100, 100, 50, 70)

transition.to(sqWhite, {x = 200, y = 350, rotation = 360, time = 1000})

local rectangle1 = display.newRect(centerX, 0, 200, 40)
rectangle1:setFillColor(0,0,0)

local rectangle2 = display.newRect(centerX, 0, 200, 40)
rectangle2:setFillColor(1,1,0)

transition.dissolve(rectangle1, rectangle2, 2000)

local name = display.newText("Perigo!", centerX, 0, native.systemFont, 30)
name:setFillColor(1,0,0)

transition.blink(name)

--transition.pause()
--transition.resume()

--transition.cancel()

-- exemplo função onComplete
local squareX = display.newRect(0, 500, 100, 100)

-- cria transição com parâmetros
transition.to(squareX, {
	x = dispWidth - 50,
	timer = 2000,
	onComplete = function()
		print("Transição Completa: Objeto chegou no fim da tela")
	end
})

-- exemplo de timer

local function timerEnd()
	print("Timer Acabou")
end

timer.performWithDelay(2000, timerEnd, 5)

-- exemplo de math.random

--sem argumento
local decimalNum = math.random()
	print(decimalNum)

--sem argumento
local integerNum = math.random(1, 10)
	print(integerNum)

timer.performWithDelay(2000, timerEnd, 5)

-- cria um quadrado vermelho para ser o inimigo

local enemy = display.newRect(centerX, centerY, 50, 50)
enemy:setFillColor(1,0,0)

-- mover aleatoriamente pela tela

function moveEnemy()
	transition.to(enemy, {
		time = math.random(500, 2000),
		x = math.random(0, dispWidth),
		y = math.random(0, dispHeight)
	})
end

-- timer para fazer inimigo se mover infinitamente

timer.performWithDelay(1000, moveEnemy, 0)

function deleteEnemy()
	-- diminuir opacidade do inimigo
	transition.to(enemy, {time = 200, alpha = 0})

	-- aparece um texto ao clicar em cima do inimigo
	local text = display.newText("Acertou ele!", centerX, centerY, native.systemFont, 20)
	text:setFillColor(0,1,0)

	-- fazer ele aparecer de novo

	function restart()
		transition.to(enemy, {time = 500, alpha = 1})
		display.remove(text)
	end

	timer.performWithDelay(2000, restart, 0)
end

enemy:addEventListener("tap", deleteEnemy)