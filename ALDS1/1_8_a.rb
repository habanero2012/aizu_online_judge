class Node
  attr_accessor :left, :right, :parent, :value
  def initialize(value)
    @value = value
  end
end

@root = nil

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

def in_order(node, arr = [])
  in_order(node.left, arr) if node.left
  arr << node.value
  in_order(node.right, arr) if node.right
  arr
end

def pre_order(node, arr = [])
  arr << node.value
  pre_order(node.left, arr) if node.left
  pre_order(node.right, arr) if node.right
  arr
end


gets.to_i.times do
  command, value = gets.split

  case command
  when 'insert'
    insert(Node.new(value.to_i))
  when 'print'
    puts "\s" + in_order(@root).join("\s")
    puts "\s" + pre_order(@root).join("\s")
  end
end
