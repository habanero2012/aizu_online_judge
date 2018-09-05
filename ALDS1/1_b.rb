def gcd(x, y)
  remainder = x % y
  return y if remainder.zero?

  gcd(y, remainder)
end

nums = gets.split.map(&:to_i)

puts gcd(nums.max, nums.min)
