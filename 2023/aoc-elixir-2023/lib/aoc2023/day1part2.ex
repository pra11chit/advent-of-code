# referred ryan winchester's solution: https://github.com/ryanwinchester/advent-of-code-elixir/blob/master/lib/advent_2023/day_01.ex
defmodule Aoc2023.Day1part2 do

  defp get_int(str, num1 \\ nil, num2 \\ nil)

  defp get_int("one" <> tail, num1, _num2) do
    get_int("e" <> tail, num1 || 1, 1)
  end

  defp get_int("two" <> tail, num1, _num2) do
    get_int("o" <> tail, num1 || 2, 2)
  end

  defp get_int("three" <> tail, num1, _num2) do
    get_int("e" <> tail, num1 || 3, 3)
  end

  defp get_int("four" <> tail, num1, _num2) do
    get_int("r" <> tail, num1 || 4, 4)
  end

  defp get_int("five" <> tail, num1, _num2) do
    get_int("e" <> tail, num1 || 5, 5)
  end

  defp get_int("six" <> tail, num1, _num2) do
    get_int("x" <> tail, num1 || 6, 6)
  end

  defp get_int("seven" <> tail, num1, _num2) do
    get_int("n" <> tail, num1 || 7, 7)
  end

  defp get_int("eight" <> tail, num1, _num2) do
    get_int("t" <> tail, num1 || 8, 8)
  end

  defp get_int("nine" <> tail, num1, _num2) do
    get_int("e" <> tail, num1 || 9, 9)
  end

  defp get_int(<<digit, tail::binary>>, num1, _num2) when digit in ?0..?9 do
    get_int(tail, num1 || digit - ?0, digit - ?0)
  end

  defp get_int(<<_head, tail::binary>>, num1, num2) do
    get_int(tail, num1, num2)
  end

  defp get_int(<<>>, num1, num2) do
    num1 * 10 + num2
  end

  def run() do
    File.stream!('lib/input.txt')
    |> Stream.map(&(String.trim &1))
    |> Enum.map(&(get_int &1))
    |> Enum.map(&(IO.puts/1))
  end
end
