# frozen_string_literal: true

# Node class creates nodes for our BST
class Node
  attr_accessor :data, :left_node, :right_node

  def initialize(data = nil, left = nil, right = nil)
    self.data = data
    self.left = left
    self.right = right
  end
end

# creates the balnlced binary tree
class Tree
  attr_accessor :root

  def initialize(array)
    self.root = build_tree(array.sort.uniq)
  end

  def build_tree(array)
    return if array.empty?

    mid = array.size / 2
    root = Node.new(array[mid])
    left = build_tree(array.take(mid))
    right = build_tree(array.drop(mid))
    root.left = left
    root.right = right
    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

tree = Tree.new(Array.new(15) { rand(1..100) })
tree.pretty_print