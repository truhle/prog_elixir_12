# ControlFlow-3

defmodule Ok do
  def ok!({:ok, data}), do: data
  def ok!({_, info}), do: raise info
end
