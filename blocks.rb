# Source: https://www.codewithjason.com/two-common-ways-call-ruby-block/
# Takeaways
# 1. There are two common ways to call a Ruby block: block.call and yield.
# 2. Unlike block.call, yield gives us the ability to call a block even if 
# our method doesn’t explicitly take a block.
# 3. Unlike using an implicit block and yield, using and explicit block 
# allows us to pass a block to another method.

def hello(&block)
    puts "Calling block via .call on the explicitly passed Proc object"
    block.call
    puts "Block called!"
end

hello { puts "hi!" }

def helloAgain
    puts "Calling block via .yield on impliclty passed block"
    yield
    puts "Block called!"
end

helloAgain { puts "hi again!" }