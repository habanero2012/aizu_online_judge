class Node
  attr_reader :value, :next
  attr_accessor :prev

  def initialize(value)
    @value = value
    @next = @prev = nil
  end

  def next=(node)
    @next = node
    node.prev = self if node
  end
end

class List
  def initialize
    @first_node = @last_node = nil
  end

  def insert(value)
    if @first_node.nil?
      @first_node = @last_node = Node.new(value)
      return
    end

    node = Node.new(value)
    node.next = @first_node
    @first_node = node
  end

  def delete(value)
    node = @first_node
    while node
      return delete_of(node) if node.value == value
      node = node.next
    end
  end

  def delete_first
    delete_of(@first_node)
  end

  def delete_last
    delete_of(@last_node)
  end

  def each
    node = @first_node
    while node
      yield node
      node = node.next
    end
  end

  private

  def delete_of(node)
    return if node.nil?

    next_node = node.next
    next_node.prev = nil if next_node
    prev_node = node.prev
    prev_node.next = next_node if prev_node

    @first_node = next_node if node == @first_node
    @last_node = prev_node if node == @last_node
  end
end

list = List.new
gets.to_i.times do
  command, num = gets.split
  case command
  when 'insert'
    list.insert(num.to_i)
  when 'delete'
    list.delete(num.to_i)
  when 'deleteFirst'
    list.delete_first
  when 'deleteLast'
    list.delete_last
  end
end

result = []
list.each do |n|
  result << n.value
end

puts result.join("\s")
