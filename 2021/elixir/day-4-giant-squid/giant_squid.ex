defmodule GiantSquid do
  @doc """
  Part one: Calculate which board will win first and the final score if chosen.
  """
  def wining_board_score(path) do
    {numbers, boards} = parse(path)
    board_len = length(boards) - 1

    scores = for i <- 0..board_len, into: %{}, do: {i, []}

    [called_index, {board_no, marked_numbers }] = search(board_len, numbers, boards, scores)
    last_called = Enum.at(numbers, called_index) |> String.to_integer()

    sum_unmarked =  Enum.at(boards, board_no)
    |> Enum.with_index(fn elem, index-> if index in marked_numbers, do: nil, else: String.to_integer(elem) end )
    |> Enum.filter(fn n -> n != nil end)
    |> Enum.sum()

    last_called * sum_unmarked
  end

  defp search(index \\ 0, board_len, numbers, boards, scores)

  # win not possible
  defp search(_, _, [], _, scores), do: scores

  defp search(index, board_len, numbers, boards, scores) do
    [n | tail] = numbers

    positions = Enum.map(boards, fn board -> 
      Enum.find_index(board, fn b -> b == n end) 
    end)

    score = for i <- 0..board_len, into: %{}, do: {i, [Enum.at(positions, i)]}

    scores = Map.merge(scores, score, fn _, x, y ->
      y = Enum.filter(y, fn i -> i != nil end)
      Enum.concat(x, y)
    end)

    case wining_match(scores) do
      [{board_num, win_board}] -> [index, {board_num, win_board}]
      [] ->
        index = index + 1
        search(index, board_len, tail, boards, scores)
    end
  end

  defp wining_match(scores) do
        Enum.map(scores, fn {board_number, score} ->
          if length(score) < 5 do
            nil
          else
            row_one = Enum.all?([0, 1, 2, 3, 4],  fn x -> Enum.member?(score, x) end )
            row_two = Enum.all?([5, 6, 7, 8, 9],  fn x -> Enum.member?(score, x) end )
            row_three = Enum.all?([10, 11, 12, 13, 14],  fn x -> Enum.member?(score, x) end )
            row_four = Enum.all?([15, 16, 17, 18, 19],  fn x -> Enum.member?(score, x) end )
            row_five = Enum.all?([20, 21, 22, 23, 24],  fn x -> Enum.member?(score, x) end )

            col_one = Enum.all?([0, 5, 10, 15, 20],  fn x -> Enum.member?(score, x) end )
            col_two = Enum.all?([1, 6, 11, 16, 21],  fn x -> Enum.member?(score, x) end )
            col_three = Enum.all?([2, 7, 12, 17, 22],  fn x -> Enum.member?(score, x) end )
            col_four = Enum.all?([3, 8, 13, 18, 23],  fn x -> Enum.member?(score, x) end )
            col_five = Enum.all?([4, 9, 14, 19, 24],  fn x -> Enum.member?(score, x) end )

            if (row_one or row_two or row_three or row_four or row_five) or
               (col_one or col_two or col_three or col_four or col_five) do
              {board_number, score}
            else
              nil
            end
          end
        end) |> Enum.filter(&(&1 != nil))
  end


  @doc """
  Part two:
  """
  def part_two do
    0
  end

  defp parse(path) do
    {:ok, input} = File.read(path) 
    
    [head | boards] = String.split(input, "\n\n")
    numbers = String.split(head, ",", trim: true)
    boards = Enum.map(boards, fn board -> String.split(board, ~r/\s/, trim: true) end)

    {numbers, boards}
  end
end

IO.puts GiantSquid.wining_board_score("./puzzle_input.txt")
