aim = {
  rad = 14,
  rad_min = 14,
  rad_max = 20,
  dir = 1,
  speed = 120,
  active = true
}

aim.draw = function(x, y)
  love.graphics.setColor(1, 1, 1)
  love.graphics.circle("line", x, y, aim.rad-4)
  love.graphics.circle("fill", x, y, 4)
  love.graphics.line(x, y-aim.rad, x, y+aim.rad)
  love.graphics.line(x-aim.rad, y, x+aim.rad, y)
end

aim.update = function(dt)
  if aim.active then
    aim.rad = aim.rad + dt*aim.dir*aim.speed
    if aim.rad > aim.rad_max then
      aim.rad = aim.rad_max
      aim.dir = aim.dir * -1
    end
    if aim.dir < 0 and aim.rad < aim.rad_min then
      aim.rad = aim.rad_min
      aim.active = false
    end
  else
    if aim.rad > aim.rad_min then aim.rad = aim.rad - dt*aim.speed end
  end
end

aim.shoot = function(x, y)
  aim.dir = 1
  aim.active = true

  local r,g,b,a = game.read_mask(x, y)
  r,g,b = math.floor(r),math.floor(g),math.ceil(b)
  if r==1 and g==1 and b==1 then game.add_hit("hit", x, y) end
  if not(r and g and b) then game.add_hit("air", x, y) end
  if (r and b) == 0 and g == 1 then game.add_hit("foliage", x, y) end
  if (r and g) == 0 and b == 1 then game.add_hit("ground", x, y) end
end

