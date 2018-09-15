def binary_search(arr, key)
  left = 0
  right = arr.size
  while left < right
    mid = (left + right) / 2
    mid_val = arr[mid]

    if mid_val == key
      return mid
    elsif key < mid_val
      right = mid
    else
      left = mid + 1
    end
  end

  false
end

gets
s = gets.split.map(&:to_i)

gets
t = gets.split.map(&:to_i)

count = 0
t.each { |key| count += 1 if binary_search(s, key) }
puts count
