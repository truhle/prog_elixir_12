# ListsAndRecursion-7

defmodule MyList do
  def span(from, to) when from <= to, do: span(from, to, [])
  defp span(from, from, range), do: [ from | range ]
  defp span(from, to, range) do
    span(from, to - 1, [ to | range ])
  end
end

defmodule MyPrime do
  import MyList

  def up_to(n) do
    nums = span(2, n)
    not_primes = for i <- nums, do: if not_prime?(i), do: i
    nums -- not_primes
  end

  def not_prime?(2), do: true
  def not_prime?(3), do: true
  def not_prime?(n) do
    divisors = span(2, div(n,2))
    if Enum.all?(divisors, &(rem(n,&1)!==0)), do: false, else: true
  end
end
