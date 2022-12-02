ExUnit.start()

defmodule CalorieCountingTest do
    use ExUnit.Case, async: true

    describe "Part one Calorie counting" do
      test "It finds the elf with the most calories in inventory" do
        assert CalorieCounting.elf_with_most("./example_input.txt") == 24000
      end
    end
end
