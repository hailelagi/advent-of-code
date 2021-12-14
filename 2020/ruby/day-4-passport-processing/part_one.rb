batch_file = File.read('puzzle_input.txt').split(/\n\n/)

fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
valid = 0

for input in batch_file
  passport_check = fields.map { |field| /#{field}/.match?(input) }
  valid += 1 if passport_check.reduce(:&)
end

p valid
