-- Estruturas condicionais

-- 1) Verificar se o jogador tem uma chave para continuar

hasKey = true

if hasKey then
	print("Você pode abrir a porta")

else
	print("Você precisa encontrar a chave primeiro")

end

-- 2) Verificar a saúde do jogador

lifePlayer = 75

if lifePlayer > 50 then
	print("O jogador está em boa saúde")
elseif lifePlayer > 25 then
	print("O jogador está em saúde moderada")
else
	print("O jogador está em perigo")
end

-- 3) Identificando o tipo de inimigo

typeEnemy = "zumbi"

if typeEnemy == "zumbi" then
	print("Você está enfrentando um zumbi. Ataque-o")
elseif type == "esqueleto" then
	print("Você está enfrentando um esqueleto. Ataque-o")
else
	print("Encontro inesperado! Este inimigo parece perigoso")
end

-- 4) Identificando a classe do jogador

playerClass = "mago"

if playerClass == "guerreiro" then
	print("Você é um guerreiro forte")
elseif type == "mago" then
	print("Você é um mago poderoso")
elseif type == "ladino" then
	print("Você é um ladino sorrateiro")
else
	print("Classe desconhecida. Escolha uma classe válida")
end