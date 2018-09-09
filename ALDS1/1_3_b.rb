n, q = gets.split.map(&:to_i)
processes = readlines.map(&:split).each { |p| p[1] = p[1].to_i }

time = 0
until processes.empty?
  p = processes.shift
  p[1] = p[1] - q
  time += q
  if p[1] > 0
    processes.push(p)
  else
    time += p[1]
    puts "#{p[0]} #{time}"
  end
end
