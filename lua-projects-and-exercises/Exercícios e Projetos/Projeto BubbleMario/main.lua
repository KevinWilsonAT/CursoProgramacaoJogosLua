--===================================
-- PRIMEIRO PROJETO: Baby Mario Bolha
--===================================

-- Chama as config da biblioteca de física dentro do código
local physics = require ("physics")

-- Inicia a fisica no projeto
physics.start()

-- Mostrar "Corpo Colisor dos objetos"
-- normal, debug, hybrid
physics.setDrawMode("hybrid")

-- Definimos os valores do centro da tela em X e Y
local centroX = display.contentCenterX
local centroY = display.contentCenterY

-------------------------------------------
-- Inserindo os objetos do Projeto
-------------------------------------------

local pontosIniciais = 0

-- Criamos um objeto de imagem para ser o fundo da tela
local background = display.newImageRect("bg.png", 800, 600)
background.x = centroX
background.y = centroY

--Criamos um circulo preto para ser o placar
local circuloPontos = display.newCircle(centroX, centroY-250, 50)
circuloPontos:setFillColor(0, 0, 0)
circuloPontos.strokeWidth = 2
circuloPontos:setStrokeColor(1, 1, 0)

-- Criamos um objeto de texto para mostrar os pontos
local pontoText = display.newText(pontosIniciais, centroX, centroY-250, native.systemFont, 60)
pontoText:setFillColor(1,1,0)

-- Criamos um retangulo invisivel para ser o chão
local chao = display.newRect(centroX, centroY+260, 400, 80)
chao.alpha = 0 -- Aumenta a transparencia do objeto

-- Criamos um objeto de imagem para ser o Baby Mario
local babyMario = display.newImageRect("babymario.png", 112, 112)
babyMario.x = centroX
babyMario.y = centroY

-- Aplicando os corpos colisores aos objetos

-- Cria um corpo colisor no objeto "chão" (um objeto estatico, que n é afetado pela gravidade)
physics.addBody(chao, "static")

-- Cria um corpo colisor no objeto "babyMario" (um objeto dinamico, pois é afetado pela gravidade)
physics.addBody(babyMario, "dynamic", {radius=50, bounce=0})

---------------------------------------
-- Criando as funções
---------------------------------------

-- Função para quando clicarmos no objeto babyMario, empurra-lo pra cima,
-- somar pontos toda vez que tocarmos nele

local function empurrarbabyMario()
	-- O applyLinearImpulse é um comando que aplica um empurrão ao objeto.
	-- Os primeiros 2 parametros são a quantidade de força direcional em X e Y.
	-- Como só queremos que o babyMario vá pra cima, só vamos alterar o valor de Y
	-- Após isso, informamos onde aplicar essa força direcional: no X e Y do objeto
	babyMario:applyLinearImpulse(0, -0.75, babyMario.x, babyMario.y)
	pontosIniciais = pontosIniciais + 1
	pontoText.text = pontosIniciais
end

local function perderPontos()
	pontosIniciais = 0
	pontoText.text = pontosIniciais
end

-- Aqui chamamos as Funções

--No babyMario, vamos adicionar a função de empurrarbabyMario
babyMario:addEventListener("tap", empurrarbabyMario)

-- No objeto chão, vamos adicionar a função de perderPontos
chao:addEventListener("collision", perderPontos)




