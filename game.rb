require 'gosu'

require_relative 'paddle'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480, false

    @paddle = Paddle.new(self)

    self.caption = "Pong"
  end

  def draw
    @paddle.draw
  end
end

window = GameWindow.new
window.show