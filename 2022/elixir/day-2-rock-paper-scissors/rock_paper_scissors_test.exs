ExUnit.start()

defmodule RockPaperScissorsTest do
  use ExUnit.Case, async: true

  test "it gets the score if following the strategy guide" do
    assert RockPaperScissors.total_score("./example_input.txt") == 15
  end

  test "it gets the correct score with an adjusted strategy guide" do
    assert RockPaperScissors.correct_total_score("./example_input.txt") == 12
  end
end
