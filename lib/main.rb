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

# creates the balnlced binary tree
class Tree
  attr_reader :root

  def initialize(array)
    @root = build_tree(array.sort.uniq)
  end

  def build_tree(array)
    return if array.empty?

    return Node.new(array[0]) if array.length < 2

    mid = array.size / 2
    root = Node.new(array[mid])
    root.left = build_tree(array[0...mid])
    root.right = build_tree(array[mid + 1..-1])
    root
  end


  def insert(value, node = @root)
    return Node.new(value) if node.nil?

    if value < node.data
      node.left = insert(value, node.left)
    else
      node.right = insert(value, node.right)
    end
    node
  end


  def delete(value, node = @root)
    return if node.nil?
  
    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else      
      return node.right if node.left.nil? 
      return node.left if node.right.nil?
      next_min_node = find_next_min(node.right)
      node.data = next_min_node.data
      node.right = delete(next_min_node.data, node.right)
    end
    node
  end

  def find_next_min(node)
    node = node.left until node.left.nil?
    node
  end

  def find(value, node = @root)
    return node if node.data == value || node.nil?
    if value < node.data
      find(value, node.left)
    else
      find(value, node.right)
    end
  end

  def level_order
    result = []
    queue = [@root]
    
    until queue.empty?
      node = queue.shift
      queue.push(node.left) unless node.left.nil?
      queue.push(node.right) unless node.right.nil?
      block_given? ? yield(node) : result.push(node.data)
    end
    
    result unless block_given?
  end

  def preorder(node = @root, result = [])
    return result if node.nil?
    block_given? ? yield(node) : result.push(node.data)
    result = preorder(node.left, result)
    result = preorder(node.right, result)
    result unless block_given?
  end

  def inorder(node = @root, result = [])
    return result if node.nil?
    result = inorder(node.left, result)
    block_given? ? yield(node) : result.push(node.data)
    result = inorder(node.right, result)
    result unless block_given?
  end

  def postorder(node = @root, result = [])
    return result if node.nil?
    result = postorder(node.left, result)
    result = postorder(node.right, result)
    block_given? ? yield(node) : result.push(node.data)
    result unless block_given?
  end

  def height(value)
    node = find(value)
    left_height = 0
    right_height = 0

    until node.left.nil? && node.right.nil?
      node = node.left
      left_height +=1
    end

    until node.left.nil? && node.right.nil?
      node = node.right
      right_height +=1
    end
    
    [left_height, right_height].max + 1
  
    end


  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

tree = Tree.new([1, 2, 3, 4, 5, 6, 7, 9, 12])
tree.pretty_print
tree.insert(8)
tree.pretty_print
tree.delete(8)
tree.pretty_print
p tree.find(12)
p tree.level_order
p tree.preorder
p tree.inorder
p tree.postorder
p tree.height(2)