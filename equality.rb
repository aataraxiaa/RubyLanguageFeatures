# Source: https://dev.to/asterite/why-i-love-ruby-part-1-20h2
# Takeaways
# 1. In Ruby you can compare any two objects and Ruby will do the most intuitive thing.
# 2. Another nice thing about equality in Ruby is that you get sensible defaults, and you can compare any two objects out of the box.

# 1. In Ruby you can compare any two objects and Ruby will do the most intuitive thing.
puts '# 1. In Ruby you can compare any two objects and Ruby will do the most intuitive thing.'

puts 1 == 1
puts 1 == 1.0
puts [1, 2] == [1, 2]

# Even circular references work
a = []
a << a
puts a == a


# 2. Another nice thing about equality in Ruby is that you get sensible defaults, and you can compare any two objects out of the box.
puts "\n# 2. Another nice thing about equality in Ruby is that you get sensible defaults, and you can compare any two objects out of the box."

Point = Struct.new(:x, :y)
p1 = Point.new(1, 2)
p2 = Point.new(1, 2)
puts p1 == p2
