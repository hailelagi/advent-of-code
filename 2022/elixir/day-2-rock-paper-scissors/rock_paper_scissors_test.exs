ExUnit.start()

defmodule RockPaperScissorsTest do
  use ExUnit.Case, async: true

  test "do something" do
    assert RockPaperScissors.total_score("./example_input.txt") == 15
  end
end
