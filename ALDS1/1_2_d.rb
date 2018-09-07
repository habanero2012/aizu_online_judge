def insertion_sort(arr, interval)
  count = 0

  size = arr.size
  interval.upto(size - 1) do |i|
    v = arr[i]
    j = i - interval
    while j >= 0 && arr[j] > v
      arr[j + interval] = arr[j]
      j -= interval
      count += 1
    end
    arr[j + interval] = v
  end

  count
end

def shell_sort(arr)
  count = 0
  intervals = create_intervals(arr.size)
  intervals.each { |interval| count += insertion_sort(arr, interval) }
  {G: intervals, count: count}
end

def create_intervals(size)
  h = 1
  intervals = [1]
  loop do
    h = 3 * h + 1
    break if size < h
    intervals.unshift(h)
  end
  intervals
end

arr = readlines[1..-1].map(&:to_i)
result = shell_sort(arr)
puts result[:G].size
puts result[:G].join("\s")
puts result[:count]
puts arr
