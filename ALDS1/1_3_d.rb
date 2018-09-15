class Lake
  attr_reader :left, :right, :area

  def initialize(left, right)
    @left = left
    @right = right
    @area = right - left
  end

  def under_layer?(lake)
    lake.left < left && right < lake.right
  end

  def sum(lake)
    @area += lake.area
  end
end

sections = gets.chomp.split('')
lakes = []

down_hill_pos = []

sections.each_with_index do |section, i|
  case section
  when '_'
  when '\\'
    down_hill_pos << i
  when '/'
    unless down_hill_pos.empty?
      lake = Lake.new(down_hill_pos.pop, i)
      while !lakes.empty? && lakes.last.under_layer?(lake)
        under_lake = lakes.pop
        lake.sum(under_lake)
      end
      lakes << lake
    end
  end
end

puts lakes.sum(0, &:area)
puts ([lakes.count] + lakes.map(&:area)).join("\s")
