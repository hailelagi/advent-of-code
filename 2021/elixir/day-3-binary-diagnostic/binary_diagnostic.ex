defmodule BinaryDiagnostic do
  @doc """
  Part one: Find the power consumption of a submarine
  """
  def power_consumption(path \\ "./puzzle_input.txt") do
    diagnostic_report = parse(path)
    num_row = String.length(List.first(diagnostic_report))

    diagnostic_report = diagnostic_report
    |> Enum.join()
    |> String.split("", trim: true)

    transformed_report = transform(num_row, diagnostic_report, num_row)

    gamma_rate = Enum.map(transformed_report, fn r ->
      %{"0" => zero_count, "1" => one_count} = Enum.frequencies(r)

      if zero_count > one_count, do: "0", else: "1"
    end)
    |> Enum.reverse()

    epsilon_rate = Enum.map(gamma_rate, fn x -> if x == "1", do: "0", else: "1" end)

    to_decimal(gamma_rate) * to_decimal(epsilon_rate)
  end

  @doc """
  Part two:
  """
  def part_two do
  end

  defp parse(path) do
    {:ok, input} = File.read(path)
    input
    |> String.split("\n")
  end


  defp transform(num_row, report, index, acc \\ [])

  defp transform(_num_row, _report, 0, acc), do: acc

  defp transform(num_row, report, index, acc) do
    column = Enum.take_every(report, num_row)
    [_ | tail ] = report
    index = index - 1

    transform(num_row, tail, index, [column | acc])
  end

  defp to_decimal(binary) do
    binary = Enum.join(binary)
    {decimal, _} = Integer.parse(binary, 2)
    decimal
  end
end

IO.inspect BinaryDiagnostic.power_consumption()
