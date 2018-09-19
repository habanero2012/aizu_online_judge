class Card
  include Comparable

  attr_reader :design
  attr_reader :number

  def initialize(design, number)
    @design = design
    @number = number
  end

  def <=>(other)
    @number <=> other.number
  end

  def to_s
    "#{@design} #{@number}"
  end
end

def partition(a, p, r)
  x = a[r]
  i = p - 1
  p.upto(r - 1) do |j|
    if a[j] <= x
      i += 1
      a[i], a[j] = a[j], a[i]
    end
  end
  a[i + 1], a[r] = a[r], a[i + 1]
  i + 1
end

def quicksort(a, p, r)
  if p < r
    q = partition(a, p, r)
    quicksort(a, p, q - 1)
    quicksort(a, q + 1, r)
  end
end

def stable?(orig_order, after_order)
  orig_order.all? { |e| e[1].join == after_order[e[0]].join }
end

n = gets.to_i
cards = n.times.map { d, n = gets.split; Card.new(d, n.to_i) }

orig_order = Hash.new { |h, k| h[k] = [] }
cards.each { |c| orig_order[c.number] << c.design }

quicksort(cards, 0, cards.size - 1)


after_order = Hash.new { |h, k| h[k] = [] }
cards.each { |c| after_order[c.number] << c.design }

puts stable?(orig_order, after_order) ? 'Stable' : 'Not stable'
puts cards
