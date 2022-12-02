defmodule CalorieCounting do
  @moduledoc false

  @doc """
    Part one: Finds the Elf carrying the most calories
  """
  def elf_with_most(path \\ "./puzzle_input.txt") do
    calories = parse(path)

    0
  end

  defp parse(path) do
    calories = File.read!(path)

    calories
    |> String.split("\n")
    # |> Enum.map(&String.to_integer/1)
  end
end
