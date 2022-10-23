intro = {}
local w,h = love.graphics.getWidth(), love.graphics.getHeight()
local hw = w/2

intro.load = function()
  print("LOADING: Intro...")
  cover_img = love.graphics.newImage("panels/cover.jpg")
  terminator_img = love.graphics.newImage("sprites/p1x_terminator.png")
  print("OK\n")
end

intro.draw = function()
  love.graphics.draw(cover_img, 0, 0)
  love.graphics.draw(terminator_img, hw-128, h-386)
  ui.draw_logo()
  ui.draw_start()
end

intro.update = function(dt)
  ui.update_alpha(dt)
end
