require_relative 'state'
require_relative 'game_properties'

class StateGraph
  
  def initialize(game_properties)
    @game_properties = game_properties
    @nodes = Hash.new
  end
  
  def add_node(node)
    @nodes[node.key] = node
  end
  
  def add_node?(node)
    if has_node?(node)
      @nodes[node.key]
    else
      add_node(node)
    end
  end
  
  def has_node?(node)
    @nodes.has_key?(node.key)
  end
  
  # Generates the neighbours of a node and adds them to the graph
  def neighbours_of(node)
    neighbours = Array.new
    states = [left_of(node), right_of(node), up_of(node), down_of(node)]
    for state in states
      neighbours << add_node?(state) if @game_properties.is_valid_state?(state)
    end
    return neighbours
  end
  
  # TODO remove code duplication
  private
  
  def left_of(node)
    if !node.robot.left.eql?(node.box)
      State.new(node.robot.left, node.box)
    else
      State.new(node.robot.left, node.box.left)
    end
  end
  
  def right_of(node)
    if !node.robot.right.eql?(node.box)
      State.new(node.robot.right, node.box)
    else
      State.new(node.robot.right, node.box.right)
    end
  end
  
  def up_of(node)
    if !node.robot.up.eql?(node.box)
      State.new(node.robot.up, node.box)
    else
      State.new(node.robot.up, node.box.up)
    end
  end
  
  def down_of(node)
    if !node.robot.down.eql?(node.box)
      State.new(node.robot.down, node.box)
    else
      State.new(node.robot.down, node.box.down)
    end
  end
  
end