# ListsAndRecursion-5

defmodule MyList do

  def all?(list, f), do: all?(list, f, true)
  defp all?(_list, _f, false), do: false
  defp all?(_list, _f, nil), do: false
  defp all?([], _f, _bool), do: true
  defp all?([h|t], f, _bool) do
    all?(t, f, f.(h))
  end

  def each([], _f), do: :ok
  def each([h|t], f) do
    f.(h)
    each(t, f)
  end

  def filter(list, f), do: filter(list, f, [])
  defp filter([], _f, acc), do: acc
  defp filter([h|t], f, acc) do
    if f.(h) do
      filter(t, f, acc ++ [h])
    else
      filter(t, f, acc)
    end
  end

  def split(list, count), do: split(list, count, {[],[]})
  defp split([], _count, res), do: res
  defp split([h|t], 0, {a,b}) do
    split(t, 0, {a, b ++ [h]})
  end
  defp split([h|t], count, {a,b}) do
    split(t, count - 1, {a ++ [h], b})
  end

  def take(list, count) do
    {res, _} = split(list, count)
    res
  end

  # ListsAndRecursion-6

  def flatten(list), do: flatten(list, [])
  defp flatten([], res), do: Enum.reverse(res)
  defp flatten([h|t], res) do
    if is_list(h) do
      flatten(h, res, t)
    else
      flatten(t, [h | res])
    end
  end
  defp flatten([], res, not_done), do: flatten(not_done, res)
  defp flatten([h|t], res, not_done) do
    if is_list(h) do
      flatten(h, res, [t | not_done])
    else
      flatten(t, [h | res], not_done)
    end
  end
end
