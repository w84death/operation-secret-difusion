state = {}

_intro_ = 1
_game_ = 2

state.current = _intro_

state.change = function(to)
  state.current = to
end

state.is = function(what)
  return state.current == what
end
