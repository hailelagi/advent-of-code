ExUnit.start()

defmodule RucksackReorganizationTest do
  use ExUnit.Case, async: true

  test "it gets the sum of the priorities of items in priority" do
    assert RucksackReorganization.sum_priority("../example_input.txt") == 157
  end

    test "it gets the sum of the priorities of groups of three items in priority" do
    assert RucksackReorganization.sum_priority_group("../example_input.txt") == 70
  end
end
