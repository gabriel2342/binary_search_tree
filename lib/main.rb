require_relative 'tree'

tree = Tree.new((Array.new(15) { rand(1..100) }))
tree.pretty_print
puts "Is the tree balanced? #{tree.balanced?}\n\n"
puts "Level order traversal: #{tree.level_order}\n"
puts "Pre order traversal: #{tree.preorder}\n"
puts "In order traversal: #{tree.inorder}"
puts "Post order traversal: #{tree.postorder}\n\n"
puts "Unbalancing your tree..."
sleep(3)
tree.insert(101)
tree.insert(102)
tree.insert(103)
tree.insert(104)
tree.insert(105)
tree.insert(106)
tree.pretty_print
puts "Is the tree balanced? #{tree.balanced?}\n\n"
puts"Rebalanncing your tree...\n\n"
sleep(3)
tree.rebalance
tree.pretty_print
puts "Is the tree balanced? #{tree.balanced?}\n\n"
puts "Level order traversal: #{tree.level_order}\n"
puts "Pre order traversal: #{tree.preorder}\n"
puts "In order traversal: #{tree.inorder}"
puts "Post order traversal: #{tree.postorder}"


