defmodule FizzBuzz do
  def upto(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  defp fizzbuzz(n), do: fizzword(n, rem(n, 3), rem(n, 5))

  defp fizzword(_n, 0, 0), do: "FizzBuzz"
  defp fizzword(_n, 0, _), do: "Fizz"
  defp fizzword(_n, _, 0), do: "Buzz"
  defp fizzword( n, _, _), do: n
end
