ExUnit.start()

defmodule DiveTest do
  use ExUnit.Case, async: true

  describe "Part one example course path" do
    test "Calculates the horizontal position and depth, multiplies them" do
      assert Dive.course_path("./example_input.txt") == 150
    end
  end

  describe "Part two example course path" do
    test "" do
      # assert Dive.("./example_input.txt") == nil
    end
  end
end
