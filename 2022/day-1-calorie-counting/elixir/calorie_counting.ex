defmodule CalorieCounting do
  @moduledoc false

  @doc """
    Part one: Finds the Elf carrying the most calories
  """
  def elf_with_most(path \\ "../puzzle_input.txt") do
    calories = parse(path)

    calories
    |> Enum.map(fn c -> Enum.sum(c) end)
    |> Enum.max()
  end

  @doc """
    Part two: Finds all the calories of the top three Elves
  """
  def top_three_elves(path \\ "../puzzle_input.txt") do
    calories = parse(path)

    [first, second, third | _] =
      calories
      |> Stream.map(fn c -> Enum.sum(c) end)
      |> Enum.sort(&(&1 >= &2))

    first + second + third
  end

  defp parse(path) do
    calories = File.read!(path)

    calories
    |> String.split("\n\n")
    |> Stream.map(fn inventory ->
      inventory |> String.split("\n") |> Enum.map(&String.to_integer/1)
    end)
  end
end

IO.inspect CalorieCounting.elf_with_most()
IO.inspect CalorieCounting.top_three_elves()
