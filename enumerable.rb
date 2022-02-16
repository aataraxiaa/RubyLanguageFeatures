# Source: https://kconrails.wordpress.com/2010/11/30/ruby-enumerable-primer-part-1-the-basics/
# Takeaways
# 1. The `Enumerable` module provides methods that are useful to a collection class
# 2. Ruby's `Array` mixes in `Enumerable`
# 3. `Enumerable` requires that the class provides an `#each` method, which
# yields successive members of the collection.

# Enumerable Class
class Team
    include Enumerable

    attr_accessor :members

    def initialize
        @members = []
    end

    def each &block
        members.each { |member| block.call(member) }
    end

end

# Enumerable Class Usage
team = Team.new
team.members << 'Pete'
team.members << 'Maiya'
team.members << 'Narit'

puts team.map(&:upcase)