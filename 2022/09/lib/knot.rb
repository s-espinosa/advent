class Knot
  attr_reader :x,
              :y,
              :path

  def initialize(x = 0, y = 0)
    @x = x
    @y = y
    @path = ['0,0']
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

  def follow(head)
    move_to_head(head)
    document_move
  end

  def location
    "#{@x},#{@y}"
  end

  def locations
    @path.uniq
  end

  private

  def move_to_head(head)
    if head.x - @x >= 2
      @x += 1
      check_y(head)
    elsif @x - head.x >= 2
      @x -= 1
      check_y(head)
    elsif head.y - @y >= 2
      @y += 1
      check_x(head)
    elsif @y - head.y >= 2
      @y -= 1
      check_x(head)
    end
  end

  def check_x(head)
    if head.x - @x >= 1
      @x += 1
    elsif @x - head.x >= 1
      @x -= 1
    end
  end

  def check_y(head)
    if head.y - @y >= 1
      @y += 1
    elsif @y - head.y >= 1
      @y -= 1
    end
  end

  def document_move
    @path << location
  end
end
