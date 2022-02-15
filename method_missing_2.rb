# Source: Book - Well-Grounded Rubyist
# Takeaways
# 1. `method_missing` can be added to any object to endow that object with special
# behavior when the object gets sent a message for which is doesn't have a method defined
# 3. `method_missing` takes the name of the method that was called, an arbitrary number of 
# arguments, and (optionally) a block


class Person
  PEOPLE = []
  attr_reader :name, :hobbies, :friends
  def initialize(name)
    @name = name
    @hobbies = []
    @friends = []
    PEOPLE << self
  end

  def has_hobby(hobby)
    @hobbies << hobby
  end

  def has_friend(friend)
    @friends << friend
  end

  def Person.method_missing(m, *args)
    method = m.to_s
    puts "Method is #{method}"
    if method.start_with?("all_with_")
      attr = method[9..-1]
      puts "attr is #{attr}"
      if Person.public_method_defined?(attr)
        PEOPLE.find_all do |person|
          person.send(attr).include?(args[0])
        end
      else
        raise ArgumentError, "Can't find #{attr}"
      end
    else
      super
    end
  end
end

  j = Person.new("John")
  p = Person.new("Paul")
  g = Person.new("George")
  r = Person.new("Ringo")
  j.has_friend(p)
  j.has_friend(g)
  g.has_friend(p)
  r.has_hobby("rings")
  
  Person.all_with_friends(p).each do |person|
    puts "#{person.name} is friends with #{p.name}"
  end
  Person.all_with_hobbies("rings").each do |person|
    puts "#{person.name} is into rings"
  end

  Person.all_with_blah("blah")
