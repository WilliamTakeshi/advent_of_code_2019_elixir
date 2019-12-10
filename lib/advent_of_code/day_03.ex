defmodule AdventOfCode.Day03 do
  def part1(args) do
    walk_description =
      args
      |> String.split("\n")
      |> Enum.map(&String.split(&1, ","))

    fst_path = walk_direction([{0, 0}], Enum.at(walk_description, 0))
    snd_path = walk_direction([{0, 0}], Enum.at(walk_description, 1))

    intersect_lst(fst_path, snd_path)
    |> Enum.map(fn x -> manhattan_dist(x, {0, 0}) end)
    |> Enum.min()
  end

  def part2(args) do
    walk_description =
      args
      |> String.split("\n")
      |> Enum.map(&String.split(&1, ","))

    fst_path = walk_direction([{0, 0}], Enum.at(walk_description, 0))
    snd_path = walk_direction([{0, 0}], Enum.at(walk_description, 1))

    intersect_lst(fst_path, snd_path)
    |> Enum.map(fn x -> path_dist(x, fst_path, snd_path) end)
    |> Enum.min()
  end

  def intersect_lst(lst1, lst2) do
    lst3 = lst1 -- lst2
    final_lst = lst1 -- lst3
    final_lst -- [{0, 0}]
  end

  def manhattan_dist({x1, y1}, {x0, y0}) do
    abs(x1 - x0) + abs(y1 - y0)
  end

  def path_dist(intersect_point, fst_path, snd_path) do
    fst_path_distance = Enum.find_index(fst_path, fn x -> x == intersect_point end)
    snd_path_distance = Enum.find_index(snd_path, fn x -> x == intersect_point end)

    fst_path_distance + snd_path_distance
  end

  def walk_direction(coordinate_lst, [next_direction | tail]) do
    new_coordinates = walk_wire(List.first(coordinate_lst), next_direction)
    walk_direction(new_coordinates ++ coordinate_lst, tail)
  end

  def walk_direction(coordinate_lst, []) do
    Enum.reverse(coordinate_lst)
  end

  def walk_wire({init_x, init_y}, direction) do
    case direction do
      "R" <> num -> for x <- String.to_integer(num)..1, do: {init_x + x, init_y}
      "L" <> num -> for x <- String.to_integer(num)..1, do: {init_x - x, init_y}
      "U" <> num -> for y <- String.to_integer(num)..1, do: {init_x, init_y + y}
      "D" <> num -> for y <- String.to_integer(num)..1, do: {init_x, init_y - y}
    end
  end
end
