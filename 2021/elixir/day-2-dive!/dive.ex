defmodule Dive do
  @doc """
  Part One: Calculates the horizontal position and depth, multiplies them
  """
  def course_path(path \\ "./puzzle_input.txt") do
    positions = parse(path)

    positions
  end

  defp parse(path) do
    {:ok, input} = File.read(path)
    input
    |> String.split("\n")
  end
end
