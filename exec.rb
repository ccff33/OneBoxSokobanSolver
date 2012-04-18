require './lib/alg/state_graph'
require './lib/alg/a_star_search'
require './lib/ui/text_ui'
require './lib/ui/state_renderer'

output_file_name = 'output'

# get user input for box, robot, wall positions
game = TextUI.read_game_properties

# initialize graph with game properties
graph = StateGraph.new(game)

# initial state
start = State.new(game.initial_robot_position, game.initial_box_position)

if (!game.is_valid_state?(start))
  TextUI.render_message("Wrong initial state.")
  exit
end

graph.add_node(start)

# goal states
goals = graph.neighbours_of State.new(game.goal_position, game.goal_position)

if (goals.empty?)
  TextUI.render_message("The game has no solution.")
  exit
end

search_algorithm = AStarSearch.new
search_algorithm.start = start
search_algorithm.goals = goals
search_algorithm.graph = graph

path = search_algorithm.search

if nil == path
  TextUI.render_message("No path found.")
  exit
end

TextUI.render_path_actions(path)

TextUI.render_path_to_file(output_file_name, game, path)


