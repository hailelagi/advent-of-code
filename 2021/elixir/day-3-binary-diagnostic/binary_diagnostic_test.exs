ExUnit.start()

defmodule BinaryDiagnosticTest do
  use ExUnit.Case, async: true

  describe "Part one: what is the power consumption of the submarine?" do
    test "example input power consumption" do
      assert BinaryDiagnostic.power_consumption("./example_input.txt") == 198
    end
  end

  describe "Part two: Find the life support rating" do
    test "example life support rating is accurate" do
      assert BinaryDiagnostic.life_support_rating("./example_input.txt") == 230
    end
  end
end
