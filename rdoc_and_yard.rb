# Source: https://www.rubydoc.info/gems/yard/file/docs/GettingStarted.md
# Takeaways
# 1. RDoc is a Ruby documentation generation tool for Ruby
# 2. YARD is a documentation generation tool for Ruby 

# RDoc example

# Does something
#
# == Parameters:
# arg::
#   An Integer.
#
# == Returns:
# A string.
#
def rdoc_method(arg = 1)
    "Hi"
end

# YARD example

# Does something
#
# @param arg [Integer] an integer
# @return [String] a string
def rdoc_method(arg = 1)
    "Hi"
end