class Card
  include Comparable

  def initialize(val)
    @val = val
  end

  def mark
    @val[0]
  end

  def number
    @val[1].to_i
  end

  def <=>(other)
    number <=> other.number
  end

  def to_s
    @val.dup
  end
end

def bubble_sort(arr)
  n = arr.size - 1
  0.upto(n) do |i|
    n.downto(i + 1) do |j|
      arr[j - 1], arr[j] = arr[j], arr[j - 1] if arr[j] < arr[j - 1]
    end
  end
end

def selection_sort(arr)
  n = arr.size - 1
  0.upto(n) do |i|
    mini_j = i
    i.upto(n) do |j|
      mini_j = j if arr[j] < arr[mini_j]
    end
    arr[i], arr[mini_j] = arr[mini_j], arr[i]
  end
end

def same_order?(cards, sorted)
  orig_order = order_hash(cards)
  sorted_order = order_hash(sorted)
  orig_order.map { |k, v| sorted_order[k] == v }.all?
end

def order_hash(cards)
  order = Hash.new { |h, k| h[k] = '' }
  cards.each { |c| order[c.number] << c.mark }
  order
end


gets.to_i
cards = gets.split.map { |v| Card.new(v) }

bubble = cards.dup
selection = cards.dup

bubble_sort(bubble)
puts bubble.join("\s")
puts same_order?(cards, bubble) ? 'Stable' : 'Not stable'

selection_sort(selection)
puts selection.join("\s")
puts same_order?(cards, selection) ? 'Stable' : 'Not stable'
