--==========================================================
-- Incluindo imagens na tela e trabalhando com Grupos
--==========================================================

-- EXEMPLO - CRIANDO A PARTE GRÁFICA DE UM INVENTÁRIO DE RPG

local centroX = display.contentCenterX
local centroY = display.contentCenterY

---------------------------------------------
-- Grupo para os plano de fundo do inventário
--------------------------------------------
local backgroundGroup = display.newGroup()

-----------------------------------------
-- Grupo para as molduras do inventário
------------------------------------------
local framesGroup = display.newGroup()

---------------------------------
-- Grupo para os ícones dos itens
---------------------------------
local iconsGroup = display.newGroup()

-------------------------------
-- Plano de fundo
-------------------------------
local bg = display.newImageRect(backgroundGroup, "Imagens/bg.png", 1500, 768)
bg.x = centroX
bg.y = centroY

-------------------------------
-- Inventário e Imagem do herói
-------------------------------
local inventory = display.newImageRect(backgroundGroup, "Imagens/inventory.png", 650, 700)
inventory.x = centroX
inventory.y = 395

local silho = display.newImageRect(backgroundGroup, "Imagens/silho.png", 300, 650)
silho.x = centroX
silho.y = 395

-------------------------------
-- Molduras dos slots dos itens
-------------------------------
local frameL = display.newImageRect(framesGroup, "Imagens/frame.png", 120, 120)
frameL.x = 265
frameL.y = 150

local frame1L = display.newImageRect(framesGroup, "Imagens/frame.png", 120, 120)
frame1L.x = 265
frame1L.y = 300

local frame2L = display.newImageRect(framesGroup, "Imagens/frame.png", 120, 120)
frame2L.x = 265
frame2L.y = 450

local frame3L = display.newImageRect(framesGroup, "Imagens/frame.png", 120, 120)
frame3L.x = 265
frame3L.y = 600

local frameR = display.newImageRect(framesGroup, "Imagens/frame.png", 120, 120)
frameR.x = 765
frameR.y = 150

local frame1R = display.newImageRect(framesGroup, "Imagens/frame.png", 120, 120)
frame1R.x = 765
frame1R.y = 300

local frame2R = display.newImageRect(framesGroup, "Imagens/frame.png", 120, 120)
frame2R.x = 765
frame2R.y = 450

local frame3R = display.newImageRect(framesGroup, "Imagens/frame.png", 120, 120)
frame3R.x = 765
frame3R.y = 600

---------------------------------
-- Ícones dos itens
---------------------------------

local helmet = display.newImageRect(iconsGroup, "Imagens/helmets.png", 100, 100)
helmet.x = 265
helmet.y = 150

local cloaks = display.newImageRect(iconsGroup, "Imagens/cloaks.png", 100, 100)
cloaks.x = 265
cloaks.y = 300

local armor = display.newImageRect(iconsGroup, "Imagens/armor.png", 100, 100)
armor.x = 265
armor.y = 450

local pants = display.newImageRect(iconsGroup, "Imagens/pants.png", 100, 100)
pants.x = 265
pants.y = 600

local bag = display.newImageRect(iconsGroup, "Imagens/bag.png", 100, 100)
bag.x = 765
bag.y = 150

local gloves = display.newImageRect(iconsGroup, "Imagens/gloves.png", 100, 100)
gloves.x = 765
gloves.y = 300

local sword = display.newImageRect(iconsGroup, "Imagens/sword.png", 100, 100)
sword.x = 765
sword.y = 450

local boots = display.newImageRect(iconsGroup, "Imagens/boots.png", 100, 100)
boots.x = 765
boots.y = 600

------------------------------------
-- Alterando Propriedades dos grupos
------------------------------------

-- Alterando a localização de todos os itens do grupo de icones
-- iconsGroup.x = 50

-- Alterando a rotação dos itens do grupos de icones
-- iconsGroup.rotation = 25

--Alterando a escala(tamanho) dos itens do grupo
-- iconsGroup.xScale = 2
-- iconsGroup.yScale = 2


-- Verificando a quantidade de itens de cada grupo de exibição
local numIcons = iconsGroup.numChildren
local numFrames = framesGroup.numChildren
local numBackground = backgroundGroup.numChildren

print("A quantidade de objeto no grupo iconsGroup é: " .. numIcons)
print("A quantidade de objeto no grupo framesGroup é: " .. numFrames)
print("A quantidade de objeto no grupo backgroundGroup é: " .. numBackground)

-- Definindo se o grupo vai começar sendo visivel ou não

iconsGroup.isVisible = true

-- Definindo a transparencia do grupo

backgroundGroup.alpha = 0.5

-- Para alterar apenas um item do grupo, é só chamar o objeto e alterar suas propriedades

-- Alterando a localização X do item Capa
cloaks.x = 400
cloaks.y = 500
-- cloaks.rotation = -25

-- cloaks.isVisible = false


-- Adicionando / removendo objetos do grupo

-- Exemplo: Adicionar um objeto "obj" ao grupo
-- iconsGroup:insert(silho)

-- Exemplo: Remover um objeto "obj" do grupo
-- iconsGroup:remove(gloves)

-- Removendo o grupo completo

-- backgroundGroup:removeSelf()





