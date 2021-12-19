ExUnit.start()

defmodule SonarSweepTest do
  use ExUnit.Case, async: true

  describe "Part one example report" do
    test "It counts the number of times a depth measurement increases" do
      assert SonarSweep.depth_measurement("./example_input.txt") == 7
    end
  end

  describe "Part two example report" do
    test "It counts sums of a three-measurement sliding window" do
      assert SonarSweep.sum_depth_measurement("./example_input.txt") == 5
    end
  end
end
