class Position
  
  attr_accessor :i, :j
  
  def initialize(i, j)
    @i = i
    @j = j
  end
  
  def left
    Position.new(i, j - 1)
  end
  
  def right
    Position.new(i, j + 1)
  end
  
  def up
    Position.new(i - 1, j)
  end
  
  def down
    Position.new(i + 1, j)
  end
  
  def eql? other
    i == other.i && j == other.j
  end
  
  def hash
    0
  end
  
  # Minimal dist assuming no diagonal moves
  def dist_to other
    (other.i - i).abs + (other.j - j).abs
  end
  
end