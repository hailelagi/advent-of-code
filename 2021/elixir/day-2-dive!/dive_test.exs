ExUnit.start()

defmodule DiveTest do
  use ExUnit.Case, async: true

  describe "Part one example course path" do
    test "Calculates the horizontal position and depth, multiplies them" do
      assert Dive.course_path("./example_input.txt") == 150
    end
  end

  describe "Part two example course path" do
    test "Calculates the horizontal position and depth, using new interpretation of the commands, multiplies them" do
      assert Dive.corrected_course_path("./example_input.txt") == 900
    end
  end
end
