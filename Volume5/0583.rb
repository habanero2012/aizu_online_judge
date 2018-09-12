gets
nums = gets.split.map(&:to_i).sort
min = nums.shift

puts 1

2.upto(min) do |n|
  next unless (min % n).zero?
  puts n if nums.all? { |num| (num % n).zero? }
end

