# Source: https://www.toptal.com/ruby/ruby-pattern-matching-tutorial
# Takeaways
# 1. Pattern matching is a mechanism for checking a value against a pattern. 
# 2. A successful match can also deconstruct a value into its constituent parts.
# 3. 

words = ['two', 'words']
words_hash = { word_one: 'two', word_two: 'words' }

# Matching Arrays
puts 'Matching Arrays'
case words
in ['two', 'wrong']
    puts 'Not executed!'
in ['two', word]
    puts "Word is #{word}"
end

# Matching Hashes
puts 'Matching Hashes'
case words_hash
in { word_zero: 'two', word_one: 'words' }
    puts 'Not executed'
in { word_one: 'two', word_two: word }
    puts "Word in hash is #{word}"
end

# Multiple Patterns
puts 'Multiple Patterns'
def match_array_or_hash(words)
    case words
    in { word_one: 'two', word_two: 'words' } | ['two', 'words']
        p words
    end
end

match_array_or_hash(words)
match_array_or_hash(words_hash)

# Arrow Assignment
puts 'Arrow Assignment'
case ['I am a string', 10]
in [Integer, Integer] => a
    puts "a"
in [String, Integer] => b
    puts "b"
end

# Pin Operator
puts 'Pin Operator'
case [1,2,2]
in [a,^a,^a]
    puts "Not reached"
in [a, b, ^b]
    puts a
    puts b
end

# Underscore Operator
puts 'Underscore Operator'
case ['this will be ignored',2]
in [_,a] => b
    puts a
    puts b
end

# Use Cases
puts 'Use Cases'

json_data_one = {nickname: 'Pete', realname: {firstname: 'Peter', lastname: 'Smith'}, username: 'pete123'}
json_data_two = {nickname: 'Pete', realname: {firstname: 'Peter', lastname: 'Smith'}}
json_data_three = {firstname: 'Peter', lastname: 'Smith'}
json_data_four = {}

def display_name(name_hash)
    case name_hash
    in {username: username}
        username    
    in {nickname: nickname, realname: {firstname: first, lastname: last}}
        "#{nickname} #{first} #{last}"
    in {firstname: first, lastname: last}
        "#{first} #{last}"
    else
        'New User'
    end
end

puts display_name(json_data_one)
puts display_name(json_data_two)
puts display_name(json_data_three)
puts display_name(json_data_four)

# Deconstruct & Deconstruct_keys
puts 'Deconstruct & Deconstruct_keys'

class Coordinate
    attr_accessor :x, :y

    def initialize(x, y)
        @x = x
        @y = y
    end

    def deconstruct
        [@x, @y]
    end

    def deconstruct_keys(keys)
        {x: @x, y: @y}
    end
end

coordinate = Coordinate.new(32,50)

case coordinate
in [a,b]
    puts 'Array pattern'
    p a
    p b
end

case coordinate
in {x:, y:}
    # puts 'Hash pattern'
    p x
    p y
end