
# Source: https://blog.pawandubey.com/explained-binding-pry-byebug-debugger/
# Takeaways
# 1. `Binding` is a class used to encapsulate the current execution context of program
# 2. `pry` is a drop-in replacement for IRB REPL
# 3. `binding.pry` calls `pry` on current `binding`, and opens a REPL session within this context
# 4. `byebug` is a gem like `pry` but also allows us to step through code
# 5. `pry-byebug` combines `pry` and `byebug`

# Binding
class Foo
    def initialize
        @attribute = 5
    end

    def get_binding
        binding
    end
end

foo = Foo.new
puts foo.get_binding.eval("@attribute + 1")

# Pry
# require 'pry'

class Bar
    def start_pry
        binding.pry
    end
end

# Bar.new.start_pry

# Pry & Byebug
require 'pry-byebug'

class FooBar
    def start_byebug
        byebug
    end
end

# FooBar.new.start_byebug

# Ruby DefaultDebugger
def debug_method(test)
    require 'debug'
    puts test 
end

# debug_method "Debug me!"