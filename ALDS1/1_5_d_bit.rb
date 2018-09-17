class BIT
  def initialize(size)
    @arr = Array.new(size + 1) { 0 }
  end

  def get(i)
    sum = 0
    while i > 0
      sum += @arr[i]
      i -= i & -i
    end
    sum
  end

  def add(i, val = 1)
    while i < @arr.size
      @arr[i] += val
      i += i & -i
    end
  end
end

input = File.join(File.dirname(__FILE__), '../input.txt')
$stdin = StringIO.new(File.read(input))

gets
arr = gets.split.map(&:to_i)
arr.map! { |v| v + 1 } # 要素が0の場合に対処するため+1する
bit = BIT.new(arr.max)

count = 0
arr.each_with_index do |val, i|
  # bit.get(val) : val以上の数値がこれまで何回出現しているか
  #
  # 例 arr = [3, 5, 2, 1, 4] の場合
  #
  # val=1, i=3のとき
  # bit.get(1) => 0 (1以上の数値は0回出現)
  # val=1の配列のインデックスは3(i=3より)なので、
  # val=1の前に要素が3つあったことが分かる
  # 「(val=1より大きい要素の数) = (val=1の前に要素が3つ) - (1以上の数値は0回出現) 」
  # より、val=1の前に、val=1より大きい要素が3つあったことが分かる
  #
  #
  # val=4, i=4のとき
  # bit.get(4) => 3 (4以上の数値は3回出現)
  # val=4の配列のインデックスは4(i=4より)なので、
  # val=4の前に要素が4つあったことが分かる
  # 「(val=4より大きい要素の数) = (val=4の前に要素が4つ) - (4以上の数値は3回出現) 」
  # より、val=1の前に、val=4より大きい要素が1つ合ったことが分かる
  #
  count += i - bit.get(val)
  bit.add(val)

  #p "val => #{val}: count =>#{count}: bit.get(#{val}) => #{bit.get(val)}"
  #p bit
end

puts count
