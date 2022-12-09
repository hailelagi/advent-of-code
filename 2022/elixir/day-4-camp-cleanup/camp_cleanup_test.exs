ExUnit.start()

defmodule CampCleanupTest do
  use ExUnit.Case, async: true

  test "it counts assignment pairs that contain each other completely" do
    assert CampCleanup.pairs_contain_count("./example_input.txt") == 2
  end

  test "it counts assignment pairs that have any overlap" do
    assert CampCleanup.overlap("./example_input.txt") == 4
  end
end
