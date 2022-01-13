# Source: https://www.codewithjason.com/ruby-instance-exec/
# Takeaways
# 1. instance_exec is a method that executes a 
# block in the context of a certain object
# 2. instance_exec can help make DSL syntax less noisy and verbose
# 3. Methods like Factor Bot's factor and RSpec's it and describe 
# are possible because of instance_exec

# Custom use of instance_exec

class Tag
    def content(value)
        puts " #{value}"
    end
end

def inside_tag(name, &block)
    puts "<#{name}>"
    Tag.new.instance_exec(&block)
    puts "</#{name}>"
end

inside_tag("p") do
    content "Hello"
    content "World"
end