# Source: https://www.codewithjason.com/ampersand-ruby-block/
# Takeaways
# 1. A leading ampersand converts a block to a Proc object and a Proc object to a block.
# 2. There’s no such thing as a Ruby Block class. Therefore no object can be an instance of a block. 
# The material that Ruby blocks are made out of is Proc objects.
# 3. The previous points taken together are why Ruby block arguments always appear as e.g. &block. 
# The block can’t be captured in a variable unless it’s first converted to a Proc object.

def proc_me(my_proc)
    puts "proc_me class is #{my_proc.class}"
end

def proc_me_with_block(&my_proc)
    puts "proc_me_with_block class is #{my_proc.class}"
end

def block_me(&my_block)
    puts "block_me class is #{my_block.class}"
end

proc_me(Proc.new { "Hi" })
proc_me_with_block(&Proc.new { "Hi"})
block_me { "Hi" }

