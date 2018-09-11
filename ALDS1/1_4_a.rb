n = gets.to_s
s = gets.split.map(&:to_i)
q = gets.to_s
t = gets.split.map(&:to_i)

puts t.map{|v| s.include?(v) ? 1 : 0}.inject(&:+)
