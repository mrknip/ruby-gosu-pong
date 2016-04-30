
class Paddle
  def initialize(window)
    @px = 50
    @py = 100

    @height = 200
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
    @py -= @move_speed
  end

  def move_down
    @py += @move_speed
  end


  def draw
    Gosu::draw_rect(@px, @py, @width, @height, Gosu::Color::WHITE)
    #draw rect in the position
  end
end