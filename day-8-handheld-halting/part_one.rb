boot_code = File.read('puzzle_input.txt').split(/\n/)

accumulator = 0
i = 0
processed = []

while i < boot_code.size
  op, arg = boot_code[i].split(" ")
  if processed.include?(i)
    p accumulator
    break
  end

  processed.append(i)
  case op
  when "nop"
    i += 1
  when "acc"
    accumulator += arg.to_i
    i += 1
  when "jmp"
    i += arg.to_i
  end
end
