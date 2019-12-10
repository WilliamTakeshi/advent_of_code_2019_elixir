defmodule AdventOfCode.Day02 do
  def part1(args) do
    args
    |> List.replace_at(1, 12)
    |> List.replace_at(2, 2)
    |> do_computation(0)
  end

  def part2(args) do
    noun_verb_combinations = for x <- 0..99, y <- 0..99, x != y, do: [x, y]
    [noun, verb] = find_pair(args, noun_verb_combinations)
    IO.puts(100 * noun + verb)
  end

  defp find_pair(args, noun_verb_combinations) do
    [noun_verb | next_noun_verb_combinations] = noun_verb_combinations

    computation =
      args
      |> List.replace_at(1, Enum.at(noun_verb, 0))
      |> List.replace_at(2, Enum.at(noun_verb, 1))
      |> do_computation(0)

    case List.first(computation) == 19_690_720 do
      true -> noun_verb
      false -> find_pair(args, next_noun_verb_combinations)
    end
  end

  defp do_computation(args, arg_chunk) do
    args_split =
      args
      |> Enum.drop(arg_chunk * 4)
      |> Enum.take(4)

    fst_term = Enum.at(args_split, 1)
    snd_term = Enum.at(args_split, 2)
    result_term = Enum.at(args_split, 3)

    case args_split do
      [1 | _] ->
        new_args =
          List.update_at(args, result_term, fn _ ->
            Enum.at(args, fst_term) + Enum.at(args, snd_term)
          end)

        do_computation(new_args, arg_chunk + 1)

      [2 | _] ->
        new_args =
          List.update_at(args, result_term, fn _ ->
            Enum.at(args, fst_term) * Enum.at(args, snd_term)
          end)

        do_computation(new_args, arg_chunk + 1)

      [99 | _] ->
        args

      _ ->
        args
    end
  end
end
