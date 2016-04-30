require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480, false

    self.caption = "Pong"
  end
end

window = GameWindow.new
window.show