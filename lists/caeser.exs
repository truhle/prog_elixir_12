defmodule MyList do
  # ListsAndRecursion-3
  
  def caeser([]), do: []
  def caeser([head|tail]) do
    new_head = cond do
      head + 13 > 122 -> head - 13
      true -> head + 13
    end
    [ new_head | caeser(tail) ]
  end
end

IO.puts MyList.caeser('ryvkve')
# => elixir
