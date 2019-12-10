defmodule AdventOfCode.Day02Test do
  use ExUnit.Case

  import AdventOfCode.Day02

  # @tag :skip
  test "test1part1" do
    input = [1, 0, 0, 0, 99]
    result = part1(input)

    assert result == [2, 0, 0, 0, 99]
  end

  test "test2part1" do
    input = [2, 4, 4, 5, 99, 0]
    result = part1(input)

    assert result == [2, 4, 4, 5, 99, 9801]
  end

  test "test3part1" do
    input = [1, 1, 1, 4, 99, 5, 6, 0, 99]
    result = part1(input)

    assert result == [30, 1, 1, 4, 2, 5, 6, 0, 99]
  end

  test "test4part1" do
    input = [1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50]
    result = part1(input)

    assert result == [3500, 9, 10, 70, 2, 3, 11, 0, 99, 30, 40, 50]
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
