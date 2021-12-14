defmodule Dive do
  def parse_puzzle_input do
    {:ok, report} = File.read("./puzzle_input.txt")
    report
  end
end
