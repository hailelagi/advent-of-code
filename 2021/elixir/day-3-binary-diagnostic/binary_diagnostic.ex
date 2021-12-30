defmodule BinaryDiagnostic do
  @doc """
  Part one: Find the power consumption of a submarine
  """
  def power_consumption(path \\ "./puzzle_input.txt") do
    diagnostic_report = parse(path)
    num_column = String.length(List.first(diagnostic_report))

    diagnostic_report = diagnostic_report
    |> Enum.join()
    |> String.split("", trim: true)

    transformed_report = transform(num_column, diagnostic_report, num_column)

    gamma_rate = Enum.map(transformed_report, fn r ->
      %{"0" => zero_count, "1" => one_count} = Enum.frequencies(r)

      if zero_count > one_count, do: "0", else: "1"
    end)
    |> Enum.reverse()

    epsilon_rate = Enum.map(gamma_rate, fn x -> if x == "1", do: "0", else: "1" end)

    to_decimal(gamma_rate) * to_decimal(epsilon_rate)
  end

  @doc """
  Part two: Find the life support rating
  """
  def life_support_rating(path \\ "./puzzle_input.txt") do
    diagnostic_report = parse(path)
    num_column = String.length(List.first(diagnostic_report))

    oxygen_generator_rating = filter_rating(:>=, diagnostic_report, num_column)
    co2_scrubber_rating = filter_rating(:<, diagnostic_report, num_column)

    to_decimal(oxygen_generator_rating) * to_decimal(co2_scrubber_rating)
  end

  defp filter_rating(bit_criteria, diagnostic_report, num_column, index \\ 0)

  defp filter_rating(_, [_ | [] ] = diagnostic_report, _, _), do: diagnostic_report

  defp filter_rating(bit_criteria, diagnostic_report, num_column, index) do
    flat_report = diagnostic_report
    |> Enum.join()
    |> String.split("", trim: true)

    transformed_report = transform(num_column, flat_report, num_column) |> Enum.reverse()
    bit_row = Enum.at(transformed_report, index)

    %{"0" => zero_count, "1" => one_count} = Enum.frequencies(bit_row)

    bit_condition = apply(Kernel, bit_criteria, [one_count, zero_count])
    bit = if bit_condition, do: "1", else: "0"

    diagnostic_report = Enum.filter(diagnostic_report, fn n ->
      String.at(n, index) == bit
    end)

    index = index + 1
    filter_rating(bit_criteria, diagnostic_report, num_column, index)
  end

  defp parse(path) do
    {:ok, input} = File.read(path)
    input
    |> String.split("\n")
  end


  defp transform(num_column, report, index, acc \\ [])

  defp transform(_num_column, _report, 0, acc), do: acc

  defp transform(num_column, report, index, acc) do
    row = Enum.take_every(report, num_column)
    [_ | tail ] = report
    index = index - 1

    transform(num_column, tail, index, [row | acc])
  end

  defp to_decimal(binary) do
    binary = Enum.join(binary)
    {decimal, _} = Integer.parse(binary, 2)
    decimal
  end
end

IO.inspect BinaryDiagnostic.power_consumption()
IO.inspect BinaryDiagnostic.life_support_rating()
