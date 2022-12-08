ExUnit.start()

defmodule RockPaperScissorsTest do
  use ExUnit.Case, async: true

  test "it gets the score if following the strategy guide" do
    assert RockPaperScissors.total_score("./example_input.txt") == 15
  end
end
