# Source: https://thoughtbot.com/blog/ruby-splat-operator
# Takeaways
# 1. `*` is the splat operator
# 2. It destructures and constructs arrays
# 3. Used for variable function arguments

# Destructuring arrays
puts "# Destructuring arrays"
array = [1,2,3]
first, rest, last = *array
puts "First of #{array} is #{first}"
puts "Rest of #{array} is #{rest}"
puts "Last of #{array} is #{last}" 

# Constructing arrays
puts "\n# Constructing arrays"
array = *1,2,3
puts "Popping #{array} gives #{array.pop}"

# When does it construct? Defining a method!"
puts "\n# When does it construct? Defining a method!"
def variable_args(*args)
    puts "args is #{args} of type #{args.class}"
end
variable_args(1,2,3)

# When does it destructure? Passing an array argument to a method!"
puts "\n# When does it destructure? Passing an array argument to a method!"
def deconstruct_args(x,y,z)
    puts "x is #{x} of type #{x.class}"
end
deconstruct_args(*[1,2,3])



