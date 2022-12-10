defmodule SupplyStacks do
  @moduledoc false

  @doc """
    Part one: crates at the top after arrangement
  """
  def top_crate(path \\ "./puzzle_input.txt") do
    [diagram, procedures] = parse(path)

    stacks =
      for {s, i} <- build_stack(diagram), into: %{} do
        {i, Enum.filter(Tuple.to_list(s), &(&1 != ""))}
      end

    procedures = String.split(procedures, "\n")
    rearranged = Enum.reduce(procedures, stacks, fn p, acc -> rearrangement(acc, p) end)

    rearranged
    |> Enum.into([])
    |> Enum.map(fn {_, stack} -> List.last(stack) end)
    |> Enum.join()
    |> String.split(~r/[[:punct:]]/)
    |> Enum.join()
  end

  defp rearrangement(stacks, procedure) do
    ["move", m, "from", f, "to", t] = String.split(procedure, " ")
    [move, from, to] = Enum.map([m, f, t], &String.to_integer/1)

    from_index = from - 1
    to_index = to - 1

    {taken, new_list} = take_from(stacks[from_index], move)
    prev = stacks[to_index]

    %{stacks | from_index => new_list, to_index => prev ++ taken}
  end

  def take_from(list, n) do
    {Enum.take(list, -n) |> Enum.reverse(), Enum.drop(list, -n)}
  end

  defp build_stack(diagram) do
    [_numbers | crates] = String.split(diagram, "\n") |> Enum.reverse()

    crates
    |> Stream.map(&String.split(&1, " "))
    |> Stream.map(&dedup_interval(&1))
    |> Stream.zip()
    |> Enum.with_index()
  end

  defp dedup_interval(data) do
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

IO.inspect(SupplyStacks.top_crate())
