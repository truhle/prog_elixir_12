# StringsAndBinaries-1

defmodule Ascii do
  def ascii?([]), do: true
  def ascii?([h|t]) do
    if h in 32..126, do: ascii?(t), else: false
  end
end
