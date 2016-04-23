# StringsAndBinaries-2

defmodule Anagram do
  def anagram?(word1, word2) do
    Enum.sort(ensure_list word1) == Enum.sort(ensure_list word2)
  end

  def ensure_list(word) do
    if is_list(word), do: word, else: String.to_char_list word
  end
end
