batch_file = File.read('puzzle_input.txt').split(/\n\n/)

fields = %w[byr iyr eyr hgt hcl ecl pid]
valid = 0

for input in batch_file
  passport_check = fields.map { |field| /#{field}/.match?(input) }
  passport = {}

  if passport_check.reduce(:&)
    input.split(/\s/).each { |raw_field|
      pass = raw_field.split(":")
      passport[pass[0]] = pass[1]
    }
    # validation
    birth = passport["byr"].to_i
    issue = passport["iyr"].to_i
    expiration = passport["eyr"].to_i

    is_byr = (birth >= 1920) && (birth <= 2002)
    is_iyr = (issue >= 2010) && (issue <= 2020)
    is_eyr = (expiration >= 2020) && (expiration <= 2030)

    /(\d+)([a-z]+)/.match(passport["hgt"])
    height = $1.to_i
    is_hgt = case $2
    when "cm"
      (height >= 150 and height <= 193)
    when "in"
      (height >= 59 and height <= 76)
    else
      false
    end
    is_hcl = /#[0-9a-f]{6}/.match?(passport["hcl"])
    is_ecl = %w[amb blu brn gry grn hzl oth].include?(passport["ecl"])
    is_pid = /^\d{9}$/.match?(passport["pid"])

    if is_byr && is_iyr && is_eyr && is_hgt && is_hcl && is_ecl && is_pid
      valid += 1
    end
  end
end

puts valid