class Node
  attr_accessor :left, :right, :key, :priority

  def initialize(key:, priority:)
    @key = key
    @priority = priority
  end
end

def find(node, key)
  return node if node.nil? || node.key == key
  if key < node.key
    find(node.left, key)
  else
    find(node.right, key)
  end
end

def in_order(node, arr = [])
  return if node.nil?
  in_order(node.left, arr)
  arr << node.key
  in_order(node.right, arr)
  arr
end

def pre_order(node, arr = [])
  return if node.nil?
  arr << node.key
  pre_order(node.left, arr)
  pre_order(node.right, arr)
  arr
end


def right_rotate(t)
  s = t.left
  t.left = s.right
  s.right = t
  s
end

def left_rotate(t)
  s = t.right
  t.right = s.left
  s.left = t
  s
end

def insert(t, key, priority)
  return Node.new(key: key, priority: priority) if t.nil?
  return t if t.key == key

  if key < t.key
    t.left = insert(t.left, key, priority)
    t = right_rotate(t) if t.priority < t.left.priority
  else
    t.right = insert(t.right, key, priority)
    t = left_rotate(t) if t.priority < t.right.priority
  end
  t
end

def delete(t, key)
  return if t.nil?
  if key < t.key
    t.left = delete(t.left, key)
  elsif key > t.key
    t.right = delete(t.right, key)
  else
    return _delete(t, key)
  end
  t
end

def _delete(t, key)
  return nil if t.left.nil? && t.right.nil?

  if t.left.nil?
    t = left_rotate(t)
  elsif t.right.nil?
    t = right_rotate(t)
  else
    if t.left.priority > t.right.priority
      t = right_rotate(t)
    else
      t = left_rotate(t)
    end
  end
  delete(t, key)
end

input = File.join(File.dirname(__FILE__), '../input.txt')
$stdin = StringIO.new(File.read(input))


node = nil
gets.to_i.times do
  command, key, priority = gets.split

  case command
  when 'insert'
    node = insert(node, key.to_i, priority.to_i)
  when 'find'
    puts find(node, key.to_i) ? 'yes' : 'no'
  when 'delete'
    node = delete(node, key.to_i)
  when 'print'
    puts "\s" + in_order(node).join("\s")
    puts "\s" + pre_order(node).join("\s")
  end
end

