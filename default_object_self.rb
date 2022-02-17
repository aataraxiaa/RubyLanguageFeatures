# Source: Book - Well-Grounded Rubyist
# Takeaways
# 1. `self` is the current or default object
# 2. At any point, there is one and only one `self` object
# 3. 

# Top level of program
puts '# Top level of program'
puts "'self' is #{self}"

# Module definition
puts "\n# Module definition"
module ModuleSelf
    puts "'self' is #{self}, the module object"
end

class ModuleSelfTest
    include ModuleSelf
end

mst = ModuleSelfTest.new

# Class definition
puts "\n# Class definition"
class ClassSelf
    puts "'self' is #{self}, the class object"
end

cs = ClassSelf.new

# Method definition - Class Singleton
puts "\n# Method definition - Class Singleton"
class MethodSingleton
    def self.methodSelf
        puts "'self' is #{self}, the class object"
    end
end

MethodSingleton.methodSelf

# Method definition - Object Singleton
puts "\n# Method definition - Object Singleton"
obj = Object.new
def obj.methodSelf
    puts "'self' is #{self}, this specific object"
end

obj.methodSelf

# Method definition - Instance
puts "\n# Method definition - Instance"
class MethodInstance
    def methodSelf
        puts "'self' is #{self}, an instance of this class"
    end
end

ms = MethodInstance.new
ms.methodSelf