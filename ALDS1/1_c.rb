class Integer
  def prime?
    return true if self == 2

    return false if self < 2 || (self % 2).zero?

    sqrt = Math.sqrt(self)
    3.step(sqrt, 2) do |i|
      return false if (self % i).zero?
    end

    true
  end
end

answer = 0
count = gets.chomp.to_i
count.times do
  n = gets.chomp.to_i
  answer += 1 if n.prime?
end

puts answer
