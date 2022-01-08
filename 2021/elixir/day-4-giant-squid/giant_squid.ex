defmodule GiantSquid do
  @doc """
  Part one: Calculate which board will win first and the final score if chosen.
  """
  def wining_board_score(path) do
    {numbers, boards} = parse(path)
    board_len = length(boards) - 1

    scores = for i <- 0..board_len, into: %{}, do: {i, []}

    winning_board = search(board_len, numbers, boards, scores)
    [called_index, {board_no, marked_numbers }] = winning_board

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
      Enum.concat(x, y)
    end) 
    case wining_match(scores) do
      {:ok, win_board} -> [index | win_board]
      {:continue, _} -> 
        index = index + 1
        search(index, board_len, tail, boards, scores)
    end
  end

  defp wining_match(scores) do 
      if length(scores[0]) < 5 do
        {:continue, nil}
      else
        res = Enum.map(scores, fn {board_number, score} -> 
          window = score
          |> Enum.sort(:asc) 
          |> Enum.chunk_every(5, 5,:discard)
          |> Enum.map(fn interval -> 
            [incr | score] = interval

            Enum.reduce_while(score, incr, fn x, acc ->
              if (x - acc == 1 or x - acc == 5) and (incr in 0..4) do
                {:cont, x }
                  else
                {:halt, -1}
              end
            end)
          end)

          if Enum.any?(window, fn x -> x != -1 end), do: {board_number, score}, else: 0
        end)
        |> Enum.filter(fn r -> r != 0 end)

      if not Enum.empty?(res) do
        {:ok, res}
        else
        {:continue, nil}
      end
      end
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
