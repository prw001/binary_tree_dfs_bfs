require './binary_tree_refactor.rb'

rand_data = []
1000.times do 
	rand_data << rand(1..1000)
end

data_length = rand_data.length
visited = []
unsorted_build_tree(rand_data)

puts "Root Value: " + $root.value.to_s
current_node = $root
visited << current_node
while visited.length < data_length
	#sections commented out are for tracing the crawler's path through
	#the tree.
	if current_node.lh_child != nil && !(visited.include? current_node.lh_child)
		#puts "left"
		current_node = current_node.lh_child
		visited << current_node
		#puts current_node.value.to_s
	elsif current_node.rh_child != nil && !(visited.include? current_node.rh_child)
		#puts "right"
		current_node = current_node.rh_child
		visited << current_node
		#puts current_node.value.to_s
	else
		current_node = current_node.parent	
		#puts "up"
	end
end

#shows the general 'clustering' of the tree, and that it is
#relatively sorted when finished building
output = ''
visited.each do |node|
	output += node.value.to_s + ", "
end
puts output

#Search tests
target = rand(1..1000)
puts "Target: " + target.to_s
puts bfs(target, [$root])
puts dfs(target)
puts dfs_rec(target, $root)