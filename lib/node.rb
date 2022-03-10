# frozen_string_literal: true

# Node class creates nodes for our BST
class Node 
  attr_accessor :data, :left, :right

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end