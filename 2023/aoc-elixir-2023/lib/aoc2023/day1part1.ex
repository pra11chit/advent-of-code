defmodule Aoc2023.Day1part1 do
  def get_int([]) do
    nil
  end

  def get_int([head | tail]) do
    case Integer.parse(head) do
      {int, _rem} -> int
      :error -> get_int(tail)
    end
  end

  def cal_val(list) do
    num1 = get_int(list)
      |> Integer.to_string
    num2 = list
      |> Enum.reverse
      |> get_int
      |> Integer.to_string
    num1 <> num2
    |> String.to_integer
  end

  def run do
    File.stream!("lib/input.txt")
  |> Stream.map(fn line -> String.trim(line, "\n") end)
  |> Stream.map(fn line -> cal_val(String.graphemes(line)) end)
  |> Enum.sum()
  |> IO.puts
  end

end
