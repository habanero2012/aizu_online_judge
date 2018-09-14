class Path
  def initialize
    @direction = Hash.new { |h, k| h[k] = [] }
    @number_used = Hash.new { |h, k| h[k] = false }
  end

  def add(x, y)
    @direction[x] << y
    @direction[y] << x
  end

  def calc_length
    @max_length = 0
    @direction.keys.each do |n|
      step(n, 1)
    end
    @max_length
  end

  def step(n, length)
    @number_used[n] = true

    @direction[n].each do |n2|
      unless @number_used[n2]
        @max_length = [@max_length, length + 1].max
        step(n2, length + 1)
      end
    end

    @number_used[n] = false
  end
end

loop do
  n = gets.to_i
  break if n.zero?

  path = Path.new
  n.times { path.add(*gets.split.map(&:to_i)) }
  puts path.calc_length
end
