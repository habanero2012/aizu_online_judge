loop do
  n, m = gets.split.map(&:to_i)
  break if n.zero? && m.zero?

  question = {}
  m.times { |i| question[i + 1] = 0 }

  n.times do
    gets.split.map(&:to_i).each_with_index { |v, i| question[i + 1] += 1 if v == 1 }
  end

  i = 0
  puts Hash[question.sort_by { |k, v| [-v, i += 1] }].keys.join("\s")
end
