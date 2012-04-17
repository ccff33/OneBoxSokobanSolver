require './lib/alg/state_graph'
require 'priority_queue'

class AStarSearch
  
  attr_accessor :graph, :start, :goals
  
  def search
    open_set = PriorityQueue.new
    closed_set = Array.new
    
    start.cost_from_start = 0
    start.estimated_rest_cost = estimate_cost_over_all_goals_from start
    start.parent_in_path = nil
    
    open_set.push(start, start.f)
    
    while !open_set.empty?
      node = open_set.delete_min_return_key
      if goals.include? node
        return path_to(node)
      end
      
      neighbours = graph.neighbours_of(node)
      
      neighbours.each do |ni|
        is_open = open_set.include?(ni)
        is_closed = closed_set.include?(ni)
        cost_from_start = node.cost_from_start + 1
        if (!is_open && !is_closed) || cost_from_start < ni.cost_from_start
          ni.parent_in_path = node
          ni.cost_from_start = cost_from_start
          ni.estimated_rest_cost = estimate_cost_over_all_goals_from ni
          if is_closed
            closed_set.delete(ni)
          end
          if !is_open
            open_set.push(ni, ni.f)
          end
        end
      end
      closed_set << node
    end
    return nil
  end
  
  private
  # For the search we use heuristic over all goal states h = g:goals min (node.HeuristicEstimateTo g))
  def estimate_cost_over_all_goals_from(node)
    estimates = Array.new
    goals.each do |goal|
      estimates << node.estimate_cost_to(goal)
    end
    return estimates.min
  end
  
  def path_to(node)
    nodes = Array.new
    while nil != node
      nodes.unshift(node)
      node = node.parent_in_path
    end
    return nodes
  end
  
end