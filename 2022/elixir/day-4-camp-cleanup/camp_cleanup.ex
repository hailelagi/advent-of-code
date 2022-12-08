defmodule CampCleanup do

  def pairs_contain_count(path \\ "./puzzle_input.txt") do
    assignments = parse(path)

    IO.inspect(assignments)
    0
  end


  defp parse(path) do
    section_assignments = File.read!(path)

    String.split(section_assignments, "\n")
  end
end
