# Ex: Functions-2

fb = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, x -> x
end

IO.puts fb.(0, 0, 1)
IO.puts fb.(0, 1, 1)
IO.puts fb.(1, 0, 1)
IO.puts fb.(1, 1, 1)


# Ex: Functions-3

fizzbuzz = fn(n) -> fb.(rem(n,3), rem(n,5), n) end

IO.puts fizzbuzz.(10)
IO.puts fizzbuzz.(11)
IO.puts fizzbuzz.(12)
IO.puts fizzbuzz.(13)
IO.puts fizzbuzz.(14)
IO.puts fizzbuzz.(15)
IO.puts fizzbuzz.(16)
IO.puts fizzbuzz.(17)
