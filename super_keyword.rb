# Source: Book - Well-Grounded Rubyist
# Takeaways
# 1. The `super` keyword can be used inside method definitions to jump up the method-lookup path
# 2. `super` - called with no arguments - forwards the arguments from the method from which it was called
# 3. `super()` - called with empty argument list - sends no arguments to the higher-up method
# 4. `super(a,b,c)` - called with specific arguments - sends exactly those arguments

class SuperClass
    def print_info(arg = 'Default argument')
        if arg
            puts "In SuperClass with argument #{arg}"
        else
            puts "In SuperClass with no argument"
        end
    end
end

# `super` - called with no arguments - forwards the arguments from the method from which it was called
puts "# `super` - called with no arguments - forwards the arguments from the method from which it was called"
class ChildOne < SuperClass
    def print_info(arg)
        puts "In ChildOne with argument #{arg}"
        super
    end
end

child = ChildOne.new
child.print_info('pete')

# `super()` - called with empty argument list - sends no arguments to the higher-up method
puts "\n# `super()` - called with empty argument list - sends no arguments to the higher-up method"
class ChildTwo < SuperClass
    def print_info(arg)
        puts "In ChildOne with argument #{arg}"
        super()
    end
end

child = ChildTwo.new
child.print_info('pete')

# `super(a,b,c)` - called with specific arguments - sends exactly those arguments
puts "\n# `super(a,b,c)` - called with specific arguments - sends exactly those arguments"
class ChildThree < SuperClass
    def print_info(arg)
        puts "In ChildOne with argument #{arg}"
        super('New argument')
    end
end

child = ChildThree.new
child.print_info('pete')