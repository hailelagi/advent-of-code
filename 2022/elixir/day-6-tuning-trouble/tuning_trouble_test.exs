ExUnit.start()

defmodule TuningTroubleTest do
  use ExUnit.Case, async: true

  describe "detects a start-of-packet marker in the datastream" do
    test "it detects the example datastream buffer" do
      assert TuningTrouble.packet_marker("mjqjpqmgbljsphdztnvjfqwrcgsmlb") == 7
    end

    test "example two" do
      assert TuningTrouble.packet_marker("bvwbjplbgvbhsrlpgdmjqwftvncz") == 5
    end

    test "example three" do
      assert TuningTrouble.packet_marker("nppdvjthqldpwncqszvftbrmjlhg") == 6
    end

    test "example four" do
      assert TuningTrouble.packet_marker("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg") == 10
    end

    test "example five" do
      assert TuningTrouble.packet_marker("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw") == 11
    end
  end
end
