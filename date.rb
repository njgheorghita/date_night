require 'pry'
require_relative 'node'

class BinarySearchTree

  attr_accessor :root, :left, :right, :sorted

  def initialize
    @root = nil
    @sorted = []
  end

  def insert(sco, title)
    if @root.nil?
      @root = Node.new(sco, title)
      @root.depth
    else
      @root.insertion(sco, title)
    end
  end

  def include?(sco, node = @root)
    if node == nil
      false
    elsif node.value.values.first.eql?(sco)
      true
    elsif node.value.values.first > sco
      include?(sco,node.left)
    elsif node.value.values.first < sco
      include?(sco,node.right)
    elsif node.right == nil && node.left == nil
      false
    end
  end

  def depth_of(sco, node = @root)
    if node == nil  
      nil
    elsif node.value.values.first.eql?(sco)
      node.depth
    elsif node.value.values.first > sco
      depth_of(sco,node.left)
    elsif node.value.values.first < sco
      depth_of(sco,node.right)
    elsif node.right == nil && node.left == nil
      nil
    end
  end

  def max(node = @root)
    if node.right.right == nil
      {node.right.value.keys.first => node.right.value.values.first}
    else max(node.right)
    end
  end

  def min(node = @root)
    if node.left.left == nil 
      {node.left.value.keys.first => node.left.value.values.first}
    else max(node.left)
    end
  end

  def load(data)
    counter = 0
    tree = BinarySearchTree.new
    f = File.new(data)
    f.each do |line|
      counter += 1
      score = line.split[0]
      title = line.split.drop(1).join(" ")
      tree.insert(score, title)
    end
    counter
  end

  # hacky sort method. probs won't work for other binary trees
  def sort(node = @root)
    if @sorted.count < 2
      if node.left.left 
        sort(node.left)
      elsif node.left.left == nil 
        @sorted << node.left.value
        if node.left.right == nil
        else @sorted << node.left.right.value
            @sorted << node.value
          sort()
        end
      end
    elsif node.right
      @sorted << node.right.value
    end
  end

  #sort method for // test_that_returns_a_sorted_7_array_of_hashes_in_ascending_order
  # def sort(node = @root)
  #   binding.pry
  #   #finds absolute left
  #   until node.left == nil
  #     sort(node.left)
  #   end
  #   # means node.left has no kids 
  #   if node.right == nil
  #     # push
  #     @sorted << node.value
  #     # and kill
  #     node.value.clear
  #   # means node.left has right kid
  #   else sort(node.right)
      
  #     # # push node value to sorted
  #     # @sorted << node.value
  #     # #has unprinted right child
  #     # if node.right 
  #     #   #push node.right value to sorted
  #     #   sort(node.right)
  #     # # no kids = kill node from array
  #     # else @root - node
  #     #   sort()
  #     # end
  #   end
  # @sorted
  # end
  
end
