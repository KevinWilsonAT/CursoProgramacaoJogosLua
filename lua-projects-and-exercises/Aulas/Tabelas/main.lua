-- Criando uma tabela

char = {name = "heroi", level = 10, life = 100}

-- Acessando os dados do heroi

print("Nome:" .. char.name)
print("Nível:" .. char.level)
print("HP:" .. char.life)

-- Exemplo 2

game = {name = "meu jogo", char = {name = "heroi", level = 10, life = 100}}

print("Nome do jogo:" .. game.name)
print("Nome do personagem:" .. game.char.name)
print("Nível do personagem:" .. game.char.level)
print("HP do personagem:" .. game.char.life)

-- Acessando os dados usando colchetes

print("Nome do personagem:" .. game["char"]["name"])

-- Exemplo 3

char = {
	name = "Zelda",
	level = 5,
	life = 100
}

print("Nível do personagem:" .. char.level)
print("HP do personagem:" .. char.life)


-- Modificando elementos existentes

char.level = 6
char.life = 80

-- Adicionando elementos

char.armor = "Placa de Diamante"

print("Nome do personagem:" .. char.name)
print("Nível do personagem:" .. char.level)
print("HP do personagem:" .. char.life)
print("Armadura do personagem:" .. char.armor)


-- Exemplo 4

players = {}

players[1] = {name = "Juvanice", level = 5, life = 100}
players[2] = {name = "Geruza", level = 3, life = 115}

print("Jogador 1: " .. players[1].name)
print("Nivel: " .. players[1].name)
print("life: " .. players[1].life)

print("Jogador 2: " .. players[2].name)
print("Nivel: " .. players[2].name)
print("life: " .. players[2].life)

-- Exemplo 5

numbers = {10, 20, 30, 40, 50}

print(numbers[3])

table.remove(numbers, 3)

print(numbers[3])