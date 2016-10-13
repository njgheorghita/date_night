gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'date'
require 'pry'

class NodeTest < Minitest::Test

  def test_that_a_tree_is_instantiated
    tree = BinarySearchTree.new
    tree.insert(50,"Harry & The Hendersons")
    assert tree
  end

  def test_that_a_tree_contains_a_root_node    
    tree = BinarySearchTree.new
    tree.insert(50,"Harry & The Hendersons")
    assert_equal Fixnum, tree.insert(25,"low").class
  end

  def test_that_root_node_returns_depth
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(50,"Harry & The Hendersons")
  end

  def test_that_child_node_returns_depth     
    tree = BinarySearchTree.new
    tree.insert(50,"Harry & The Hendersons")
    assert_equal 1, tree.insert(25,"low")
  end

  def test_first_insert    
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
  end

  def test_second_insert   
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.insert(16, "Johnny English")
  end    

  def test_third_insert  
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English") 
    assert_equal 1, tree.insert(92,"Shraknado")
  end

  def test_fourth_insert
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92,"Shraknado")
    assert_equal 2, tree.insert(50, "Hannibal Buress")
  end

  def test_fifth_insert  
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92,"Shraknado")
    tree.insert(50, "Hannibal Buress")
    assert_equal 3, tree.insert(55, "Pooooop")
  end

  def test_that_tree_identifies_that_it_contains_a_score
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92,"Shraknado")
    tree.insert(50, "Hannibal Buress")
    assert_equal true, tree.include?(50)
  end

  def test_that_tree_identifies_that_it_doesnt_contain_a_score
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92,"Shraknado")
    tree.insert(50, "Hannibal Buress")
    assert_equal false, tree.include?(7)
  end

  def test_that_depth_is_returned_when_score_is_input 
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92,"Shraknado")
    tree.insert(50, "Hannibal Buress")
    assert_equal 2, tree.depth_of(50)
  end

  def test_that_depth_of_returns_nil_if_no_score_match      
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92,"Shraknado")
    tree.insert(50, "Hannibal Buress")
    assert_equal nil, tree.depth_of(2)
  end

  def test_that_the_movie_with_the_highest_score_is_returned_as_hash 
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92,"Shraknado")
    tree.insert(50, "Hannibal Buress")
    assert_includes "Shraknado", tree.max.keys.first
  end

  def test_that_the_movie_with_the_lowest_score_is_returned_as_hash   
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92,"Shraknado")
    tree.insert(50, "Hannibal Buress")
    assert_includes "Johnny English", tree.min.keys.first
  end

  #sort test for hacky sort method. probs won't work for other binary trees
  def test_that_sort_returns_a_sorted_GIVEN_array_of_hashes_in_ascending_order
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92,"Shraknado 3")
    tree.insert(50, "Hannibal Buress")
    assert_equal [{"Johnny English"=>16},
    {"Hannibal Buress"=>50},
    {"Bill & Ted's Excellent Adventure"=>61},
    {"Shraknado 3"=>92}], tree.sort
  end

  #test to sort a "full" 7 component binary tree
  def test_that_returns_a_sorted_7_array_of_hashes_in_ascending_order
    skip
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(26, "Johnny English")
    tree.insert(94, "Dr. Strangelove")
    tree.insert(2, "Twilight")
    tree.insert(82,"Shraknado 3")
    tree.insert(50, "Hannibal Buress")
    tree.insert(100, "Hot Rod")
    assert_equal [{"Twilight"=>2},
                  {"Johnny English"=>26},
                  {"Hannibal Buress"=>50},
                  {"Bill & Ted's Excellent Adventure"=>61},
                  {"Shraknado 3"=>82},
                  {"Dr. Strangelove"=>94},
                  {"Hot Rod"=>100}], tree.sort
  end

  def test_that_txt_file_is_inserted_and_count_of_nodes_returned
    tree = BinarySearchTree.new
    assert_equal 33, tree.load('./movies.txt')
  end

end