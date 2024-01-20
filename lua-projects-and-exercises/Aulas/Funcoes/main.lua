-- Exemplos de funções

-- 1) Mensagem de boas vindas

function welcome(name)
	return "Olá, " .. name .. "!"
end

local message = welcome("Xurastei")
print(message)

-- 2) Fazer personagem mover para a direita 

local charX = 100

function moveRight()
	charX = charX + 10
end

moveRight()

print("Nova posição do personagem em x: " .. charX)

-- 3) Fazer reproduzir som do jogo 

function playSound(nameSound)
	print("Reproduzindo som: " .. nameSound)
end

playSound("explosao.wav")

-- 4) Fazer personagem mover para a direita e para baixo

local charX = 100
local charY = 100

function moveLeftDown(dx, dy)
	charX = charX + dx
	charY = charY - dy
end

moveLeftDown(10, 20)

print("Nova posição do personagem em x e y é: x" .. charX .. ", y" .. charY)

-- 5) Verificar se jogador venceu o jogo

local playerWin = false

function verifyVictory()

	if playerWin then
		print("Parabens! Você venceu")
	else
		print("Continue jogando...")
	end
end

verifyVictory()

-- 6) Calcular pontuação jogador

local score = 0

function raisePoints(points)
	score = score + points
end

raisePoints(10)

print("Pontuação atual: " .. score)

-- 7) Verificar se jogador tem nivel suficiente

local curLevel = 3
local goalLevel = 5

function verificarNivel(curLevel, goalLevel)
	if curLevel >= goalLevel then
		print("Você Passou de fase")
	else
		print("Tente novamente no próximo nível")
	end
end

verificarNivel(curLevel, goalLevel)

-- 7) Verificar se jogador adivinha numero

function guessNumber(guessedNum)
	local corNum = 42
	if guessedNum == corNum then
		print("Parabens! Advinhou o numero correto")
	elseif guessedNum < corNum then
		print("Tente de novo. Dica: o numero correto é maior")
	else
		print("Tente de novo. Dica: o numero correto é menor")
	end
end

guessNumber(42)
guessNumber(30)
guessNumber(50)

-- 8) somatoria usando o return

function sum(a, b)
	local result = a + b
	return result
end

local resultSum = sum(5, 3)

print("A soma é: " .. resultSum)