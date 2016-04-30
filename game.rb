require 'gosu'

require_relative 'paddle'
require_relative 'ball'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480, false

    @paddle = Paddle.new(self)
    @ball = Ball.new(self)

    self.caption = "Pong"
  end

  def update
    if button_down? Gosu::KbUp
      @paddle.move_up
    end
    if button_down? Gosu::KbDown
      @paddle.move_down
    end

    @ball.move

  end

  def draw
    @paddle.draw
    @ball.draw
  end
end

window = GameWindow.new
window.show