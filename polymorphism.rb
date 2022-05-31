# Source: https://blog.appsignal.com/2022/05/25/an-introduction-to-polymorphism-in-ruby-on-rails.html
# Takeaways
# 1. One way of implementing Polymorphism in Ruby is via inheritance
# 2. A more practical way of implementing Polymorphism in Ruby is via duck-typing

# 1. One way of implementing Polymorphism in Ruby is via inheritance
puts '# 1. One way of implementing Polymorphism in Ruby is via inheritance'

class Instrument
  def instrument_example
    puts 'Saxophone'
  end
end

class Stringed < Instrument
  def instrument_example
    puts 'Guitar'
  end
end

class Percussion < Instrument
  def instrument_example
    puts 'Drums'
  end
end

all_instruments = [Instrument.new, Stringed.new, Percussion.new]

all_instruments.each do |instrument|
  instrument.instrument_example
end

# 2. A more practical way of implementing Polymorphism in Ruby is via duck-typing
puts "\n# 2. A more practical way of implementing Polymorphism in Ruby is via duck-typing"

class Guitar
  def brand
    'Gibson'
  end
end

class Drums
  def brand
    'Pearl'
  end
end

class Bass
  def brand
    'Fender'
  end
end

class Keyboard
  def brand
    'Casio'
  end
end

all_instruments = [Guitar.new, Drums.new, Bass.new, Keyboard.new]

all_instruments.each do |instrument|
  puts instrument.brand
end
