output_joltage = File.read('puzzle_input.txt').split(/\n/).map(&:to_i)
device_joltage = output_joltage.max + 3
outlet = 0
i = 0
one_jolt = 0
three_jolt = 0

output_joltage.sort!
output_joltage.prepend(outlet)
output_joltage.append(device_joltage)

while i < output_joltage.size - 1
  difference = output_joltage[i + 1] - output_joltage[i]

  if  difference == 1
    one_jolt += 1
  elsif difference == 3
    three_jolt += 1
  end
  i += 1
end

p one_jolt * three_jolt
