defmodule SupplyStacks do
  @moduledoc false

  def top_crate(path \\ "./puzzle_input.txt") do
    crates = parse(path)
    IO.inspect(crates)
    "FAIL"
  end

  defp parse(path) do
    crate_drawing = File.read!(path)

    String.split(crate_drawing, "\n\n")
  end
end
