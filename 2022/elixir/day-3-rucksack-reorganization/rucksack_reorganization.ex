defmodule RucksackReorganization do
  @moduledoc false

  @doc """
    Part one:
  """
  def sum_priority(path \\ "./puzzle_input.txt") do
    rucksacks = parse(path)
    IO.inspect(rucksacks)
    0
  end

  defp parse(path) do
    rucksack = File.read!(path)

    String.split(rucksack, "\n")
  end
end
