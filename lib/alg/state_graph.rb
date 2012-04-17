require './lib/alg/state'

class StateGraph
  
  def initialize
    @nodes = Hash.new
  end
  
  def add_node(node)
    @nodes[node.key] = node
  end
  
  def has_node?(node)
    @nodes.has_key?(node.key)
  end
  
end