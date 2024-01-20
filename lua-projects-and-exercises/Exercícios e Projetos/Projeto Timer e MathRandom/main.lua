--==========================================
-- Usando Transições, timers e randomização
--==========================================

--Desativa a barra de notificação
display.setStatusBar(display.HiddenStatusBar)

-- Alterar a cor do background da tela
display.setDefault("background", 0.2,0.2,0.2)


-- Configuração da tela

local larguraTela = 320
local alturaTela = 480

local centroX = display.contentCenterX
local centroY = display.contenCenterY

-- Criar Chão
local chao = display.newRect(centroX, alturaTela+50, larguraTela, 110)
chao:setFillColor(0, 1, 0)

-- Cria Personagem
local player = display.newImageRect("man.png", 300, 300)
player.x = centroX
player.y = alturaTela-50

-- Função para criar gotas de chuva
local function criarGotaChuva()
	local pingo = display.newRect(
		math.random(0, larguraTela), -- Posição em X vai ser aleatoria
		-100, -- Posição em Y (fora da tela)
		5, -- largura da gota
		20 -- altura da gota
		)
	pingo:setFillColor(0,0,1) -- Cor azul
	pingo.alpha = 0.7

	local transitionTempo = math.random(1500, 3000) -- tempo de transição aleatorio
	transition.to(pingo, {
		y = alturaTela + 10, -- Mover a gota até o final da tela
		time = transitionTempo, -- Duração da transição
		onComplete = function(obj)
			display.remove(obj) -- Remover a gota após a transição
		end
	})
end

local function criarChuva()
	criarGotaChuva() -- Chama a função para criar uma gota de chuva
	timer.performWithDelay(300, criarChuva )
end

-- Iniciar a criação de gotas de chuva
criarChuva() -- Começa a criar gotas de chuva infinitamente

