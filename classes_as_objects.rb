# Source: Book - The Well Grounded Rubyist
# Takeaways
# 1. Every class is an instance of a class called `Class`
# 2. Classes are special objects that have the power to spawn new objects
# 3. Classes can be created in multiple ways

# Every class is an instance of a class called `Class`
puts "# Every class is an instance of a class called `Class`"
class MyClass
    def hi
        "Hi from #{self.class}"
    end
end

puts "MyClass has a class type of #{MyClass.class}"
puts "MyClass has a superclass type of #{MyClass.class.superclass}"
puts "MyClass has it's own methods like any object, such as allocate which results in #{MyClass.allocate}"
puts "MyClass also has access to all methods declared on Module, Object & BasicObject, making a total of #{MyClass.public_methods.count}"

# Classes are special objects that have the power to spawn new objects
puts "\n# Classes are special objects that have the power to spawn new objects"
instance = MyClass.new
puts "instance has a class type of #{instance.class}"
puts "instance has a superclass type of #{instance.class.superclass}"
puts "instance has it's own defined methods, such as hi which results in #{instance.hi}"
puts "instance also has access to all methods declared on Object & BasicObject, making a total of #{instance.public_methods.count}"

# Classes can be created in multiple ways
puts "\n# Classes can be created in multiple ways"
class ClassKeywordFormula
    def hi
        puts "hi from #{self.class}"
    end
end

mc1 = ClassKeywordFormula.new

ClassFromNew = Class.new do
    def hi
        puts "hi from #{self.class}"
    end
end

mc2 = ClassFromNew.new

mc1.hi
mc2.hi
