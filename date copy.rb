require 'pry'
require_relative 'node'


class BinarySearchTree

    attr_accessor :counter, :left, :right 
    
    def initialize(score,title)
        @score = score
        @title = title
        @counter = 0
        @left = nil
        @right = nil
    end

    def insert(score, title)
        binding.pry
        #if self.sort[0].keys == [nil]
            case @score <=> score
                when 1 then     insert_left(score, title)
                when -1 then    insert_right(score, title)
                when 0 then     false
            end
        @score = score
        @counter
    end

    def insert_left (score, title)
        @counter += 1
        if self.left
            left.insert(score, title)
        else
            self.left = Node.new(score, title, @counter)
        end
    end

    def insert_right(score, title) 
        @counter += 1  
        if right
            right.insert(score, title)
        else   
            self.right = Node.new(score, title, @counter)  
        end
    end
end

    # def inspect_one
    #     "{#{value}:#{left.inspect}|#{right.inspect}}"
    # end

    # def include?(val)
    #     case @value <=> val
    #         when 1 then     left.include?(val)
    #         when -1 then    right.include?(val)
    #         when 0 then     @counter
    #     end
    # end

    # def depth_of(val)
    #     include?(val)
    #     @counter
    # end

    # def max
    #     case @value <=> val
    #         when 1 then right.max(val)
    #         when -1 then @value
    #     end
    # end

    # def min
    #     case @value <=> val
    #     when -1 then left.min(val)
    #     when -1 then @value
    # end

    # def sort
    #     #map each key/value pair to a new hash
    #     #sorted by ascending score
    # end

    # def load
    #     #map each key/value pair to insert method
    # end
    


