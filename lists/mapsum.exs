defmodule MyList do
  # ListsAndRecursion-1

  def mapsum([], _func) do
    0
  end

  def mapsum([head|tail], func) do
    func.(head) + mapsum(tail, func)
  end
end
