ExUnit.start()

defmodule SupplyStacksTest do
  use ExUnit.Case, async: true

  test "it finds the crate on top after rearragnement" do
    assert SupplyStacks.top_crate("../example_input.txt") == "CMZ"
  end

    test "it finds the crate on top after rearragnement in order" do
    assert SupplyStacks.top_crate_in_order("../example_input.txt") == "MCD"
  end
end
