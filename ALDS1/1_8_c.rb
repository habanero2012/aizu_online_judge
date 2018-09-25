class Node
  attr_accessor :left, :right, :parent, :value

  def initialize(value)
    @value = value
  end

  def remove
    case children_count
    when 0
      replace_parent_pointer
    when 1
      replace_node = left ? left : right
      replace_parent_pointer(replace_node)
    when 2
      replace_node = next_section_point

      replace_node.left = left
      left.parent = replace_node

      if replace_node.value != right.value
        replace_node.right = right
        right.parent = replace_node
      end

      replace_node.replace_parent_pointer

      replace_parent_pointer(replace_node)
    end

    self.parent = nil
    self.left = nil
    self.right = nil
  end

  def replace_parent_pointer(replace_node = nil)
    replace_node.parent = parent if replace_node

    return if parent.nil?

    if parent&.left&.value == value
      parent.left = replace_node
    else
      parent.right = replace_node
    end
  end

  def children_count
    return 2 if left && right
    return 1 if left || right
    0
  end

  private

  def next_section_point
    node = right
    node = node.left until node.left.nil?
    node
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
      return x if x.value == value

      if x.value > value
        x = x.left
        next
      end

      x = x.right if x.value < value
    end
    false
  end

  def delete(value)
    node = find(value)
    return unless node
    node.remove
  end
end

input = File.join(File.dirname(__FILE__), '../input.txt')
$stdin = StringIO.new(File.read(input))


tree = Tree.new
gets.to_i.times do
  command, value = gets.split

  case command
  when 'insert'
    tree.insert(Node.new(value.to_i))
  when 'find'
    puts tree.find(value.to_i) ? 'yes' : 'no'
  when 'delete'
    tree.delete(value.to_i)
  when 'print'
    puts "\s" + tree.in_order.join("\s")
    puts "\s" + tree.pre_order.join("\s")
  end
end
