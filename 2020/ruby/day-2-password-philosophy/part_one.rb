passwords_input = File.read('puzzle_input.txt').split(/\n/)

valid = 0

for input in passwords_input
  /(\d+)-(\d+) (\w): (\w+)/.match(input)
  lowest, highest = $1.to_i, $2.to_i
  chars = $4.scan(/#{$3}/).size

  valid += 1 if (chars >= lowest and chars <= highest)
end

puts valid
