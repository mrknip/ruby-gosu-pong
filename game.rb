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

    @p1score = 0
    @p2score = 0

    self.caption = "Pong"

    @font = Gosu::Font.new(24, name: "Courier New")

    new_round
  end

  def new_round
    @ball = Ball.new(self)
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
    case @ball.goal?
    when :player1
      @p1score += 1
      new_round
    when :player2
      @p2score += 1
      new_round
    end
  end


  def draw
    draw_line(30, 50, Gosu::Color::WHITE, 610, 50, Gosu::Color::WHITE)
    draw_line(610, 50, Gosu::Color::WHITE, 610, 430, Gosu::Color::WHITE)
    draw_line(610, 430, Gosu::Color::WHITE, 30, 430, Gosu::Color::WHITE)
    draw_line(30, 430, Gosu::Color::WHITE, 30, 50, Gosu::Color::WHITE)
    draw_line(320, 50, Gosu::Color::GRAY, 320, 430, Gosu::Color::GRAY)    
    
    @ball.draw
    @paddle1.draw
    @paddle2.draw

    @font.draw("Player 1: #{@p1score}", 30, 440, 1)
    @font.draw("Player 2: #{@p2score}", 470 , 440, 1)

  end
end

window = GameWindow.new
window.show