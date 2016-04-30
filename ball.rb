class Ball
  def initialize(window)
    @px = 400
    @py = 150

    @height = 10
    @width = 10


    @window = window

    @move_speed = 5
    @vx = (0 - @move_speed)
    @vy = @move_speed
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
    paddle = @window.paddle

    if @px <= (paddle.px + paddle.width) # && (@py <= paddle.py && ((@py + @height) >= (paddle.py + paddle.height)))
      @vx *= -1
    end
  end

  def bounce_wall
    if (@py + @height) >= 430 || @py <= 50
      @vy *= -1
    elsif @px + @width >= 610 || @px <= 50
      @vx *= -1
    end
  end
end