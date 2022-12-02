defmodule RockPaperScissors do
  @moduledoc false

  def total_score(path \\ "./puzzle_input.txt") do
    strategy = parse(path)
    IO.inspect(strategy)

    0
  end

  defp parse(path) do
    strategy_guide = File.read!(path)

    String.split(strategy_guide, "\n")
  end
end
