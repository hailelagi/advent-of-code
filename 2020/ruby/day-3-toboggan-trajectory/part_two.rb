map_input = File.read('puzzle_input.txt').split(/\n/)
depth = map_input.size
curr_depth = 1
down_two = 2

right_three = 0
right_five = 0
right_seven = 0
right_one = 0

slope_1_1 = 0
slope_3_1 = 0
slope_5_1 = 0
slope_7_1 = 0
slope_1_2 = 0

while curr_depth < depth
  map_one = map_input[curr_depth]
  map_two = map_input[down_two]

  right_one = (right_one + 1) % map_one.size
  right_three = (right_three + 3) % map_one.size
  right_five = (right_five + 5) % map_one.size
  right_seven = (right_seven + 7) % map_one.size

  slope_1_1 += 1 if map_one[right_one] == "#"
  slope_3_1 += 1 if map_one[right_three] == "#"
  slope_5_1 += 1 if map_one[right_five] == "#"
  slope_7_1 += 1 if map_one[right_seven] == "#"
  if map_two
    slope_1_2 += 1 if map_two[right_one] == "#"
  end

  curr_depth += 1
  down_two += 2
end

trees = slope_1_1 * slope_3_1 * slope_5_1 * slope_7_1 * slope_1_2
puts trees
