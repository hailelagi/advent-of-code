defmodule SonarSweep do
  defp parse(path) do
    {:ok, report} = File.read(path)
    report
    |> String.split("\n")
    |> Enum.map(&{0, String.to_integer(&1)})
  end

  @doc """
  Part one: counts no. of measurement's larger than the previous measurement
  """
  def depth_increase(path \\ "./puzzle_input.txt") do
    measurements = parse(path)

    {depth_increase, _} = Enum.reduce(measurements, fn {_, depth }, {i, prev_depth} ->
      if depth > prev_depth do
        {i + 1, depth}
      else
        {i, depth}
      end
    end)

    depth_increase
  end

  @doc """
  Part two: counts sums of a three-measurement sliding window of measurements
  """
  def sum_depth_increase(path \\ "./puzzle_input.txt") do
    measurements = parse(path)


  end
end
