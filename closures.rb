# Source: https://www.codewithjason.com/ruby-closures/
# Takeaways
# 1. Ruby blocks heavily involve Proc objects.
# 2. Every Proc object is a closure.
# 3. A closure is a record which stores a function 
# plus (potentially) some variables

# A closure is a record which stores a function 
# (i.e can be assigned to a variable/something)
my_proc = Proc.new { puts "I'm in a closure!" }
my_proc.call

my_stuff = { proc_key: Proc.new { puts "I'm in a closure in a hash!" } }
my_stuff[:proc_key].call

# A closure is a record that (potentially) stores some variables
number_of_exclamation_points = 0

amplifier = Proc.new do
    number_of_exclamation_points += 1
    puts "louder" + ("!" * number_of_exclamation_points)
end

amplifier.call
amplifier.call
amplifier.call
amplifier.call
puts number_of_exclamation_points