def triangle?(a, b, c)
  a + b > c
end

def decide_type(a, b, c)
  a ** 2 + b ** 2 <=> c ** 2
end

triangle_count = 0
acute_angle_triangle = 0
right_angle_triangle = 0
obtuse_triangle = 0

loop do
  a, b, c = gets.split.map(&:to_i).sort
  break unless triangle?(a, b, c)

  triangle_count += 1
  case decide_type(a, b, c)
  when 1
    acute_angle_triangle += 1
  when 0
    right_angle_triangle += 1
  when -1
    obtuse_triangle += 1
  end
end

puts [triangle_count, right_angle_triangle, acute_angle_triangle, obtuse_triangle].join("\s")
