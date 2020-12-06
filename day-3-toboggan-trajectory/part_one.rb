map_input = File.read('puzzle_input.txt').split(/\n/)
depth = map_input.size
curr_depth = 1
square = 0
trees = 0

while curr_depth < depth
  map = map_input[curr_depth]
  square = (square + 3) % map.size

  trees += 1 if map[square] == "#"
  curr_depth += 1
end

puts trees