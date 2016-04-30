require 'gosu'

require_relative 'paddle'
require_relative 'ball'

class GameWindow < Gosu::Window
  attr_reader :paddles

  def initialize
    super 640, 480, false

    @paddle1 = Paddle.new(self, 50, 100)
    @paddle2 = Paddle.new(self, 565, 280)

    @paddles = [@paddle1, @paddle2]
    @ball = Ball.new(self)

    self.caption = "Pong"


  end

  def update
    if button_down? Gosu::KbUp
      @paddle2.move_up
    end
    if button_down? Gosu::KbDown
      @paddle2.move_down
    end

    if button_down? Gosu::KbW
      @paddle1.move_up
    end
    if button_down? Gosu::KbS
      @paddle1.move_down
    end


    @ball.move
  end


  def draw
    draw_line(30, 50, Gosu::Color::WHITE, 610, 50, Gosu::Color::WHITE)
    draw_line(610, 50, Gosu::Color::WHITE, 610, 430, Gosu::Color::WHITE)
    draw_line(610, 430, Gosu::Color::WHITE, 30, 430, Gosu::Color::WHITE)
    draw_line(30, 430, Gosu::Color::WHITE, 30, 50, Gosu::Color::WHITE)
    
    @ball.draw
    @paddle1.draw
    @paddle2.draw
  end
end

window = GameWindow.new
window.show