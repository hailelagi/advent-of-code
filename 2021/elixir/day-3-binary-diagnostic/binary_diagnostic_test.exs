ExUnit.start()

defmodule BinaryDiagnosticTest do
  use ExUnit.Case, async: true

  describe "Part one: what is the power consumption of the submarine?" do
    test "example input power consumption" do
      assert BinaryDiagnostic.power_consumption("./example_input.txt") == 198
    end
  end

  describe "Part two: " do
    test "nothing" do
      # assert BinaryDiagnostic.("./example_input.txt") == nil
    end
  end
end
