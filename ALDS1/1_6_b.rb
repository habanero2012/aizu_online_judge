def partition(arr, p, r)
  x = arr[r]
  i = p - 1
  p.upto(r - 1) do |j|
    if arr[j] <= x
      i += 1
      arr[i], arr[j] = arr[j], arr[i]
    end
  end
  arr[i + 1], arr[r] = arr[r], arr[i + 1]
  i + 1
end

gets
arr = gets.split.map(&:to_i)
idx = partition(arr, 0, arr.size - 1)
puts arr.map.with_index { |n, i| i == idx ? "[#{n}]" : n }.join("\s")
