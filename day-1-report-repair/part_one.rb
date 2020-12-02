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
