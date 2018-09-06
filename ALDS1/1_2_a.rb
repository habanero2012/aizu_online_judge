def bubble_sort(arr)
  replace_count = 0
  replaced = true
  while replaced
    replaced = false
    (arr.size - 1).downto(1) do |i|
      if arr[i] < arr[i - 1]
        arr[i], arr[i - 1] = arr[i - 1], arr[i]
        replace_count += 1
        replaced = true
      end
    end
  end

  replace_count
end

gets
arr = gets.split.map(&:to_i)
result = bubble_sort(arr)
puts arr.join("\s")
puts result
