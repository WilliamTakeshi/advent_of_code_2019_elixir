defmodule AdventOfCode.Day01 do
  def part1(args) do
    args
    |> Enum.map(&fuel(&1))
    |> Enum.sum()
  end

  def part2(args) do
    args
    |> Enum.map(&fuel_recursive(&1, 0))
    |> Enum.sum()
  end

  defp fuel(value) do
    div(value, 3) - 2
  end

  defp fuel_recursive(value, total_fuel) do
    case fuel(value) do
      fuel_value when fuel_value > 0 -> fuel_recursive(fuel_value, total_fuel + fuel_value)
      _otherwise -> total_fuel
    end
  end
end
