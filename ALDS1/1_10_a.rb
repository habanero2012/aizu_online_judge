def fib(n)
  a = 0
  b = 1
  c = 1

  n.times do
    c = a + b

    a = b
    b = c
  end
  c
end

puts fib(gets.to_i)

