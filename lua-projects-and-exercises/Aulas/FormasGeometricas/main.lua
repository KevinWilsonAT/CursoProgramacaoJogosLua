-- Incluindo objetos

-- Desativar a barra de notificacao da tela de celular

display.setStatusBar(display.HiddenStatusBar)

-- Exemplo display.contentWidth e display.contentHeight
 
local dispHeight = display.contentHeight
local dispWidth = display.contentWidth

print("Altura da Tela: " .. dispHeight)
print("Largura da Tela: " .. dispWidth)

-- Exemplo display.contentCenterX e display.contentCenterY

local centerX = display.contentCenterX
local centerY = display.contentCenterY

print("Centro X: " .. centerX)
print("Centro Y: " .. centerY)

-- Criar retangulo
-- comandos:      display.newRect(localiz_x,    localiz_y, larg, alt)
local rectangle = display.newRect(centerX-650, centerY-250, 170, 140)

-- comandos:           R, G, B)
rectangle:setFillColor(1, 0, 0)

-- Criar circulo
-- comandos:    display.newCircle(localiz_x,   localiz_y, raio)
local circle = display.newCircle(centerX-450, centerY-250, 80)

-- comandos:         R, G, B)
circle:setFillColor(0, 1, 0)

-- Criar quadrado
-- comandos:     display.newRect(localiz_x,   localiz_y,  larg, alt)
local square = display.newRect(centerX-250, centerY-250, 150, 150)

-- comandos:          R, G, B)
square:setFillColor(0, 0, 1)

square.rotation = 45

-- Criar retangulo arrendondado
-- comandos:     display.newRoundedRect(localiz_x,   localiz_y,  larg, alt, cornerRadius)
local rectRound = display.newRoundedRect(centerX-50, centerY-250, 170, 140, 40)

-- comandos:          R, G, B)
rectRound:setFillColor(1, 0, 1)

-- Criar retangulo arrendondado
-- comandos:      display.newRoundedRect(localiz_x,   localiz_y,  larg, alt, cornerRadius)
local sqRound = display.newRoundedRect(centerX+150, centerY-250, 150, 150, 20)

-- comandos:           R, G, B)
sqRound:setFillColor(1, 1, 0)

-- Criar novo texto
-- comandos:  display.newText("mensagem",     l_x, l_y, fonte,            tam, alinham)
local text = display.newText("Hello World!", 500, 500, native.systemFont, 50, center)


-- Inserir imagem
-- comandos:  display.newImageRect("imagem.jpg", l_x, l_y)
local image = display.newImageRect("image.jpg", 250, 250)

image.x = centerX-300
image.y = centerY

local text1 = display.newText("Texto 1", centerX-100, centerY, native.systemFont, 24)
local text2 = display.newText("Texto 2", centerX, centerY, native.systemFont, 24)
local text3 = display.newText("Texto 3", centerX+100, centerY, native.systemFont, 24)

local rectangle1 = display.newRect(centerX-100, centerY+50, 80, 60)
rectangle1:setFillColor(1, 0, 0)

local rectangle2 = display.newRect(centerX, centerY+50, 80, 60)
rectangle2:setFillColor(0, 1, 0)

local rectangle3 = display.newRect(centerX+100, centerY+50, 80, 60)
rectangle3:setFillColor(0, 0, 1)

local circle1 = display.newCircle(centerX-100, centerY-50, 30)
circle1:setFillColor(1, 0, 0)

local circle2 = display.newCircle(centerX, centerY-50, 30)
circle2:setFillColor(0, 1, 0)

local circle3 = display.newCircle(centerX+100, centerY-50, 30)
circle3:setFillColor(0, 0, 1)