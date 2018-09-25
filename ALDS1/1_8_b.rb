class Node
  attr_accessor :left, :right, :parent, :value

  def initialize(value)
    @value = value
  end
end

class Tree
  def initialize
    @root = nil
  end

  def insert(node)
    parent = nil
    x = @root
    until x.nil?
      parent = x
      if node.value < x.value
        x = x.left
      else
        x = x.right
      end
    end

    node.parent = parent
    if parent.nil?
      @root = node
    elsif node.value < parent.value
      parent.left = node
    else
      parent.right = node
    end
  end

  def in_order(node = @root, arr = [])
    in_order(node.left, arr) if node.left
    arr << node.value
    in_order(node.right, arr) if node.right
    arr
  end

  def pre_order(node = @root, arr = [])
    arr << node.value
    pre_order(node.left, arr) if node.left
    pre_order(node.right, arr) if node.right
    arr
  end

  def find(value)
    x = @root
    until x.nil?
      return true if x.value == value

      if x.value > value
        x = x.left
        next
      end

      x = x.right if x.value < value
    end
    false
  end
end

tree = Tree.new
gets.to_i.times do
  command, value = gets.split

  case command
  when 'insert'
    tree.insert(Node.new(value.to_i))
  when 'find'
    puts tree.find(value.to_i) ? 'yes' : 'no'
  when 'print'
    puts "\s" + tree.in_order.join("\s")
    puts "\s" + tree.pre_order.join("\s")
  end
end
