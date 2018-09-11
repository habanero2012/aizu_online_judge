arr = []

n = gets.to_i
n.times do
  command, num = gets.split.map(&:to_i)
  case command
  when 0
    arr.push(num)
  when 1
    puts arr[num]
  when 2
    arr.pop
  end
end
