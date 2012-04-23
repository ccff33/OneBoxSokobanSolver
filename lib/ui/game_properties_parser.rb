require_relative '../alg/position.rb'
require_relative '../alg/game_properties.rb'

class GamePropertiesParser
  
  def self.parse(f)
    game_properties = GameProperties.new
    i = 0
      f.each_line do |ln|
        input = ln.gsub(/\s+/, '')
        if input.include?('R')
          game_properties.initial_robot_position = Position.new(i, input.index('R'))
        end
        
        if input.include?('B')
          game_properties.initial_box_position = Position.new(i, input.index('B'))
        end
        
        if input.include?('G')
          game_properties.goal_position = Position.new(i, input.index('G'))
        end
        
        while input.include?('W')
          game_properties.add_wall(Position.new(i, input.index('W')))
          input[input.index('W')] = '-'
        end
        i += 1
      end
      game_properties.size = i
    return game_properties
  end
  
end
