input = File.join(File.dirname(__FILE__), '../input.txt')
$stdin = StringIO.new(File.read(input))


sections = gets.chomp.split('')
lakes = []

pos = 0
while pos < sections.size
  section = sections[pos]
  if ['_', '/'].include?(section)
    pos += 1
    next
  end

  depth = 1
  area = 0.5
  ahead_pos = pos + 1
  lake_found = false

  while ahead_pos < sections.size
    ahead_section = sections[ahead_pos]

    if ahead_section == '_'
      area += depth
      ahead_pos += 1
      next
    end

    if ahead_section == '\\'
      depth += 1
      area += 0.5 + (depth - 1)
      ahead_pos += 1
      next
    end

    if ahead_section == '/'
      area += 0.5 + (depth - 1)
      depth -= 1
      if depth.zero?
        lakes << area
        pos = ahead_pos + 1
        lake_found = true
        break
      end

      ahead_pos += 1
    end
  end

  pos += 1 unless lake_found
end

puts lakes.map(&:to_i).sum
puts ([lakes.count] + lakes.map(&:to_i)).join("\s")
