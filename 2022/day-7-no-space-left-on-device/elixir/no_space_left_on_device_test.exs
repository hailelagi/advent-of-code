ExUnit.start()

defmodule NoSpaceLeftOnDeviceTest do
  use ExUnit.Case, async: true

  test "it finds the sum of the total sizes of directories" do
    assert NoSpaceLeftOnDevice.sum_directories("../example_input.txt") == 95437
  end
end
