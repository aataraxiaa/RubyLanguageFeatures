# Source: https://www.honeybadger.io/blog/ruby-rails-memoization/
# Takeaways
# 1. Put simply, memoization is saving a method's return value so it 
# does not have to be recomputed each time
# 2. Uses or-equals operator: ||=

class Memoization

    def memoized_value
        @memoized_value ||= longRunningMethod
    end

    def longRunningMethod
        puts "Starting longRunningMethod"
        sleep(3)
        puts "Finised longRunningMethod" 
        4
    end

end

memoization = Memoization.new()
puts memoization.memoized_value
puts memoization.memoized_value