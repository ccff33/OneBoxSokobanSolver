class StateRenderer
  
  def self.render(game_properties, state)
    state_string = ''
    for i in (-1 .. game_properties.size)
      for j in (-1 .. game_properties.size)
        pos = Position.new(i, j)
        cell = ' - '
        if game_properties.is_wall?(pos)
          cell = ' W '
        elsif pos.eql?(state.robot)
          cell = ' R '
        elsif pos.eql?(state.box)
          cell = ' B '
        elsif pos.eql?(game_properties.goal_position)
          cell = ' G '
        end
        state_string += cell
      end
      state_string += "\n"
    end
    return state_string
  end
  
end