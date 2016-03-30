defmodule Chop do

  def guess(answer, low..high) when answer in low..high do
    val = div(high - low, 2) + low
    IO.puts "Is it #{val}"
    cond do
      val == answer -> val
      val < answer  -> guess(answer, (val + 1)..high)
      val > answer  -> guess(answer, low..(val - 1))
    end
  end
end
