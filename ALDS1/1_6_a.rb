def counting_sort(arr)
  result = Array.new(arr.size)
  counter = Hash.new { |h, k| h[k] = 0 }

  arr.each { |v| counter[v] += 1 }

  1.upto(arr.max) do |v|
    counter[v] = counter[v] + counter[v - 1]
  end

  arr.reverse_each do |v|
    result[counter[v] - 1] = v
    counter[v] -= 1
  end

  result
end

gets
arr = gets.split.map(&:to_i)
puts counting_sort(arr).join("\s")
