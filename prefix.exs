# Ex: Functions-4

prefix = fn x ->
  fn ending -> "#{x} #{ending}" end
end

mrs = prefix.("Mrs")
IO.puts mrs.("Smith")
IO.puts prefix.("Elixir").("Rocks")
