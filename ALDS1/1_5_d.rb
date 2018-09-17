input = File.join(File.dirname(__FILE__), '../input.txt')
$stdin = StringIO.new(File.read(input))

gets
arr = gets.split.map(&:to_i)

@count = 0

def merge_sort(arr)
  return arr if arr.size <= 1

  mid = arr.size / 2
  left = arr[0..(mid - 1)]
  right = arr[mid..(arr.size - 1)]

  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    if left[0] < right[0]
      result << left.shift
    else
      # 右の要素が左の残りの要素より小さい場合、
      # 左の要素の残りの数だけ反転して、ソート済みの配列に並ぶ
      @count += left.size
      result << right.shift
    end
  end

  result << left.shift until left.empty?
  result << right.shift until right.empty?
  result
end

merge_sort(arr)
puts @count
