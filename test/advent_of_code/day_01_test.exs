defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01

  # @tag :skip
  test "part1" do
    input = [12]
    result = part1(input)

    assert result == 2

    input = [12, 14]
    result = part1(input)

    assert result == 4
  end

  # @tag :skip
  test "part2" do
    input = [1969]
    result = part2(input)

    assert result == 966

    input = [100_756]
    result = part2(input)

    assert result == 50346
  end
end
