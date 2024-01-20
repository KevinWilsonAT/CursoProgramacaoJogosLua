--=================
-- INICIO.LUA
--===================


local composer = require("composer")

local cena = composer.newScene()

function cena:create(event)

  local cenaInicio = self.view

  local alturaTela = display.contentHeight
  local larguraTela = display.contentWidth

  local audioMusica = audio.loadStream("recursos/audio/music.mp3")

  audio.play(audioMusica, {channel = 2, loops = -1})
  audio.setVolume (0, {channel = 2})

  local fundo = display.newImageRect(cenaInicio, "recursos/imagens/background-day.png", larguraTela, alturaTela)
  fundo.x = display.contentCenterX
  fundo.y = display.contentCenterY

   local chao = display.newImageRect(cenaInicio, "recursos/imagens/base.png", larguraTela, alturaTela*0.25)
   chao.x = display.contentCenterX
   chao.y = alturaTela*0.9

   local iniciar = display.newImageRect(cenaInicio, "recursos/imagens/start.png", larguraTela*0.8, alturaTela*0.8)
   iniciar.x = display.contentCenterX
   iniciar.y = display.contentCenterY

  function iniciarjogo(event)
    if event.phase == "began" then
      composer.gotoScene("jogo", {
        time=500, effect = "slideLeft"
      })
      audio.play(audioTransicao)
    end
  end

  iniciar:addEventListener ("touch", iniciarjogo)


end
cena:addEventListener('create', cena)
return cena