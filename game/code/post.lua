post = {}

post.load = function()
  crt = love.graphics.newShader("shaders/crt.frag")
  crt:send('inputSize', {love.graphics.getWidth(), love.graphics.getHeight()})
  crt:send('textureSize', {love.graphics.getWidth(), love.graphics.getHeight()})
  canvas = love.graphics.newCanvas()
end

post.draw_start = function()
  love.graphics.setCanvas(canvas)
  love.graphics.clear()
end

post.draw_end = function()
  love.graphics.setCanvas()
  love.graphics.setShader(crt)
  love.graphics.draw(canvas)
  love.graphics.setShader()
end
