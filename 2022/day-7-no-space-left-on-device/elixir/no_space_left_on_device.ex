defmodule NoSpaceLeftOnDevice do
  @moduledoc false

  def sum_directories(path \\ "../puzzle_input.txt") do
    file_tree = parse(path)
  end

  defp parse(path) do
    path |> File.read!()
  end
end
