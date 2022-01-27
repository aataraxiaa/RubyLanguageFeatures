# Source: https://mensfeld.pl/2022/01/reduce-your-method-calls-by-99-9-by-replacing-threadpass-with-queuepop/
# Takeaways
# 1. The Queue class implements multi-producer, multi-consumer queues. 
# It is especially useful in threaded programming when information must be exchanged safely 
# between multiple threads. The Queue class implements all the required locking semantics.
# 2. `Queue.#pop`- Retrieves data from the queue. If the queue is empty, the calling thread is 
# suspended until data is pushed onto the queue. If non_block is true, the thread isn't suspended, 
# and ThreadError is raised.
# Queue#pop can act not only as a component of a queue but also as a part of multi-threaded applications flow control.

# Queue#pop usage

numbers = Queue.new

threads = 10.times.map do |i|
  Thread.new do
    while number = numbers.pop
      result = Time.now.to_f / number

      # a bit of randomness
      sleep(rand / 1_000)

      puts "Thread #{i},#{result}"
    end
  end
end

10_000.times { numbers << rand }

# see what I did here? ;)
Thread.pass until numbers.empty?

numbers.close

threads.each(&:join)