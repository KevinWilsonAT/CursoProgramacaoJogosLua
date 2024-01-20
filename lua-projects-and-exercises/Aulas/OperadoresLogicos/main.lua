-- Operador Logico AND

-- Exemplo 1

hasGoldKey = true
hasSilverKey = true

if hasGoldKey and hasSilverKey then
	print("Você pode abrir o baú misterioso")
else
	print("Você não pode abrir o baú misterioso")
end

-- Exemplo 2

isStopped = true
hasAmmo = true

if isStopped and hasAmmo then
	print("Você pode recarregar a arma")
else
	print("Você não pode recarregar a arma nesse momento")
end

-- Operador Logico OR

-- Exemplo 3

hasTrampoline = false
hasJetpack = false

if hasTrampoline or hasJetpack then
	print("Você pode pular para a próxima plataforma")
else
	print("Você não pode pular para a próxima plataforma")
end

-- Exemplo 4

hasEnoughOxygen = true
hasSpaceSuit = false

if hasEnoughOxygen and hasSpaceSuit then
	print("Você pode sair da nave espacial")
else
	print("Você não pode sair da nave nesse momento")
end

-- Operador Logico NOT

-- Exemplo 5

isAttacked = false

if not isAttacked then
	print("Você pode ativar o escudo de proteção")
else
	print("Você está sendo atacado e não pode ativar o escudo agora")
end

-- Exemplo 5

isHungry = true

if not isHungry then
	print("Você pode dormir para descansar")
else
	print("Você está com fome e não pode dormir agora")
end