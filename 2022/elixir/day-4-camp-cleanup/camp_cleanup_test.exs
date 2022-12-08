ExUnit.start()

defmodule CampCleanupTest do
  use ExUnit.Case, async: true

  test "it does something" do
    assert CampCleanup.pairs_contain_count("./example_input.txt") == 2
  end
end
