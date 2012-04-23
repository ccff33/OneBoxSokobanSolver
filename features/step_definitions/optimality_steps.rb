Given /^I have the following input:$/ do |input|
  @game = GamePropertiesParser.parse(input)
end

Given /^I run AStarSearch$/ do
  graph = StateGraph.new(@game)
  start = State.new(@game.initial_robot_position, @game.initial_box_position)
  goals = graph.neighbours_of State.new(@game.goal_position, @game.goal_position)
  
  graph.add_node(start)
  
  search_algorithm = AStarSearch.new
  search_algorithm.graph = graph
  search_algorithm.start = start
  search_algorithm.goals = goals
  
  @path = search_algorithm.search
end

Then /^the robot should make (\d+) steps$/ do |steps|
  @path.size.should == steps.to_i + 1
end
