defmodule RucksackReorganization do
  @moduledoc false

  @doc """
    Part one: Find the sum of priority of items in both compartments
  """
  def sum_priority(path \\ "./puzzle_input.txt") do
    rucksacks = parse(path)

    for rucksack <- rucksacks do
      l = div(String.length(rucksack), 2)

      [first, second] =
        String.split_at(rucksack, l)
        |> Tuple.to_list()
        |> Enum.map(&String.split(&1, ""))
        |> Enum.map(&MapSet.new/1)

      [_, <<item_codepoint::utf8>>] = MapSet.intersection(first, second) |> MapSet.to_list()

      item_codepoint
    end
    |> Enum.map(&codepoint_to_priority/1)
    |> Enum.sum()
  end

  defp codepoint_to_priority(c) do
    cond do
      c in 97..122 -> c - 96
      c in 65..90 -> c - 38
    end
  end

  defp parse(path) do
    rucksack = File.read!(path)

    String.split(rucksack, "\n")
  end
end

IO.inspect(RucksackReorganization.sum_priority())
