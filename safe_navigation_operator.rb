# Source: https://vector-logic.com/blog/posts/losing-your-way-with-ruby-safe-navigation-operator
# Takeaways
# 1. Safe-Navigation Operator is &.
# 2. a&.b will call the method b on the callee a. If the callee, a, happens to be nil then a 
# value of nil is returned and no error is raised.

# Example of usage
nil_var = "Initially a string"
puts nil_var.length

nil_var = nil

# This would raise a `NoMethodError`, as `nil_var` is nil
# puts nil_var.length

# However, using the safe-navigation operator, nil is returned instead of erroring
puts nil_var&.length == nil # Prints `true`
