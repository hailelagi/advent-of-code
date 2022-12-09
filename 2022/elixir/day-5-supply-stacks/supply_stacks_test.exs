defmodule SupplyStacks do
  @moduledoc """
   elixir -r "supply_stacks.ex" supply_stacks_test.exs
  """

  def top_crate(path \\ "./puzzle_input.txt") do
    [diagram, _procedure] = parse(path)
    stack = build_stack(diagram)

    IO.inspect(stack)
    "FAIL"
  end

  # so inefficient but oh well, it works!
  defp build_stack(diagram) do
    [numbers | crates] = String.split(diagram, "\n") |> Enum.reverse()
    len = String.strip(numbers) |> String.split("  ") |> length()

    crates
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(&dedup_interval(&1))
    |> Enum.zip()
  end

  defp dedup_interval(data, interval \\ 4) do
    {_, row} =
      Enum.reduce(data, {0, []}, fn c, {count, rest} ->
        cond do
          c == "" and count == 0 -> {count + 1, [""] ++ rest}
          c == "" and count > 0 and count < 3 -> {count + 1, rest}
          c == "" and count == 3 -> {0, rest}
          c != "" -> {0, [c | rest]}
        end
      end)

    Enum.reverse(row)
  end

  defp parse(path) do
    crate_drawing = File.read!(path)

    String.split(crate_drawing, "\n\n")
  end
end
