-- Loop for simples e sem incremento

for i = 1, 5 do
	print(i)
end

-- Loop for com incremento personalizado

for i = 1, 10, 2 do
	print(i)
end

-- Exemplo 1

local coinCount = 0

for i = 1, 3 do
	coinCount = coinCount + 1
	print("Moeda coletada. Total de moedas: " .. coinCount)
end

-- Exemplo 2

local life = 7

for i = 1, life do
	print("Vidas restantes: " .. i)
end

-- Exemplo 3

for i = 1, 5 do
	print("Ataque número " .. i)
end