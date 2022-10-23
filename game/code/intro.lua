intro = {}
local w,h = love.graphics.getWidth(), love.graphics.getHeight()

intro.load = function()
  print("LOADING: Intro...")
  cover_img = love.graphics.newImage("cover.jpg")
  print("OK\n")
end

intro.draw = function()
  love.graphics.draw(cover_img, 0, 0)
  ui.draw_logo()
  ui.draw_start()
end

intro.update = function(dt)
  ui.update_alpha(dt)
end
