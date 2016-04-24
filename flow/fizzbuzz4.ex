# ControlFlow-1

defmodule FizzBuzz do
  def upto(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  defp fizzbuzz(n) do
    n_and_rems = {n, rem(n,3), rem(n,5)}
    case n_and_rems do
      {_, 0, 0} -> "FizzBuzz"
      {_, 0, _} -> "Fizz"
      {_, _, 0} -> "Buzz"
      {n, _, _} -> n
    end
  end
end
