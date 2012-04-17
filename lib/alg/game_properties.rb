require './lib/alg/state'

# Keeps some initial properties
class GameProperties
  
  attr_accessor :initial_robot_position, :initial_box_position, :goal_position
  attr_reader :size
  
  def initialize(size)
    @size = size
    @walls = Hash.new
    add_bordering_walls
  end
  
  def add_wall(position)
    @walls[position] = 0
  end
  
  def is_valid_state?(state)
    !is_wall?(state.robot) && !is_wall?(state.box) && !state.robot.eql?(state.box)
  end
  
  private
  def is_wall?(position)
    @walls.include?(position)
  end
  
  def add_bordering_walls
    for i in (0 .. size - 1)
      add_wall Position.new(-1, i)
      add_wall Position.new(i, -1)
      add_wall Position.new(size, i)
      add_wall Position.new(i, size)
    end
  end
  
end