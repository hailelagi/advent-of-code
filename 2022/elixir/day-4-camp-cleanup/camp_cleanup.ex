defmodule CampCleanup do
  @moduledoc false

  @doc """
    Part one: count how many assignment pairs does one range fully contain the other
  """
  def pairs_contain_count(path \\ "./puzzle_input.txt") do
    assignments = parse(path)

    Enum.count(assignments, fn [first, second] ->
      first = set_range(first)
      second = set_range(second)

      MapSet.subset?(first, second) or MapSet.subset?(second, first)
    end)
  end

  @doc """
    Part two: count assignment pairs do the ranges overlap
  """
  def overlap(path \\ "./puzzle_input.txt") do
    assignments = parse(path)

    Enum.count(assignments, fn [first, second] ->
      first = set_range(first)
      second = set_range(second)

      MapSet.intersection(first, second) |> Enum.empty?() == false
    end)
  end

  defp set_range(section) do
    [upper, lower] = String.split(section, "-") |> Enum.map(&String.to_integer/1)

    Range.new(upper, lower) |> MapSet.new()
  end

  defp parse(path) do
    section_assignments = File.read!(path)

    section_assignments
    |> String.split("\n")
    |> Enum.map(&String.split(&1, ","))
  end
end

IO.inspect(CampCleanup.pairs_contain_count())
IO.inspect(CampCleanup.overlap())
