require './lib/alg/game_properties'

class TextUI
  
  def self.read_game_properties
    game = GameProperties.new(read_integer("Board size: "))
    wall_count = read_integer("Enter the number of walls: ")
    for i in 1 .. wall_count
      game.add_wall(read_position("Enter Wall " + i.to_s + " position: "))
    end
    game.initial_robot_position = read_position("Enter robot position: ")
    game.initial_box_position = read_position("Enter box position: ")
    game.goal_position = read_position("Enter goal position: ")
    return game
  end
  
  def self.render_path(path)
    path.each {|el| print el.key + "\n"}
  end
  
  def self.render_message(message)
    print message + "\n"
  end
  
  def self.read_position(message)
    print message
    if ints = /^(\d+)\s+(\d+)\n$/.match(gets)
      return Position.new(ints[1].to_i, ints[2].to_i)
    end
    # Should do something here
    raise Exception
  end
  
  def self.read_integer(message)
    print message
    if int = /^(\d+)\n$/.match(gets)
      return int[1].to_i
    end
    # Should do something here
    raise Exception
  end
  
end