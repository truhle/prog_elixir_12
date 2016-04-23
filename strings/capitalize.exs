# StringsAndBinaries-6

defmodule Capitalize do
  def sentences(str) do
    String.split(str, ". ")
    |> Enum.map(&(String.capitalize/1))
    |> Enum.join(". ")
  end
end
