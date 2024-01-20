--==========================
-- RECAPITULANDO TRANSITIONS
--==========================

local centroX = display.contentCenterX
local centroY = display.contentCenterY

-- Imagem de fundo
local bg = display.newImageRect("imagens/bg.png", 1700, 768)
bg.x = centroX
bg.y = centroY

-- Imagem Goku
local goku = display.newImageRect("imagens/goku.png", 250, 350)
goku.x = 250
goku.y = 250

-- Imagem Naruto
local naru = display.newImageRect("imagens/naruto.png", 300, 350)
naru.x = 800
naru.y = 570

-- Imagem VS
local vs = display.newImageRect("imagens/vs.png", 350, 400)
vs.x = centroX
vs.y = centroY

-- Quadrado do Goku
local quadGoku = display.newRect(250, 150, 150, 150)

-- Quadrado Naruto
local quadNaruto = display.newRect(750, 150, 150, 150)

-- Texto Goku
local gokuText = display.newText("Goku", 250, 150, native.systemFont, 100, center)
gokuText:setFillColor(0.949, 0.6, 0.050)

-- Texto Naruto
local narutoText = display.newText("Naruto", 750, 150, native.systemFont, 100, center)
narutoText:setFillColor(0.949, 0.6, 0.050)

transition.blink(narutoText, {time=2000})
transition.blink(gokuText, {time=2000})

-- Transição Goku
transition.to(goku, {time=3000, y=400, iterations=0, transition=easing.outElastic})

-- Transição Naruto
transition.to(naru, {time=3000, y=400, iterations=0, transition=easing.outElastic})

-- Transição VS
transition.to(vs, {time=3000, rotation=360, iterations=1})

-- Transição Quadrado Goku

transition.to(quadGoku, {time=1000, rotation=45, alpha=0.5})

-- Transição Quadrado Naruto
transition.to(quadNaruto, {time=1000, rotation=45, alpha=0.5})

-- Transição BG
transition.to(bg, {time=1000, xScale=-1})