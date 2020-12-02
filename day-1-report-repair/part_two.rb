puzzle_entries = File.read('puzzle_input.txt').split(' ').map(&:to_i)

# omg it's so horrible :(
# don't look at my ugly code
# nooooooo!!!!!!!

def find_sum(entries)
  for e in entries
    for e_2 in entries
      for e_3 in entries
        if e + e_2 + e_3 == 2020
          return [e, e_2, e_3]
        end
      end
    end
  end
end

result = find_sum(puzzle_entries)
p result[0] * result[1] * result[2]