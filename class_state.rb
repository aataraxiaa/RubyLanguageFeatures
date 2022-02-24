# Source: Book - The Well Grounded Rubyist
# Takeaways
# 1. Class variables begin with two @ signs, e.g `@@var`
# 2. Class variables provide a storage mechanism that is 
# shared between a class and instances of that class
# 3. We can maintain per-class state with instance variables of class objects

# Class variables begin with two @ signs, e.g `@@var`
# Class variables provide a storage mechanism that is 
# shared between a class and instances of that class
puts '# Class variables begin with two @ signs, e.g `@@var`'
puts '# Class variables provide a storage mechanism that is shared between a class and instances of that class'
class A
    def initialize(num)
        @@number = num
        puts "Class #{self.class} set class variables `@@number` to #{@@number}"
    end

    def self.number
        @@number
    end
end

class B < A
end

A.new(1)
puts "A.number is set to #{A.number}"
B.new(2)
puts "A.number is now set to #{A.number}"

# We can maintain per-class state with instance variables of class objects
puts "\n# We can maintain per-class state with instance variables of class objects"
class C
    def self.number
        @number ||= 0
    end

    def self.number=(num)
        @number = num
        puts "Class #{self.class} set class instance variable to #{@number}"
    end

    def instance_number
        self.class.number
    end
end

class D < C
end

C.number = 1
puts "C.number is set to #{C.number}"
D.number = 2
puts "C.number is still set to #{C.number}"
cobj1 = C.new
cobj2 = C.new
puts "Instance 1 of C has access to class variables number of value #{cobj1.instance_number}"
puts "Instance 2 of C has access to class variables number of value #{cobj2.instance_number}"