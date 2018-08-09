def sorted_build_tree(data, parent_node = nil)
	if data.length >= 1
		start = (data.length)/2
		current_node = Node.new(data[start], parent_node)
		current_node.lh_child = sorted_build_tree(data.slice(0, start), current_node)
		current_node.rh_child = sorted_build_tree(data.slice(start + 1, data.length - (start + 1)), current_node)
		return current_node
	else
		return nil
	end
end

class Node
	attr_accessor :value, :parent, :lh_child, :rh_child
	def initialize(value, parent)
		@value = value
		@parent = parent
	end
end