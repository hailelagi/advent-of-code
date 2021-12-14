boot_code = File.read('puzzle_input.txt').split(/\n/)

accumulator = 0
i = 0
scan = true

processed = []
nopes = []
jumps = []

nope_index = nil
jump_index = nil

while i < boot_code.size
  op, arg = boot_code[i].split(" ")

  if processed.include?(i)
    # reset
    processed = []
    i = 0
    accumulator = 0
    scan = false

    if nopes.size > 0
      nope_index = nopes.pop

    elsif jumps.size > 0
      jump_index = jumps.pop
      nope_index = nil
    end
    next
  end

  processed.append(i)
  case op
  when "nop"
    if i == nope_index
      i += arg.to_i
    else
      nopes.push(i) if scan
      i += 1
    end
  when "acc"
    accumulator += arg.to_i
    i += 1
  when "jmp"
    if i == jump_index
      i += 1
    else
      jumps.push(i) if scan
      i += arg.to_i
    end
  end
end

p accumulator