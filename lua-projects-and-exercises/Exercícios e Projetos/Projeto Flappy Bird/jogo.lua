--========================
-- JOGO.LUA
--========================

local composer=require("composer")

local cena=composer.newScene()

function cena:create(event)
  local cenaJogo=self.view

  local alturaTela=display.contentHeight
  local larguraTela=display.contentWidth

  --Declaração dos grupos
  local grupoFundo=display.newGroup()
  local grupoJogo=display.newGroup()
  local grupoGui=display.newGroup()

  cenaJogo:insert(grupoFundo)
  cenaJogo:insert(grupoJogo)
  cenaJogo:insert(grupoGui)

  --Declaração da Fisica
  local physics=require("physics")
  physics.start()
  physics.setGravity(0,80)
  --physics.setDrawMode("hybrid")

  --Declaração das Variaveis
  local vivo=true
  local pontos=0
  local fonte="recursos/fontes/font.ttf"

  --Declaração das Imagens
  local imagens={
    fundo={
      "recursos/imagens/background-day.png",
      "recursos/imagens/background-night.png"
    },
    canos={
      "recursos/imagens/pipe-green.png",
      "recursos/imagens/pipe-red.png"
    }
  }

  --Declaração da Randomização
  local fundoRandomico=math.random(1,2)
  local canoRandomico=math.random(1,2)

  --Declaração dos Objetos
  local fundo=display.newImageRect(grupoFundo,imagens.fundo[fundoRandomico],larguraTela,alturaTela)
  fundo.x=display.contentCenterX
  fundo.y=display.contentCenterY

  local chao=display.newImageRect(grupoJogo,"recursos/imagens/base.png",larguraTela,alturaTela*0.25)
  chao.x=display.contentCenterX
  chao.y=alturaTela*0.9
  physics.addBody(chao,"static")
  chao.id="obstaculo"

  --Chamando a Sprite
  local spriteSheet=graphics.newImageSheet("recursos/imagens/bird-sprite-sheet.png",{
    width=800/4,
    height=270/2,
    numFrames=8,
    sheetContentWidth=800,
    sheetContentHeight=270
  })

  local sequencia={
    {name="voando",start=1,count=8,time=800,countLoop=0},
    {name="parado",start=1,count=1,time=0,countLoop=0}
  }

  local jogador=display.newSprite(spriteSheet,sequencia)
  jogador.x=larguraTela*0.3
  jogador.y=alturaTela*0.15
  physics.addBody(jogador,"dynamic",{radius=60})
  jogador.id="jogadorID"
  jogador:play()

  local textoPontos = display.newText(grupoGui,pontos,larguraTela*0.5,alturaTela*0.1,fonte,200)

  --Declarando as Funcionalidades
  function voar(event)
    if event.phase=="began" and vivo==true then
      audio.play(audioVoar)
      jogador:setLinearVelocity(0,-900)
    end
  end
  Runtime:addEventListener("touch",voar)

  function addCanos()
    if vivo==true then
      local canoBaixo=display.newImageRect(grupoJogo,imagens.canos[canoRandomico],larguraTela*0.2,alturaTela*0.8)
      canoBaixo.x=larguraTela*1.2
      canoBaixo.y=math.random(alturaTela*0.65,alturaTela*1.05)
      physics.addBody(canoBaixo,"static")
      canoBaixo.id="obstaculo"

      transition.to(canoBaixo,{
        time=3500,
        x=-larguraTela*0.2,
        onComplete=function()
          display.remove(canoBaixo)
        end
      })

      local canoCima=display.newImageRect(grupoJogo,imagens.canos[canoRandomico],larguraTela*0.2,alturaTela*0.8)
      canoCima.x=larguraTela*1.2
      canoCima.y=canoBaixo.y-canoBaixo.height*1.2
      canoCima.rotation=180
      physics.addBody(canoCima,"static")
      canoCima.id="obstaculo"

      transition.to(canoCima,{
        time=3500,
        x=-larguraTela*0.2,
        onComplete=function()
          display.remove(canoCima)
        end
      })

      local sensor=display.newRect(grupoJogo, canoBaixo.x, canoBaixo.y - canoBaixo.height*0.6, 40, 450)
      physics.addBody(sensor,"static")
      sensor.id="sensorID"
      sensor.alpha=0
      sensor.isSensor=true

      transition.to(sensor,{
        time=3500,
        x=-larguraTela*0.2,
        onComplete=function()
          display.remove(sensor)
        end
      })
    end
  end

  timer.performWithDelay(2000,addCanos,0)

  --Função de Colisão
  function verificarColisao(event)
    if event.phase=="began" and vivo==true then
      local objeto1=event.object1
      local objeto2=event.object2

      if (objeto1.id=="jogadorID" and objeto2.id=="sensorID") or (objeto2.id=="jogadorID" and objeto1.id=="sensorID") then
        audio.play(audioPonto)
        pontos = pontos+1
        textoPontos.text=pontos
      end

      if (objeto1.id=="jogadorID" and objeto2.id=="obstaculo") or (objeto2.id=="jogadorID" and objeto1.id=="obstaculo") then
        jogador:setSequence("parado")
        jogador:play()
        audio.play(audioMorte)
        vivo=false

        local gameOver=display.newImageRect(grupoGui,"recursos/imagens/gameover.png",larguraTela*0.8,alturaTela*0.15)
        gameOver.x=display.contentCenterX
        gameOver.y=display.contentCenterY

        function removeCena()
          composer.removeScene("jogo")
        end

        timer.performWithDelay(4000,function()
          removeCena()
          display.remove(jogador)
          display.remove(canoBaixo)
          display.remove(canoCima)
          display.remove(sensor)

          composer.gotoScene("inicio",{effect="slideRight",time=500})
        end,1)
      end
    end
  end

  Runtime:addEventListener("collision",verificarColisao)
end
cena:addEventListener("create",cena)
return cena