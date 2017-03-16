#!usr/bin/ruby

x1 = gets.chomp
y1 = gets.chomp
z1 = gets.chomp
x2 = gets.chomp
y2 = gets.chomp
z2 = gets.chomp
x3 = gets.chomp
y3 = gets.chomp
z3 = gets.chomp

puts "Got (#{x1}, #{y1}, #{z1}), (#{x2}, #{y2}, #{z2}), (#{x3}, #{y3}, #{z3})"

def toVector(x, y, z)
  {x: x.to_i, y: y.to_i, z: z.to_i}
end

p1 = toVector(x1, y1, z1)
p2 = toVector(x2, y2, z2)
p3 = toVector(x3, y3, z3)

def subtract(p1, p2)
  toVector(p1[:x] - p2[:x], p1[:y] - p2[:y], p1[:z] - p2[:z])
end

paralell1 = subtract(p1, p2)
paralell2 = subtract(p2, p3)

puts paralell1
puts paralell2

def cross_prod(v1, v2)
  x = v1[:y] * v2[:z] - v1[:z] * v2[:y]
  y = v1[:z] * v2[:x] - v1[:x] * v2[:z]
  z = v1[:x] * v2[:y] - v1[:y] * v2[:x]
  toVector(x, y, z)
end

normal = cross_prod(paralell1, paralell2)
puts normal

def scale_vector(p1)
  x = p1[:x]
  y = p1[:y]
  z = p1[:z]
  lowest = x.abs
  lowest = y.abs if y.abs < x.abs
  lowest = z.abs if z.abs < lowest
  lowest.downto(0).each do |i|
    if x % i == 0 and y % i == 0 and z % i == 0
      return toVector((x/i).to_i, (y/i).to_i, (z/i).to_i)
    end
  end
  p1
end

scaled_normal = scale_vector(normal)
puts scaled_normal

cartesian_a = scaled_normal[:x]
cartesian_b = scaled_normal[:y]
cartesian_c = scaled_normal[:z]
cartesian_d = scaled_normal[:x] * - p1[:x] + scaled_normal[:y] * - p1[:y] + scaled_normal[:z] * - p1[:z]


puts "Cartesian equation: #{cartesian_a}x + #{cartesian_b}y + #{cartesian_c}z + #{cartesian_d} = 0"

exit

