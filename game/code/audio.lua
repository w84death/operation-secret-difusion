--
-- Soundtracks by http://computoser.com/
-- SFX by https://sfxr.me/
--

audio = {
  tune = 1
}

audio.load = function()
  print("LOADING: Audio...")
  audio.shoot = love.audio.newSource("audio/shoot.wav", "static")
  audio.music = {
    love.audio.newSource("audio/theme1.mp3", "stream"),
    love.audio.newSource("audio/tune_01.mp3", "stream"),
    love.audio.newSource("audio/tune_02.mp3", "stream"),
    love.audio.newSource("audio/tune_03.mp3", "stream")}
  print("OK\n")
end

audio.play = function(what)
  love.audio.play(audio.shoot)
end

audio.tune_in = function(new_tune)
  love.audio.stop(audio.music[audio.tune])
  love.audio.play(audio.music[new_tune])
  audio.tune = new_tune
end

audio.tune_next = function()
  if audio.tune < #audio.music then
    audio.tune_in(audio.tune+1)
  end
end
