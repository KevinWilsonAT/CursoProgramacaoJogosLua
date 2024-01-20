-- criando parte grafica de um inventario de rpg

local centerX = display.contentCenterX
local centerY = display.contentCenterY

-- grupo para o plano de fundo do inventario

local backgroundGroup = display.newGroup()

-- grupo para as molduras do inventario

local framesGroup = display.newGroup()

-- grupo para os icones do inventario

local iconsGroup = display.newGroup()

-- plano de fundo

local bg = display.newImageRect(backgroundGroup, "Images/bg.png", 1500, 768)
bg.x = centroX
bg.y = centroY

-- inventario e imagem do heroi

local inventory = display.newImageRect(backgroundGroup, "Images/inventory.png", 650, 700)
inventory.x = centroX
inventory.y = 395

local silho = display.newImageRect(backgroundGroup, "Images/silho.png", 300, 650)
silho.x = centroX
silho.y = 395

-- molduras dos slots dos itens

local frameL = display.newImageRect(framesGroup, "Images/frame.png", 120, 120)
frameL.x = 265
frameL.y = 150

local frame1L = display.newImageRect(framesGroup, "Images/frame.png", 120, 120)
frame1L.x = 265
frame1L.y = 300

local frame2L = display.newImageRect(framesGroup, "Images/frame.png", 120, 120)
frame2L.x = 265
frame2L.y = 450

local frame3L = display.newImageRect(framesGroup, "Images/frame.png", 120, 120)
frame3L.x = 265
frame3L.y = 600

local frameR = display.newImageRect(framesGroup, "Images/frame.png", 120, 120)
frameR.x = 765
frameR.y = 150

local frame1R = display.newImageRect(framesGroup, "Images/frame.png", 120, 120)
frame1R.x = 765
frame1R.y = 300

local frame2R = display.newImageRect(framesGroup, "Images/frame.png", 120, 120)
frame2R.x = 765
frame2R.y = 450

local frame3R = display.newImageRect(framesGroup, "Images/frame.png", 120, 120)
frame3R.x = 765
frame3R.y = 600

-- icone dos itens

local helmet = display.newImageRect(iconsGroup, "Images/helmets.png", 100, 100)
helmet.x = 265
helmet.y = 150

local cloak = display.newImageRect(iconsGroup, "Images/cloaks.png", 100, 100)
cloak.x = 265
cloak.y = 300

local armor = display.newImageRect(iconsGroup, "Images/armor.png", 100, 100)
armor.x = 265
armor.y = 450

local pants = display.newImageRect(iconsGroup, "Images/pants.png", 100, 100)
pants.x = 265
pants.y = 600

local bag = display.newImageRect(iconsGroup, "Images/bag.png", 100, 100)
bag.x = 765
bag.y = 150

local gloves = display.newImageRect(iconsGroup, "Images/gloves.png", 100, 100)
gloves.x = 765
gloves.y = 300

local sword = display.newImageRect(iconsGroup, "Images/sword.png", 100, 100)
sword.x = 765
sword.y = 450

local boots = display.newImageRect(iconsGroup, "Images/boots.png", 100, 100)
boots.x = 765
boots.y = 600

-- alterando propriedades dos grupos

-- alterando localizacao de todos os itens do grupo de icones

-- iconsGroup.x = 50

-- alterando rotacao de todos os itens do grupo de icones

-- iconsGroup.rotation = 25

-- alterando escala/tamanho de todos os itens do grupo de icones

-- iconsGroup.xScale = 2
-- iconsGroup.yScale = 2

-- verificandoa qtde de itens de cada grupo

local numIcons = iconsGroup.numChildren
local numFrames = framesGroup.numChildren
local numBackground = backgroundGroup.numChildren

print("Qtde grupo iconsGroup: " .. numIcons)
print("Qtde grupo framesGroup: " .. numFrames)
print("Qtde grupo backgroundGroup: " .. numBackground)

-- definindo se grupo vai comecar visivel ou nao
iconsGroup.isVisible = true

-- definindo transparencia dos objetos do grupo
backgroundGroup.alpha = 0.5

-- alterando a posicao x do item cloak

-- cloak.x = 400
-- cloak.y = 500
-- cloak.rotation = -25
-- cloak.isVisible = false

-- adicionando objeto ao grupo iconsGroup

iconsGroup:insert(silho)

-- removendo objeto do grupo iconsGroup

iconsGroup:remove(gloves)

-- removendo grupo backgroundGroup inteiro

backgroundGroup:removeSelf()