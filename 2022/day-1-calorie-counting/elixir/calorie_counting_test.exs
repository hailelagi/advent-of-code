ExUnit.start()

defmodule CalorieCountingTest do
    use ExUnit.Case, async: true

      test "It finds the elf with the most calories in inventory" do
        assert CalorieCounting.elf_with_most("../example_input.txt") == 24000
      end

      test "It finds the top three elves with most calories in inventory" do
        assert CalorieCounting.top_three_elves("../example_input.txt") == 45000
      end
end
