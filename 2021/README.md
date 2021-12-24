# AOC 2021
Might try a mixture of rust, elixir, racket and go this year!
(maybe lol)

## Elixir

To run tests input the challenge's `name` in `snake_case` and interpolate into the following instruction when in the challenge's directory:

`$ elixir -r "./#{name}ex" #{name}_test.exs`

An example for day one(Sonar sweep) is:

`user@root:~$ elixir -r "./sonar_sweep.ex" sonar_sweep_test.exs`

I chose not to structure these challenges as a mix project, because they're one off utility scripts and I like the lighter setup.

## Rust

To run tests in the specific day's challenge directory:
`$ cargo test`


## Racket
Shelving this for now. I do want to learn a lisp at some point? But it's just not fun slogging through a thousand page text book :(
