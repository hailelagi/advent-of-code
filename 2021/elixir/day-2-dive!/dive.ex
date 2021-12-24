defmodule Dive do
  @doc """
  Part One: Calculates the horizontal position and depth, multiplies them
  """
  def course_path(path \\ "./puzzle_input.txt") do
    commands = parse(path)

    {horizontal, depth} = Enum.reduce(commands, {0, 0}, fn command, {horizontal, depth} ->
      [direction, pos] = String.split(command, " ")
      position = String.to_integer(pos)

      case direction do
        "forward" -> {horizontal + position, depth}
        "down" -> {horizontal, depth + position}
        "up" -> {horizontal, depth - position}
      end
    end)

    horizontal * depth
  end

  defp parse(path) do
    {:ok, input} = File.read(path)
    input
    |> String.split("\n")
  end
end

IO.puts Dive.course_path()
