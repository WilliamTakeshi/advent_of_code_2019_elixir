defmodule AdventOfCode.Day04Test do
  use ExUnit.Case

  import AdventOfCode.Day04

  test "password1" do
    input = 111_111
    result = check_passwd(input)
    assert result == true

    input = 223_450
    result = check_passwd(input)
    assert result == false

    input = 123_789
    result = check_passwd(input)
    assert result == false
  end

  test "password2" do
    input = 112_233
    result = check_passwd_strict(input)
    assert result == true

    input = 123_444
    result = check_passwd_strict(input)
    assert result == false

    input = 111_122
    result = check_passwd_strict(input)
    assert result == true
  end

  @tag :skip
  test "part1" do
    input = nil
    result = part1(input)

    assert result
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
