# StringsAndBinaries-4

defmodule Calculate do
  require Parse

  def calculate(char_list), do: calculate(char_list, {nil, '', ''})
  defp calculate([], {operator, d1, d2}) do
    d1 = Parse.number(d1)
    d2 = Parse.number(d2)
    case operator do
      '+' -> d1 + d2
      '-' -> d1 - d2
      '*' -> d1 * d2
      '/' -> d1 / d2
    end
  end
  defp calculate([h|t], {operator, d1, d2}) do
    cond do
      h in [42,43,45,47] -> calculate(t, {[h], d1, d2})
      h == 32 -> calculate(t, {operator, d1, d2})
      h in 48..57 ->
        case operator do
          nil -> calculate(t, {nil, d1 ++ [h], d2})
          _ -> calculate(t, {operator, d1, d2 ++ [h]})
        end
      true -> raise "Invalid digit #{[h]}"
    end
  end
end
