class Ball
  def initialize(window)
    @px = 320
    @py = 240

    @height = 10
    @width = 10


    @window = window

    @move_speed = 3
    @vx = (0 - @move_speed)
    @vy = @move_speed

    @vx *= -1 if ((rand(9)) >= 4)
  end

  def move
    bounce_paddle
    bounce_wall
    @px += @vx
    @py += @vy
  end

  def draw
    Gosu::draw_rect(@px, @py, @width, @height, Gosu::Color::WHITE)
  end

  def bounce_paddle
    paddles = @window.paddles

    paddles.each do |paddle|
      if  ((@px <= (paddle.px + paddle.width)) && ((@px + @width) >= paddle.px)) &&
          ((@py >= paddle.py) && ((@py + @height) <= (paddle.py + paddle.height)))
        # an attempted bugfix for collisions at end of panel.  Only works if paddle stationary.
        # if paddle.py - @py <= 5 || (paddle.py + paddle.height) - (@py + @height) >= 5
          @vx *= -1 
        # else
        #   @vy *= -1
        # end
      end
    end
  end

  def goal?
    return :player2 if @px < 30 
    return :player1 if @px + @width > 610
    false
  end


  def bounce_wall
    @vy *= -1 if (@py + @height) >= 430 || @py <= 50
  end
end