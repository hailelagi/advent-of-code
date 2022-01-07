defmodule GiantSquid do
  @doc """
  Part one: Calculate which board will win first and the final score if chosen.
  """

  # Approach one brute force: 
  # sum the rows and columns - precomputed comparision will run at most O(m * n) where:
  # m is number of elements in the row and n the column.
  # iterate through numbers and find all unique combinations of 5 O(n!) compare with sum
  # O(m * n) + O(n!) doesn't seem terribly efficient. 

  # Approach two after a cup of coffee :)
  # iterate over random numbers
  # it is guaranteed a bingo board is a 5x5 matrix.
  # store the postions found in each board as a map of their index [0 - 24]
  # possible impl optimisiation use a tuple to store boards only need read access
  # hard code the "match" e.g if i 0 - 4 is "not nil" we have a match
  # a bit verbose but seems more efficient
  # check each board on each iteration for a winner
  # fiter by index.
  # trade time for space and less flexibility
  # worst case O(n ^ boards)

  def wining_board_score(path) do
    {numbers, boards} = parse(path)
    num_boards = length(boards)
    num_len = length(numbers)

      # fiter by index.
    IO.inspect search(numbers, boards)

  end

  defp search(index \\ 0, numbers, boards, scores \\ %{})

  # win not possible
  defp search(_, [], _, scores), do: scores

  defp search(index, numbers, boards, scores) do
    [n | tail] = numbers
    board_len = length(boards) - 1

    positions = Enum.map(boards, fn board -> 
      Enum.find_index(board, fn b -> b == n end) 
    end)
    
    score = for i <- 0..board_len do %{i => Enum.at(positions, i)} end

    IO.inspect score
    #scores = Map.put(scores, n, score)

    search(index =+ 1, tail, boards, scores)
  end

  defp wining_match() do 
      #  hard code the "match" e.g if i 0 - 4 is "not nil" we have a match
      # 0, 1, 2, 3, 4
      # 5, 6, 7, 8, 9
      # 10,11,12,13,14
      # 15,16,17,18,19
      # 20,21,22,23,24

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

GiantSquid.wining_board_score("./example_input.txt")
