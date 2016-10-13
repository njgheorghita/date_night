class Node

  attr_reader :title, :left, :right, :value
  attr_accessor :depth, :score

  def initialize(score = 0, title = 0)
    @value = { title => score } 
    @left = left
    @right = right
    @depth = 0
  end

  def insertion(sco, title)
    case  @value.values.first <=> sco
      when 1 then insert_left(sco, title)
      when -1 then insert_right(sco, title)
      when 0 then false
    end
  end

  def insert_left(sco, title)
    if @left    
      @left.insertion(sco, title)
    else
      @left = Node.new(sco, title)
      @left.depth = depth + 1
    end
  end

  def insert_right(sco, title)
    if @right   
      @right.insertion(sco,title)
    else
      @right = Node.new(sco, title)
      @right.depth = depth + 1
    end
  end
end
