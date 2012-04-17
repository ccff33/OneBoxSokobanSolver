require './lib/alg/state_graph'
require './lib/ui/text_ui'

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

# goal states
goals = graph.neighbours_of State.new(game.goal_position, game.goal_position)

goals.each {|el| print el.to_s + "\n"}

if (goals.empty?)
  TextUI.render_message("The game has no solution.")
  exit
end


