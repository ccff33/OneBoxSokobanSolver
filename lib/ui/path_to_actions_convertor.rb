class PathToActionsConvertor
  
  include Enumerable
  
  def initialize(path)
    @path = path
  end
  
  def each
    @path.each_cons(2) do |pair|
      yield action(pair)
    end
  end
  
  def action(pair)
    if pair[1].robot.eql? pair[0].robot.left
      if pair[1].box.eql? pair[0].box.left
        return "Push Left"
      end
      return "Move Left"
    end
    if pair[1].robot.eql? pair[0].robot.right
      if pair[1].box.eql? pair[0].box.right
        return "Push Right"
      end
      return "Move Right"
    end
    if pair[1].robot.eql? pair[0].robot.up
      if pair[1].box.eql? pair[0].box.up
        return "Push Up"
      end
      return "Move Up"
    end
    if pair[1].robot.eql? pair[0].robot.down
      if pair[1].box.eql? pair[0].box.down
        return "Push Down"
      end
      return "Move Down"
    end
    return "Unknown"
  end
  
end