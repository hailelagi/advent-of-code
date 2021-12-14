defmodule SonarSweep do
  def parse_puzzle_input do
    {:ok, report} = File.read("./puzzle_input.txt")
    report
  end

  def depth_increase do
    IO.puts parse_puzzle_input()
  end
end
