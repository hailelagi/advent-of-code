ExUnit.start()

defmodule GiantSquidTest do
  use ExUnit.Case, async: true

  describe "Calculate which board will win first and the final score if chosen." do
    test "the example game is scored properly" do
      assert GiantSquid.winning_board_score("./example_input.txt") == 4512
    end
  end

  describe "Calculate which board will win last" do
    test "the final score of the last board is correct" do
      assert GiantSquid.last_winning_board_score("./example_input.txt") == 1924
    end
  end
end
