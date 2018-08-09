require './binary_tree.rb'
$root = nil
def unsorted_build_tree(data, current_node = nil)
	if data.length >= 1
		value = data.shift
		unless current_node == nil
			insert_node(current_node, Node.new(value, nil))
			unsorted_build_tree(data, $root) #calls itself until data is empty
		else
			#initial case
			current_node = Node.new(value, nil)
			$root = current_node
			unsorted_build_tree(data, current_node)
		end
	else
		return nil
	end
end 

def insert_node(current_node, new_node)
	if new_node.value < current_node.value
		if current_node.lh_child == nil #new node will be a leaf on left
			current_node.lh_child = new_node
			new_node.parent = current_node
		else
			insert_node(current_node.lh_child, new_node)
			#continue down the left-hand tree branch
		end
	else
		if current_node.rh_child == nil #new node will be a leaf on right
			current_node.rh_child = new_node
			new_node.parent = current_node
		else
			insert_node(current_node.rh_child, new_node)
			#continue down the right-hand tree branch
		end
	end
end

def bfs(target, layer)
	count = 0
	next_layer = []
	layer.each do |node|
		if node.value == target
			puts "Found target at: "
			return node
		else
			if node.lh_child
				next_layer << node.lh_child
			end
			if node.rh_child
				next_layer << node.rh_child
			end
		end
	end
	if next_layer.length > 0 
		bfs(target, next_layer)
	else
		puts "Target not found."
		return nil
	end
end

def dfs(target, stack = [], visited = [])
	current_node = $root
	stack << current_node
	while stack.length > 0
		if current_node.value == target
			puts "Found target at: "
			return current_node
		else
			visited << current_node
			case 
			when current_node.lh_child && !(visited.include? current_node.lh_child)
				stack << current_node.lh_child
			when current_node.rh_child && !(visited.include? current_node.rh_child)
				stack << current_node.rh_child
			else
				stack.pop
			end
		end
		current_node = stack[-1]
	end
	puts "Target not found."
	return nil
end

def dfs_rec(target, current_node, found = [false, nil])
	if current_node.value == target
		found = ["Found target at: ", current_node]
	else
		if current_node.lh_child && found[0] == false
			found = dfs_rec(target, current_node.lh_child)
		end
		if current_node.rh_child && found[0] == false
			found = dfs_rec(target, current_node.rh_child)
		end
	end
	return found
end



