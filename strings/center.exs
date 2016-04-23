# StringsAndBinaries-5

defmodule Center do
  def center(string_list) do
    longest = Enum.max_by(string_list, &(String.length/1))
              |> String.length()
    Enum.each(string_list, fn str ->
      str_length = String.length(str)
      new_length = div(longest - str_length, 2) + str_length
      IO.puts(String.rjust(str, new_length))
    end)
  end
end
