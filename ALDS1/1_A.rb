gets.to_i
arr = gets.split.map(&:to_i)

puts arr.join("\s")

1.step(arr.size - 1) do |i|
  v = arr[i]
  j = i - 1
  while j >= 0 && arr[j] > v
    arr[j + 1] = arr[j]
    j -= 1
  end
  arr[j + 1] = v

  puts arr.join("\s")
end
