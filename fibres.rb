# Source: https://www.rubyguides.com/2019/11/what-are-fibers-in-ruby/
# Takeaways
# 1. Fibers are workers, they run code & keep track of their own progress. 
# In other words, fibers are a concurrency mechanism.
# 2. Create a fiber with Fiber.new & a block.
# 3. Fibers are stopped with the Fiber.yield method.
# 4. Fibers can be used with loops to create endless sequences.

# Create a fiber with Fiber.new & a block.
puts "# Create a fiber with Fiber.new & a block."
fiber_one = Fiber.new { puts "Hi "}
fiber_one.resume

# Fibers are stopped with the Fiber.yield method.
puts "\n # Fibers are stopped with the Fiber.yield method."
fiber_two = Fiber.new do
    puts 1
    Fiber.yield 
    puts 2 
end 
fiber_two.resume
fiber_two.resume

# Fibers can be used with loops to create endless sequences.
puts "\n # Fibers can be used with loops to create endless sequences."
factorial = Fiber.new do
  count = 1
  loop do
    Fiber.yield (1..count).inject(:*)
    count += 1
  end
end

puts Array.new(5) { factorial.resume }