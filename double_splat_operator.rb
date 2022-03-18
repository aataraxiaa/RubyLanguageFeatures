# Source 1: https://rubyinrails.com/2019/07/10/ruby-splat-operator-for-arguments/
# Source 2: https://stackoverflow.com/questions/18289152/what-does-a-double-splat-operator-do
# Takeaways
# 1. `**` is the double-splat operator
# 2. Can be used to deconstruct hashes
# 3. Can be used to pass a hash to methods expecting keywords
# 4. Can be used to capture all keyword arguments as a hash

# Destructuring hashes
puts "# Destructuring hashes"
hashOne = { first: 'pete', last: 'smith' }
hashTwo = { id: 1, email: 'pete@example.com' }
combined = { **hashOne, **hashTwo }
puts "#{hashOne} and #{hashTwo} combined are #{combined}"

# Passing a hash to methods expecting keywords
puts "\n# Passing a hash to methods expecting keywords"
def foo(k1: 1, k2: 2)
    puts "Hash passed as keywords #{k1} and #{k2}"
end

h = { k1: 42, k2: 43 }

foo(**h)

# Can be used to capture all keyword arguments as a hash
puts "\n# Can be used to capture all keyword arguments as a hash"
def bar(**options)
    puts "Keywords passed as a #{options.class} with values #{options}"
end

bar(k: 41, k2: 43)

