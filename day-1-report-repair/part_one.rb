puzzle_entries = File.read('puzzle_input.txt').split(' ').map(&:to_i)

def find_sum(entries)
  entry_index = 0

  while entry_index < entries.size
    entries.each do |e|
      if entries[entry_index] + e == 2020 && entries[entry_index] != e
        return [entries[entry_index], e]
      end
    end
    entry_index += 1
  end
end

result = find_sum(puzzle_entries)
p result[0] * result[1]

################
# REFACTOR #####
################

def find_sum_compliment(entries)
  i = 0
  compliments = {}

  while i < entries.size
    num = entries[i]
    compliment = compliments[num]

    if compliment
      return num * compliment
    else
      compliments[2020 - num] = num
    end
    i += 1
  end
end

p find_sum_compliment(puzzle_entries)