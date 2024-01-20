--==================================
-- EXEMPLOS DE DISPLAY RECAPITULAÇÃO
--==================================

-- Exemplo 1 - Definir a cor de fundo

--Sintaxe    ("nomedapropriedade", valor RGB da cor)
display.setDefault("background", 0.2, 0.4, 0.6)

-- EXEMPLO 2 - DESLIGA A BARRA DE NOTIFICAÇÃO
display.setStatusBar(display.HiddenStatusBar)


-- EXEMPLO 3 - Verificamos o tamanho da tela

local alturaTela = display.contentHeight
local larguraTela = display.contentWidth

print("A altura da tela é: " .. alturaTela)
print("A largura da tela é: " .. larguraTela)


-- Exemplo 4 - Definindo e verificando o centro da tela em X e Y

local centroX = display.contentCenterX
local centroY = display.contentCenterY

print("O centro X da tela é: " .. centroX)
print("O centro Y da tela é: " .. centroY)


-- Exemplo 5 - Criando um objeto com o tamanho da tela

local bg = display.newRect(centroX, centroY, larguraTela, alturaTela)
bg:setFillColor(0.3, 0.7, 0.6)


-- Exemplo 6 -- Ordem de objetos sobrepostos

local circulo = display.newCircle(centroX, 420, 50)
circulo:setFillColor(1,0,0)
circulo.strokeWidth = 3
circulo:setStrokeColor(0,0,0)

local retangulo = display.newRect(centroX, 420, 90, 50)
retangulo:setFillColor(0,0,1)
retangulo.strokeWidth = 3
retangulo:setStrokeColor(0,0,0)

local quadrado = display.newRect(centroX, 420, 80, 80)
quadrado:setFillColor(0,1,0)
quadrado.strokeWidth = 3
quadrado:setStrokeColor(0,0,0)

circulo:toFront()
circulo:toBack()

-- Exemplo 7 - Ancoragem

local circuloZero = display.newCircle(0, 0, 10)
local circuloMeio = display.newCircle(centroX, centroY, 10)
local circuloBaixo = display.newCircle(320, 480, 10)

local astronauta = display.newImageRect("astronauta.png", 150, 150)

-- Posição X e Y do astronauta
print("Posição X do astronauta: " .. astronauta.x)
print("Posição Y do astronauta: " .. astronauta.y)

-- Posição X e Y da ancora da imagem do astronauta
print("Posição AnchorX da imagem do astronauta: " .. astronauta.anchorX)
print("Posição AnchorY da imagem do astronauta: " .. astronauta.anchorY)

astronauta.x = 0
astronauta.y = 0
astronauta.anchorX = 0
astronauta.anchorY = 0
astronauta.rotation = 0

print("Posição AnchorX da imagem do astronauta: " .. astronauta.anchorX)
print("Posição AnchorY da imagem do astronauta: " .. astronauta.anchorY)


-- Exemplo 8 - Criando linhas para conhecer letterbox

-- Sintaxe (xInicio, yInicio, xFinal, yFinal)
local linhaCima = display.newLine(0, 0, 320, 0)
linhaCima.strokeWidth = 3
linhaCima:setStrokeColor(1,0,0)

local linhaEsquerda1 = display.newLine(0,0,0,480)
linhaEsquerda1.strokeWidth = 3
linhaEsquerda1:setStrokeColor(1,0,0)

local linhaBaixo = display.newLine(0, 480, 320, 480)
linhaBaixo.strokeWidth = 3
linhaBaixo:setStrokeColor(1,0,0)

local linhaDireita1 = display.newLine(320, 0, 320, 480)
linhaDireita1.strokeWidth = 3
linhaDireita1:setStrokeColor(1,0,0)


-- Exemplo 8 - Criando Linhas ZoomEven

local linhaSuperior = display.newLine(60, 20, 260, 20)
linhaSuperior.strokeWidth = 3
linhaSuperior:setStrokeColor(0,1,0)

local linhaEsquerda2 = display.newLine(60, 20, 60, 450)
linhaEsquerda2.strokeWidth = 3
linhaEsquerda2:setStrokeColor(0,1,0)

local linhaDireita2 = display.newLine(260, 20, 260, 450)
linhaDireita2.strokeWidth = 3
linhaDireita2:setStrokeColor(0,1,0)

local linhaInferior = display.newLine(60, 450, 260, 450)
linhaInferior.strokeWidth = 3
linhaInferior:setStrokeColor(0,1,0)



