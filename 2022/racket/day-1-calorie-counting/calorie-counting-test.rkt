#lang racket/base
 
(require rackunit
         "calorie-counting.rkt")

(check-equal?
 (elf-with-most-calories "./example_input.txt") 24000
 "It finds the elf with the most calories in inventory")

(check-equal?
 (top-three-elves-calories "./example_input.txt") 24000
 "It finds the top three elves with most calories in inventory")
