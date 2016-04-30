
class Paddle
  attr_reader :verts, :px, :py, :width, :height

  def initialize(window, x, y)
    @px = x
    @py = y

    @height = 100
    @width = 25

    @vx = 0.0
    @vy = 0.0

    @window = window

    @move_speed = 5
  end

  def verts
    [[@px, @py],
     [@px + @width, @py],
     [@px + @width, @py + @height],
     [@px, @py + @height]
    ]
  end

  def move_up
    @py -= @move_speed unless @py == 50 
  end

  def move_down
    @py += @move_speed unless @py + @height == 430
  end

  def draw
    Gosu::draw_rect(@px, @py, @width, @height, Gosu::Color::WHITE)
  end
end