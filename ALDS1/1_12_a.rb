class Vertex
  class << self
    def register(index, weights)
      @vertexes ||= {}
      @vertexes[index] = new(index, weights)
    end

    def find(index)
      @vertexes[index]
    end

    def each
      @vertexes.each { |_, v| yield v }
    end
  end

  attr_reader :index
  attr_accessor :parent

  def initialize(index, weights)
    @index = index
    @index_cost_map = weights.map.with_index { |e, i| e == -1 ? nil : [i, e] }.compact!.to_h
    @selected = false
  end

  def neighbors
    @neighbors ||= @index_cost_map.keys.map { |i| self.class.find(i) }
  end

  def neighbor?(other)
    @index_cost_map.key?(other.index)
  end

  def cost(other)
    @index_cost_map[other.index]
  end

  def selected?
    @selected
  end

  def select!
    @selected = true
  end
end

class Prim
  class << self
    def solve
      min_costs = Hash.new { |h, k| h[k] = Float::INFINITY }
      min_costs[0] = 0

      loop do
        min_cost = Float::INFINITY
        selected_vertex = nil
        Vertex.each do |v|
          if !v.selected? && min_costs[v.index] < min_cost
            selected_vertex = v
            min_cost = min_costs[v.index]
          end
        end

        break if selected_vertex.nil?

        selected_vertex.select!

        Vertex.each do |v|
          next if v.selected? || !selected_vertex.neighbor?(v)

          if selected_vertex.cost(v) < min_costs[v.index]
            min_costs[v.index] = selected_vertex.cost(v)
            v.parent = selected_vertex
          end
        end

      end

      sum = 0
      Vertex.each { |v| sum += v.parent.cost(v) if v.parent }
      sum
    end
  end
end

input = File.join(File.dirname(__FILE__), '../input.txt')
$stdin = StringIO.new(File.read(input))

n = gets.to_i
n.times do |i|
  Vertex.register(i, gets.strip.split.map(&:to_i))
end

puts Prim.solve
