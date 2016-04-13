defmodule MyList do
  # ListsAndRecursion-4
  # return a list spanning a range from a given integer to
  # another given integer

  def span(from, to) when from <= to, do: span(from, to, [])
  defp span(from, from, range), do: [ from | range ]
  defp span(from, to, range) do
    span(from, to - 1, [ to | range ])
  end
end
