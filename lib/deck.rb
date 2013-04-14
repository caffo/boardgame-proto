class Deck < Array
  alias_method :draw, :shift
end