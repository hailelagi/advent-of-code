cypher = File.read('puzzle_input.txt').split(/\n/)
i = 0

def find_sum_compliment?(entries, total)
  i = 0
  compliments = {}

  while i < entries.size
    num = entries[i]
    compliment = compliments[num]

    if compliment
      return true
    else
      compliments[total - num] = num
    end
    i += 1
  end
  return false
end

while i < cypher.size
  preamble = cypher[i, 25+i].map { |num| num.to_i }
  sum_property = cypher[25 + i].to_i

  if not find_sum_compliment?(preamble, sum_property)
    p sum_property
    break
  end
  i += 1
end

