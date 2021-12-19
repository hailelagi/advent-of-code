defmodule SonarSweep do
  @doc """
  Part one: counts no. of measurement's larger than the previous measurement
  """
  def depth_measurement(path \\ "./puzzle_input.txt") do
    measurements = parse(path)

    depth_increase(measurements)
  end

  @doc """
  Part two: counts sums of a three-measurement sliding window of measurements
  """
  def sum_depth_measurement(path \\ "./puzzle_input.txt") do
    measurements = parse(path)

    measurements
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(fn window -> Enum.sum(window) end)
    |> depth_increase()
  end

  defp parse(path) do
    {:ok, report} = File.read(path)
    report
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
  end

  defp depth_increase(measurements) do
    measurements = for m <- measurements, do: {0, m}

    {depth_increase, _} = Enum.reduce(measurements, fn {_, depth }, {i, prev_depth} ->
      if depth > prev_depth do
        {i + 1, depth}
      else
        {i, depth}
      end
    end)

    depth_increase
  end
end
