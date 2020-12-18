cypher = File.read('puzzle_input.txt').split(/\n/)
i = 0
y = 0
invalid = 0
contiguous = 0
contiguous_set = nil
contiguous_total = 0

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
    invalid = sum_property.to_i
    break
  end
  i += 1
end

while y < cypher.size
  contiguous_total += cypher[y].to_i

  if contiguous_total == invalid
    contiguous_set = contiguous..y
    break
  elsif contiguous_total > invalid
    contiguous += 1
    contiguous_total = 0
    y = contiguous
    next
  end
  y += 1
end

weakness = Array(contiguous_set).map { |s| cypher[s].to_i }
p weakness.max + weakness.min