# Source: https://dev.to/devteam/benefits-of-having-a-call-method-for-your-ruby-object-30dk
# Takeaways
# 1. Defining a `call` method at a module or class level can enable easy test mocking

# Defining a `call` method at a module or class level can enable easy test mocking
puts '# Defining a `call` method at a module or class level can enable easy test mocking'


module Handler
  def self.call(package:); end
end

module Notifier
  def self.call(package:); end
end

class Package
  attr_reader :origin, :destination, :handler, :notifier

  def initialize(origin:, destination:, notifier: Notifier, handler: Handler)
    @origin = origin
    @destination = destination
    @handler = handler
    @notifier = notifier
  end

  def deliver!(with_notification: true)
    notifier.call(package: self) if with_notification
    handler.call(package: self)
  end
end

require 'test-unit'

class Tester < Test::Unit::TestCase
  def test_assert_not_sending_notification
    # By having the notifier `raise`, we'll know if it was called.
    notifier = ->(package:) { raise }
    handler = ->(package:) { :handled }
    package = Package.new(
      origin: :here,
      destination: :there,
      notifier: notifier,
      handler: handler
    )

    assert(package.deliver!(with_notification: false) == :handled)
  end
end