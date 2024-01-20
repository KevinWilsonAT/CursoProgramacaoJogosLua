-- Exercicio 1

local number1 = 10
local number2 = 5

local result = number1 + number2

print("A soma de", number1, "e", number2, "é:", result)

-- Exercicio 2

-- declarando variavel preco

local prodPrice = 50

-- declarando variavel com desconto de 10%

local discount = 0.10

local priceWithDiscount = prodPrice * (1 - discount)

-- exibindo o preco do produto com desconto

print("O preço do produto com 10% de desconto é:", priceWithDiscount,"reais")

-- Exercicio 1

-- declarando e atribuindo a idade atual

local age = 25

-- calculando a idade daqui a 10 anos

local futureAge = age + 10

-- exibindo a idade daqui a 10 anos

print("Sua idade daqui a 10 anos será ", futureAge, "anos")

-- Exercicio 4

-- declarando e atribuindo valores às variáveis

local studentsNumbers = 30
local teachersNumbers = 5

-- calculando o total de pessoas na escola

local totalPeople = studentsNumbers + teachersNumbers

print("O número total de pessoas na escola são de ", totalPeople, "pessoas")

-- Exercicio 5

-- declarando e atribuindo a distncia em metros

local metersDistance = 2500

-- convertendo a distancia para quilometros
local kilometersDistance = metersDistance / 1000

print("A distância entre as cidades é de ", kilometersDistance, "quilômetros")

-- Exercicio 6

-- variável global

greeting = "Olá"

-- função que utiliza uma variável global

function customGreeting()
	local name = "Carlos"
	local message = greeting .. ", " .. name

	print(message)
end

-- chamada de função

customGreeting()

-- Exercicio 7

-- declaracao de variaveis

local number = 42
local text = "Olá, Lua"
local boolean = true

print("Número: ", number)
print("Texto: ", text)
print("Booleano", boolean)

-- uso da função para verificar o tipo de dado

print("Tipo de Número:", type(number))
print("Tipo de Texto:", type(text))
print("Tipo de Booleano:", type(boolean))