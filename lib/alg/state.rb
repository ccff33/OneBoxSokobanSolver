require_relative 'position'

# Represents Game state : (robotPosition, boxPosition)
class State
  
  attr_accessor :robot, :box, :cost_from_start, :estimated_rest_cost, :parent_in_path
  
  def initialize(robot, box)
    @robot = robot
    @box = box
  end
  
  # Unique key for a game state
  def key
    robot.i.to_s + robot.j.to_s + box.i.to_s + box.j.to_s
  end
  
  # Estimates the cost from the current state to node
  # Use the heuristic d(B, node.B)
  def estimate_cost_to(node)
    box.dist_to(node.box)
  end
  
  # f(n) = g(n) + h(n)
  def f
    cost_from_start + estimated_rest_cost
  end
  
end