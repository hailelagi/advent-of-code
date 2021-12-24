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

  @doc """
  Part Two: Calculates the horizontal position and depth, using new interpretation of the commands
  and multiplies them
  """
  def corrected_course_path(path \\ "./puzzle_input.txt") do
    commands = parse(path)

    {horizontal, depth, _} = Enum.reduce(commands, {0, 0, 0}, fn command, {horizontal, depth, aim} ->
      [direction, pos] = String.split(command, " ")
      position = String.to_integer(pos)

      case direction do
        "down" -> {horizontal, depth, aim + position}
        "up" -> {horizontal, depth, aim - position}
        "forward" -> {horizontal + position, depth + (aim * position), aim}
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
IO.puts Dive.corrected_course_path()
