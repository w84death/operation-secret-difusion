ui = {}
local alpha = 1
local alpha_dir = -1
local w,h = love.graphics.getWidth(), love.graphics.getHeight()

ui.load = function()
  ui.font_header = love.graphics.newFont("fonts/TomorrowBlack.ttf", 32)
  ui.font_text = love.graphics.newFont("fonts/MatchupPro.ttf", 24)
end

ui.draw_header = function(text, x, y)
  love.graphics.setFont(ui.font_header)
  love.graphics.print(text, x, y)
end

ui.draw_text = function(text, x, y)
  love.graphics.setFont(ui.font_text)
  love.graphics.print(text, x, y)
end

ui.draw_start = function()
  love.graphics.setColor(255,255,255,alpha)
  ui.draw_text("PRESS FIRE TO START", 32, h-32)
  love.graphics.setColor(255,255,255,1)
end

ui.update_alpha = function(dt)
  alpha = alpha + (dt*alpha_dir)
  if alpha < 0 or alpha > 1 then alpha_dir = alpha_dir * -1 end
end

ui.draw_logo = function()
  love.graphics.setColor(0,0,0)
  ui.draw_header("OPERATION: SECRET DIFFUSION", 33, 34)
  love.graphics.setColor(1,1,1)
  ui.draw_header("OPERATION: SECRET DIFFUSION", 32, 32)
  ui.draw_text("GAME BY KRZYSZTOF KRYSTIAN JANKOWSKI FROM P1X", 32, 80)
end

ui.draw_hud = function()
  love.graphics.setColor(1,1,1)

  ui.draw_text("SCORE", 32, 32)
  ui.draw_header(game.score, 32, 46)
  ui.draw_text("HP", w-128, 32)
  love.graphics.setColor(1,1,1)
  love.graphics.rectangle("fill",w-128,50,96,26)
  love.graphics.setColor(0.2,1.0,0.2)
  love.graphics.rectangle("fill",w-124,54,88,18)

  love.graphics.setColor(1,1,1)
  ui.draw_text("MISSION: #"..game.mission.."   LOCATION: #"..game.screen, 32, h-40)
end



