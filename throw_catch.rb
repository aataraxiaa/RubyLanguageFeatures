# Source: https://www.akshaykhot.com/throw-and-catch-in-ruby/
# Takeaways
# 1. `throw` method is defined in the `Kernal` module, `Kernel#throw(tag, obj)`
# 2. `throw` transfers control to the end of the active `catch` block waiting for the `tag`.
# 3. The `catch` method is also defined in the `Kernel` module, and it accepts a symbol (`tag`) and a block
# 4. It executes the block, which can either call the `throw` method or not
# 5. Throwing something always requires that someone should be there to catch it. If you try to `throw` something 
# without having a matching `catch` with matching `tag`, Ruby will raise an `UncaughtThrowError`
# 6. throw-catch offers a way to escape from deeply nested, multiple layers of control flow without having to
# resort to raise-rescue.

# 2. `throw` transfers control to the end of the active `catch` block waiting for the `tag`.
catch(:tag1) do
  throw :tag1

  # rubocop:disable Lint/UnreachableCode
  puts 'I am here!'
  # rubocop:enable Lint/UnreachableCode
end

# 5. Throwing something always requires that someone should be there to catch it
# throw :tag1

# catch(:tag1) do
#   throw :tag2
# end

# 6. throw-catch offers a way to escape from deeply nested, multiple layers of control flow
# rubocop:disable Lint/UnreachableLoop
# rubocop:disable Lint/UnreachableCode
catch(:err) do
  3.times do |i|
    3.times do |j|
      puts i
      throw :err
      print j
    end
    puts 'still here'
  end
end
# rubocop:enable Lint/UnreachableLoop
# rubocop:enable Lint/UnreachableCode
