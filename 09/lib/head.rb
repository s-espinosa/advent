class Head
  attr_reader :x,
              :y

  def initialize(x = 0, y = 0)
    @x = x
    @y = y
  end

  def move(direction)
    case direction
    when 'R'
      @x += 1
    when 'L'
      @x -= 1
    when 'U'
      @y += 1
    when 'D'
      @y -= 1
    end
  end

  def location
    "#{@x},#{@y}"
  end
end
