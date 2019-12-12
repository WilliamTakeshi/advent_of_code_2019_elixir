defmodule AdventOfCode.Day04 do
  def get_ranges(args) do
    String.split(args, "-")
    |> Enum.map(&String.to_integer/1)
  end

  def part1(args) do
    [range_init, range_finish] = get_ranges(args)

    range_init..range_finish
    |> Enum.filter(&check_passwd/1)
    |> Enum.count()
  end

  def part2(args) do
    [range_init, range_finish] = get_ranges(args)

    range_init..range_finish
    |> Enum.filter(&check_passwd_strict/1)
    |> Enum.count()
  end

  def check_passwd(passwd) do
    int_lst = Integer.digits(passwd)

    adj_tuple = Enum.zip(int_lst, tl(int_lst))

    have_pair(adj_tuple) && only_increase(adj_tuple)
  end

  def check_passwd_strict(passwd) do
    int_lst = Integer.digits(passwd)

    adj_tuple = Enum.zip(int_lst, tl(int_lst))

    have_strict_pair(adj_tuple) && only_increase(adj_tuple)
  end

  defp have_pair(adj_tuple) do
    Enum.any?(adj_tuple, fn {fst, snd} -> fst == snd end)
  end

  defp have_strict_pair(adj_tuple) do
    Enum.any?(adj_tuple, fn {fst, snd} ->
      fst == snd &&
        Enum.count(adj_tuple) - (Enum.filter(adj_tuple, &(&1 != {fst, snd})) |> Enum.count()) == 1
    end)
  end

  defp only_increase(adj_tuple) do
    Enum.all?(adj_tuple, fn {fst, snd} -> fst <= snd end)
  end
end
