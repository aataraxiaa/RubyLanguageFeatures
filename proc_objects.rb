# Source: https://www.codewithjason.com/ruby-procs/
# Takeaways
# 1. A Proc object is an encapsulation of a block of code
# 2. A Proc object can be stored in a local variable
# 3. A Proc object can be passed to a method or another Proc
# 4. Every block in Ruby is a Proc object
# 5. & converts Proc into a block
# 6. Lambdas are also Proc objects
# 7. Proc objects are closures

# , 
# which can be stored in a local variable, passed to a method or another Proc, 
# and can be called. Proc is an essential concept in Ruby 
# and a core of its functional programming features.

# Let's break down some parts of this definition...

# A Proc object can be stored in a local variable
square = Proc.new { |x| x**2 }
puts square.call(3)

# A Proc object can be passed to a method or another Proc
# A method
def perform_operation(number, operation)
operation.call(number)
end

puts perform_operation(4, square)

# Another Proc
perform_operation_on = Proc.new do |number, operation|
    operation.call(number)
end

puts perform_operation_on.call(5, square)

# Proc objects and blocks

# Every block in Ruby is a Proc object
def takes_a_block(&block)
    puts block.class
end

takes_a_block { "hello" }

my_proc = Proc.new { "hello" }
takes_a_block &my_proc

# Proc objects and lambdas

# Lambdas are Proc objects (but a special kind, with different behaviour)

my_lambda = lambda { |x| x**2 }
puts perform_operation(6,my_lambda)
puts perform_operation_on.call(7,my_lambda)
puts my_lambda.class