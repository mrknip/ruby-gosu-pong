class Ball
  def initialize(window)
    @px = 400
    @py = 100

    @height = 10
    @width = 10

    @vx = -2.0
    @vy = 2.0

    @window = window

    @move_speed = 2
  end

  def move
    @px += @vx
    @py += @vy
  end

  def draw
    Gosu::draw_rect(@px, @py, @width, @height, Gosu::Color::WHITE)
  end
end