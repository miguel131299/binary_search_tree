require_relative 'node.rb'
require_relative 'binary_tree.rb'

tree = BinaryTree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

(1..10).each do |i|
    tree.insert(rand(0..100))
end

puts tree.pretty_print