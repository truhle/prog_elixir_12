defmodule MyList do
  # ListsAndRecursion-2

  def my_max([]) do
    nil
  end

  def my_max([head|tail]) do
    my_max(tail, head)
  end

  defp my_max([], value) do
    value
  end

  defp my_max([head|tail], value) do
    new_val = cond do
      head >= value -> head
      true -> value
    end
    my_max(tail, new_val)
  end
end
