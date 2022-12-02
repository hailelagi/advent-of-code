defmodule CalorieCounting do
  @moduledoc false

  @doc """
    Part one: Finds the Elf carrying the most calories
  """
  def elf_with_most(path \\ "./puzzle_input.txt") do
    calories = parse(path)

    calories
    |> Enum.map(fn c ->  Enum.sum(c) end)
    |> Enum.max()
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
