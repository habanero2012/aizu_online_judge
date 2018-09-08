stack = []
operators = %w[+ - *]

gets.split.each do |value|
  if operators.include?(value)
    val1, val2 = stack.pop(2)
    result = eval("#{val1} #{value} #{val2}")
    stack.push(result)
  else
    stack.push(value)
  end
end

puts stack.first
