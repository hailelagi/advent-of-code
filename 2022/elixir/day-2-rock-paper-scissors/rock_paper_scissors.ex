defmodule RockPaperScissors do
  @moduledoc """
    Finds the outcome of a game of rock paper scissors between elves.
    lose = 0, draw = 3 and win = 6 points
    rock(1) -> A
    paper(2) -> B
    scissors(3) -> C
  """

  @doc """
    Part One:
    Gets the total score by following the encrypted strategy guide
    X for Rock, Y for Paper, and Z for Scissors
  """
  def total_score(path \\ "./puzzle_input.txt") do
    strategy = parse(path)

    strategy
    |> Enum.map(fn s -> outcomes(s) end)
    |> Enum.map(fn o -> find_score(o) end)
    |> Enum.sum()
  end

  @doc """
    Part Two:
    Gets the total score if everything goes according to strategy
    with new outcomes predicted
  """
  def correct_total_score(path \\ "./puzzle_input.txt") do
    strategy = parse(path)

    strategy
    |> Enum.map(fn s -> correct_outcomes(s) end)
    |> Enum.map(fn o -> find_score(o) end)
    |> Enum.sum()
  end

  defp find_score({outcome, point}) do
    case outcome do
      :win -> 6 + point
      :draw -> 3 + point
      :lose -> 0 + point
    end
  end

  def outcomes(round) do
    case round do
      ["A", "Y"] -> {:win, 2}
      ["B", "Z"] -> {:win, 3}
      ["C", "X"] -> {:win, 1}
      ["A", "X"] -> {:draw, 1}
      ["B", "Y"] -> {:draw, 2}
      ["C", "Z"] -> {:draw, 3}
      [_, "X"] -> {:lose, 1}
      [_, "Y"] -> {:lose, 2}
      [_, "Z"] -> {:lose, 3}
    end
  end

  def correct_outcomes(round) do
    case round do
      [move, "X"] -> {:lose, bonus_score(move, :lose)}
      [move, "Y"] -> {:draw, bonus_score(move, :draw)}
      [move, "Z"] -> {:win, bonus_score(move, :win)}
    end
  end

  defp bonus_score(move, :win) do
    case move do
      "A" -> 2
      "B" -> 3
      "C" -> 1
    end
  end

  defp bonus_score(move, :lose) do
    case move do
      "A" -> 3
      "B" -> 1
      "C" -> 2
    end
  end

  defp bonus_score(move, :draw) do
    case move do
      "A" -> 1
      "B" -> 2
      "C" -> 3
    end
  end

  defp parse(path) do
    strategy_guide = File.read!(path)

    strategy_guide
    |> String.split("\n")
    |> Enum.map(&String.split(&1, " "))
  end
end

IO.inspect(RockPaperScissors.total_score())
IO.inspect(RockPaperScissors.correct_total_score())
