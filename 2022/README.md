# AOC 2022

## Elixir

Like last year, these are structured as small light weight scripts.
To run tests input the challenge's `name` in `snake_case` and interpolate into the following instruction when in the challenge's directory:

`$ elixir -r "./#{name}.ex" #{name}_test.exs`

An example for day one - Calorie Counting is:

`user@root:~$ elixir -r "./calorie_counting.ex" calorie_counting_test.exs`

## Rust

Regular cargo project per day. `cargo test`

## Go

`go test calorie_counting.go`

These files require a setup of [Dr racket](https://docs.racket-lang.org/drracket/) or an installation of `#lang racket/base` with `rackunit`
