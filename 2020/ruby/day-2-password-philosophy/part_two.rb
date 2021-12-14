passwords_input = File.read('puzzle_input.txt').split(/\n/)

valid = 0

for input in passwords_input
  /(\d+)-(\d+) (\w): (\w+)/.match(input)
  lowest, highest = $1.to_i - 1, $2.to_i - 1

  if $4[lowest] == $3 && $4[highest] == $3
    next
  elsif $4[lowest] == $3 || $4[highest] == $3
    valid += 1
  end
end


puts valid

# puts valid