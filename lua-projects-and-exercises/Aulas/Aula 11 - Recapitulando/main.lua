-- recapitulando transitions

local centerX = display.contentCenterX
local centerY = display.contentCenterY

-- imagem de fundo
local bg = display.newImageRect("images/bg.png", 1700, 768)
bg.x = centerX
bg.y = centerY

-- imagem goku
local goku = display.newImageRect("images/goku.png", 250, 350)
goku.x = 250
goku.y = 250

-- imagem naruto
local naruto = display.newImageRect("images/naruto.png", 250, 350)
naruto.x = 800
naruto.y = 570

-- imagem vs
local vs = display.newImageRect("images/vs.png", 350, 400)
vs.x = centerX
vs.y = centerY

-- quadrado goku
local sqGoku = display.newRect(150, 150, 150, 150)

-- quadrado naruto
local sqNaruto = display.newRect(750, 150, 150, 150)

local gokuText = display.newText("Goku", 150, 150, native.systemFont, 100, center)
gokuText:setFillColor(0.949, 0.6, 0.050)

local narutoText = display.newText("Naruto", 750, 150, native.systemFont, 100, center)
narutoText:setFillColor(0.949, 0.6, 0.050)

transition.blink(narutoText, {time=2000})
transition.blink(gokuText, {time=2000})

-- Transition Goku
transition.to(goku, {time=3000, y = 400, iterations=0, transition=easing.outElastic})

-- Transition Goku
transition.to(naruto, {time=3000, y = 400, iterations=0, transition=easing.outElastic})

-- Transition VS
transition.to(vs, {time=3000, y = 400, rotation=360, iterations=1})

-- Transition Quadrado Goku
transition.to(sqGoku, {time=1000, rotation=45, alpha=0.5})

-- Transition Quadrado Naruto
transition.to(sqNaruto, {time=1000, rotation=45, alpha=0.5})

-- Transition BG
transition.to(bg, {time=1000, xScale=-1})