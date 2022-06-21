# Source: https://dmitrytsepelev.dev/attr-accessor-in-ruby
# Takeaways
# 1. attr_accessor is a method that sits in the singleton class and,
# when called, defines methods dynamically
# 2. Using a benchmark to compare attr_accessor with methods written by hand, we see that
# writer is 34% faster, while reader shows 18% better performance

# 1. attr_accessor is a method that sits in the singleton class and,
# when called, defines methods dynamically
puts 'attr_accessor is a method that sits in the singleton class and,
# when called, defines methods dynamically'

# Custom Attribute Accessor
module MyAttrAccessor
  def my_attr_accessor(attr_name)
    my_attr_reader(attr_name)
    my_attr_writer(attr_name)
  end

  def my_attr_reader(attr_name)
    instance_variable_name = attr_to_variable_name(attr_name)

    define_method(attr_name) do
      instance_variable_get(instance_variable_name)
    end
  end

  def my_attr_writer(attr_name)
    instance_variable_name = attr_to_variable_name(attr_name)

    define_method("#{attr_name}=") do |value|
      instance_variable_set(instance_variable_name, value)
    end
  end

  private

  def attr_to_variable_name(attr_name)
    "@#{attr_name}"
  end
end

Object.extend(MyAttrAccessor)

# 2. Using a benchmark to compare attr_accessor with methods written by hand, we see that
# writer is 34% faster, while reader shows 18% better performance
puts "\n Benchmark to compare attr_accessor with methods written by hand"
require "benchmark"

class NativeAccessor
  attr_accessor :value
end

class CustomAccessor
  def value
    @value
  end

  def value=(v)
    @value = v
  end
end

n = 10_000_000

Benchmark.bm do |x|
  na = NativeAccessor.new
  x.report("attr_writer") do
    n.times { |i| na.value = i }
  end

  ca = CustomAccessor.new
  x.report("value=") do
    n.times { |i| ca.value = i }
  end
end

Benchmark.bm do |x|
  na = NativeAccessor.new
  x.report("attr_reader") do
    n.times { |i| na.value }
  end

  ca = CustomAccessor.new
  x.report("value") do
    n.times { |i| ca.value }
  end
end