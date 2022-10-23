game = {
  hits = {},
  enemies = {},
  mission = 1,
  screen = 1,
  score = 1,
  hp = 10
}
local bg = {
  x = 0,
  y = 0,
  dir = -1,
  speed = 33,
  offset = 0,
  current = 1
}
local w,h = love.graphics.getWidth(), love.graphics.getHeight()

game.load = function()
  print("LOADING: Game assets...")
  local dir = "panels"
  game.backgrounds = {}
  game.masks = {}
  local files = love.filesystem.getDirectoryItems(dir.."/bg")
  for k, file in ipairs(files) do
    table.insert(game.backgrounds, love.graphics.newImage(dir.."/bg/"..file))
    if love.filesystem.getInfo( dir.."/masks/"..file ) then
      table.insert(game.masks, love.image.newImageData(dir.."/masks/"..file))
    else
      table.insert(game.masks, love.image.newImageData(dir.."/masks/fallback.jpg"))
    end
  end
  bg.offset = game.backgrounds[bg.current]:getWidth() - w

  game.hits_sprites = {
    love.graphics.newImage("sprites/hit_1.png"),
    love.graphics.newImage("sprites/hit_2.png")
  }

  game.game_sprites = {
    love.graphics.newImage("sprites/enemies/enemy_01.png")
  }

  table.insert(game.enemies,{
    width=200,
    height=200,
    position="bottom",
    race=1,
    sprite=1
  })

  print("OK\n")
end

game.draw = function()
  love.graphics.draw(game.backgrounds[bg.current], bg.x, bg.y)
  game.draw_hits()
  game.draw_enemies()
  ui.draw_hud()
end

game.update = function(dt)
  bg.x = bg.x + (dt*bg.dir*bg.speed)
  if bg.x < -bg.offset or bg.x > 0 then bg.dir = bg.dir * -1 end

  game.score = game.score + math.ceil(dt)

end

game.mousepressed = function(x, y)
  audio.play("shoot")
  aim.shoot(x, y)
end

game.next = function()
  bg.current = bg.current + 1
  if bg.current > #game.backgrounds then bg.current = 1 end
  game.clear_hits()
end

game.read_mask = function(x, y)
  r, g, b = game.masks[bg.current]:getPixel( x-bg.x, y )
  return r, g, b
end

game.add_hit = function(type, x, y)
  if type == "hit" then
    table.insert(game.hits, {x=x-bg.x, y=y, sprite=1})
  end
  if type == "ground" then
    table.insert(game.hits, {x=x-bg.x, y=y, sprite=2})
  end
end

game.draw_hits = function()
  for i,hit in ipairs(game.hits) do
    love.graphics.draw(game.hits_sprites[hit.sprite], hit.x+bg.x-8, hit.y-8)
  end
end

game.clear_hits = function()
  while #game.hits ~= 0 do rawset(game.hits, #game.hits, nil) end
end

game.draw_enemies = function()
  love.graphics.draw(game.game_sprites[game.enemies[1].sprite], 128+bg.x-100,h-200)
  love.graphics.draw(game.game_sprites[game.enemies[1].sprite], 800+bg.x-100,h-200)
  love.graphics.draw(game.game_sprites[game.enemies[1].sprite], 1200+bg.x-100,h-200)
  love.graphics.draw(game.game_sprites[game.enemies[1].sprite], 1800+bg.x-100,h-200)

end
