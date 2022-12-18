defmodule TuningTrouble do
  @moduledoc false

  def main do
    datastream = File.read!("./puzzle_input.txt")

    IO.puts(start_of_marker(datastream, :packet))
    IO.puts(start_of_marker(datastream, :message))
  end

  @doc """
    Part one:
    Find the start of packet marker in a datastream buffer
  """
  def start_of_marker(datastream, type \\ :packet) do
    chunks =
      case type do
        :packet -> 4
        :message -> 14
        _ -> raise "Invalid communication system provided :( "
      end

    datastream
    |> String.splitter("")
    |> Stream.filter(&(&1 != ""))
    |> Stream.with_index()
    |> Stream.chunk_every(chunks, 1, :discard)
    |> Enum.reduce_while([], fn x, acc ->
      packet = Enum.map(x, fn {value, _index} -> value end)

      if length(Enum.uniq(packet)) == length(packet) do
        [{_value, index} | _] = Enum.reverse(x)
        {:halt, index + 1}
      else
        {:cont, x}
      end
    end)
  end
end

TuningTrouble.main()
