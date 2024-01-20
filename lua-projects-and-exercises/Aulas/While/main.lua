-- Exemplo while

-- 1) Contador de 1 a 5

local counter = 1

while counter <= 20 do
	print(counter)
	counter = counter + 2
end

-- 2) Simulando contagem regressiva de 3 a 1

local counter = 3

while counter >= 1 do
	print("Contagem Regressiva: " .. counter)
	counter = counter - 1
end

-- 3) Verificar se vida do jogador é maior que 0

local lifePlayer = 10

while lifePlayer > 0 do
	print("Jogador ainda está com " .. lifePlayer .. " pontos de vida")
	lifePlayer = lifePlayer - 1
end

-- 4) Esperando um inimigo se aproximar a uma distancia de 5 unidades

local distanceEnemy = 5
local curDistance = 10

while curDistance > distanceEnemy do
	print("Aguardando inimigo se aproximar...")
	curDistance = curDistance - 1
end

-- 5) contador de pontos

local points = 0
local time = 0

while time < 60 do
	points = points + 1
	time = time + 1
	print("Pontos: " .. points)
end

print("Fim de jogo! Pontuação: " .. points)

-- 6) contagem regressiva em um jogo

local remainTime = 3

print("Prepare-se para a corrida")

while remainTime > 0 do
	print("Começando em... " .. remainTime .. " segundos.")
	remainTime = remainTime - 1
end

print("Começou a corrida!")

-- 7) coletando moedas até atingir um objetivo

local coinCount = 0
local goal = 10

while coinCount < goal do
	print("Moedas coletadas: " .. coinCount)
	coinCount = coinCount + 1
end

print("Parabéns! Você aingiu o objetivo de " .. coinCount .. " moedas")