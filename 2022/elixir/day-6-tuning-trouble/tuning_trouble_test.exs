ExUnit.start()

defmodule TuningTroubleTest do
  use ExUnit.Case, async: true

  describe "detects a start-of-packet marker in the datastream" do
    test "it detects the example datastream buffer" do
      assert TuningTrouble.start_of_marker("mjqjpqmgbljsphdztnvjfqwrcgsmlb", :packet) == 7
    end

    test "example two" do
      assert TuningTrouble.start_of_marker("bvwbjplbgvbhsrlpgdmjqwftvncz", :packet) == 5
    end

    test "example three" do
      assert TuningTrouble.start_of_marker("nppdvjthqldpwncqszvftbrmjlhg", :packet) == 6
    end

    test "example four" do
      assert TuningTrouble.start_of_marker("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", :packet) == 10
    end

    test "example five" do
      assert TuningTrouble.start_of_marker("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", :packet) == 11
    end
  end

  describe "detects a start-of-message marker in the datastream" do
    test "it detects the example datastream buffer" do
      assert TuningTrouble.start_of_marker("mjqjpqmgbljsphdztnvjfqwrcgsmlb", :message) == 19
    end

    test "example two" do
      assert TuningTrouble.start_of_marker("bvwbjplbgvbhsrlpgdmjqwftvncz", :message) == 23
    end

    test "example three" do
      assert TuningTrouble.start_of_marker("nppdvjthqldpwncqszvftbrmjlhg", :message) == 23
    end

    test "example four" do
      assert TuningTrouble.start_of_marker("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", :message) == 29
    end

    test "example five" do
      assert TuningTrouble.start_of_marker("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", :message) == 26
    end
  end
end
