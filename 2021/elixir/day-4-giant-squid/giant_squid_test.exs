ExUnit.start()

defmodule GiantSquidTest do
  use ExUnit.Case, async: true

  describe "Calculate which board will win first and the final score if chosen." do
    test "the example game is scored properly" do
      assert GiantSquid.wining_board_score("./example_input.txt") == 4512
    end
  end

  describe "" do
    test "" do
      # assert GiantSquid.("./example_input.txt") == nil
    end
  end
end
