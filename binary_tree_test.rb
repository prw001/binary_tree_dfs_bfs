require './binary_tree.rb'

test_data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
root_node = sorted_build_tree(test_data)
puts root_node, root_node.value
puts root_node.lh_child, root_node.lh_child.value
puts root_node.rh_child, root_node.rh_child.value
current_node = root_node
while current_node.rh_child != nil
	puts "current_node: " + current_node.value.to_s + " left: " +
		current_node.lh_child.value.to_s + " right: " + current_node.rh_child.value.to_s
	current_node = current_node.rh_child
end
puts current_node, current_node.value, current_node.parent, current_node.parent.value