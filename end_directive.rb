# Source: Ruby Weekly
# Takeaways
# 1. `__END__`` is a directive that causes Ruby to cease processing 
# a source code file
# 2. If you put an __END__ in a Ruby file, everything after the __END__ 
# will be accessible as a file in the DATA variable

# Accessing DATA from the same source file
puts "# Accessing DATA from the same source file"
puts "DATA is a #{DATA.class}"
puts DATA.read

__END__
here is some
data, that I
put in the same
file
