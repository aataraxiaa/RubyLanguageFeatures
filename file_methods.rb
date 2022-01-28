# Source: https://rubyweekly.com/issues/587
# 1. _FILE__ is a Ruby constant which gives us a 
# String represenation of the path to the current file, from where it was called
# 2. File.expand_path will give us the full filepath
# 3. File.dirname will give us the path to the directory of a file.
# 4. n Ruby 3.1, File.dirname introduced an optional second parameter, an integer which represents how many levels to go up the directory tree. 
# 5. File.join joins its arguments with a "/" to create a filepath

# File Methods

# __FILE__
puts '# __FILE__'
puts __FILE__

# File.expand_path
puts '# File.expand_path'
puts File.expand_path(__FILE__)

# File.dirname 
puts '# File.dirname '
puts File.dirname(__FILE__)
puts File.dirname(File.expand_path(__FILE__), 3)

# File.join
puts '# File.join'
puts File.join("app", "controllers", "file_name.rb")

# Combined
puts '# Combined'
puts File.expand_path(File.join(File.dirname(__FILE__), 'lib'))