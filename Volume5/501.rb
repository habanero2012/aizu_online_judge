input = File.join(File.dirname(__FILE__), '../input.txt')
$stdin = StringIO.new(File.read(input))

loop do
  n = gets.to_i
  break if n.zero?

  map = Array.new(n) { gets.split }.to_h
  gets.to_i.times do
    v = gets.chomp
    print(map[v] ? map[v] : v)
  end

  puts
end
