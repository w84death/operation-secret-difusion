-- KKJ^P1X

require("code.state")
require("code.mouse")
require("code.audio")
require("code.ui")
require("code.post")

require("code.intro")
require("code.aim")
require("code.game")

function love.load()
  print("\n\nWELCOME TO THE GAME!\nPLEASE WAIT...\n")
  audio.load()
  intro.load()
  mouse.load()
  ui.load()
  game.load()
  post.load()
  print("GAME FULLY LOADED!\n\nHave fun!\n")

  audio.tune_in(1)
end

function love.draw()
  post.draw_start()
  if state.is(_intro_) then intro.draw() end
  if state.is(_game_) then game.draw() end
  mouse.draw()
  post.draw_end()
end

function love.update(dt)
  if state.is(_intro_) then intro.update(dt) end
  if state.is(_game_) then
    game.update(dt)
    mouse.update(dt)
  end
end

function love.keypressed(key)
  if key == "escape" then
    print("Bye!")
    love.event.quit()
  end
  if key == "space" then
    game.next()
    audio.tune_next()
  end
end

function love.mousepressed(x, y, button, istouch)
  if button == 1 then
    if state.is(_game_) then game.mousepressed(x, y) end
    if state.is(_intro_) then
      state.change(_game_)
      audio.tune_next()
    end
  end
end
