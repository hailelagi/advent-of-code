require 'set'
all_group_answers = File.read('puzzle_input.txt').split(/\n\n/)
questions_answered = 0

all_group_answers.each do |group|
  uniq_group = group.split("\n").map { |g| Set.new(g.split(""))}
  questions_answered += uniq_group.reduce(:&).size
end

p questions_answered