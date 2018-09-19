class Node
  attr_reader :value, :left, :right
  attr_accessor :parent

  def initialize(value)
    @value = value
  end

  def left=(node)
    @left = node
    node.parent = self
  end

  def right=(node)
    @right = node
    node.parent = self
  end
end

class Tree
  def initialize
    @map = {}
    @root = nil
  end

  def add(value, left, right)
    node(value)
    node(value).left = node(left) if left != -1
    node(value).right = node(right) if right != -1
  end

  def pre_order(node = @root, &block)
    yield node.value
    pre_order(node.left, &block) if node.left
    pre_order(node.right, &block) if node.right
  end

  def in_order(node = @root, &block)
    in_order(node.left, &block) if node.left
    yield node.value
    in_order(node.right, &block) if node.right
  end

  def post_order(node = @root, &block)
    post_order(node.left, &block) if node.left
    post_order(node.right, &block) if node.right
    yield node.value
  end

  def detect_root
    _, node = @map.first
    node = node.parent while node.parent
    @root = node
  end

  private

  def node(value)
    return @map[value] if @map.key?(value)
    @map[value] = Node.new(value)
  end
end

tree = Tree.new
gets.to_i.times { tree.add(*gets.split.map(&:to_i)) }
tree.detect_root

puts 'Preorder'
puts ' ' + [].tap { |arr| tree.pre_order { |v| arr << v } }.join("\s")

puts 'Inorder'
puts ' ' + [].tap { |arr| tree.in_order { |v| arr << v } }.join("\s")

puts 'Postorder'
puts ' ' + [].tap { |arr| tree.post_order { |v| arr << v } }.join("\s")
