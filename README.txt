Created in response to an assignment from The Odin Project:
https://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms?ref=lnav

————————————————————————————————————————————————————————————————

binary_tree.rb uses sorted data (taken as an array) to generate the tree

binary_tree_refactor.rb generates a tree from unsorted data (taken as an array), using the first element as the root node’s value, and sorting as it builds from there.

binary_tree_test.rb crawls through the tree and prints out the directions it moves and the value of the current node it is on

binary_tree_refactor_test.rb generates 1000 random numbers in range of 1 - 1000, and uses binary_tree_refactor to build the tree.  It then selects a random number within the range of 1 - 1000 and performs 3 searches - BFS, DFS (uses a mock-stack array), and DFS (uses recursive calls) for that number. Each returns the node object that contains that number (the node’s ‘value’) or nil/false.