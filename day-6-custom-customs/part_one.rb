require 'set'
all_group_answers = File.read('puzzle_input.txt').split(/\n\n/)

questions = all_group_answers.map { |group| Set.new(group.split("\n").join().split("")).size}
p questions.sum