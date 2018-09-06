n = gets.chomp.to_i
r = Array.new(n) { gets.chomp.to_i }

max = r.last - r.first
min_r = r.shift
r.each do |v|
  max = [max, v - min_r].max
  min_r = [v, min_r].min
end

puts max
