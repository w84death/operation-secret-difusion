mouse = {}

mouse.load = function()
  print("LOADING: Mouse support...")
  love.mouse.setVisible(false)
  print("OK\n")
end

mouse.draw = function()
  local mx, my = love.mouse.getPosition()
  aim.draw(mx, my)
end

mouse.update = function(dt)
  aim.update(dt)
end
