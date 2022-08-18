# Source: https://st0012.dev/from-byebug-to-ruby-debug
# Takeaways
# Run the program and then use the source material to compare commands and features

require 'byebug'
require 'debug'

# Byebug
def func_1(input)
  func_2(input)
end

def func_2(input)
  p 'hi'
  byebug
  p input
end

func_1('bye byebug')

# Debugger
def func_3(input)
  func_4(input)
end

def func_4(input)
  p 'hi'
  debugger
  p input
end

func_3('bye debug')