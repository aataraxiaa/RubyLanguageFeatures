# Source 1: https://thoughtbot.com/blog/custom-ranges-in-ruby

# Takeaways
# 1. Ruby can construct a range out of any object that implements the `<=>` comparison operator 
# 2. If you want that range to be iterable, you also need to implement `succ` to generate the next value

# rubocop: disable Layout/IndentationWidth

# The `<=>` comparison operator
puts '# The `<=>` comparison operator'
# Represents a month
class Month
    def month
        @number
    end

    def initialize(value)
        @number = value
    end

    def <=>(other)
        @number <=> other.month
    end
end

month_one = Month.new(1)
month_two = Month.new(4)
puts month_one <=> month_two

# `succ` to generate the next value
puts "\n# `succ` to generate the next value"
class Month
    def succ
        self.class.new(@number.succ)
    end
end

puts Array(month_one..month_two)[2].month