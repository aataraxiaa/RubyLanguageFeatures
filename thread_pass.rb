# Source: https://mensfeld.pl/2022/01/reduce-your-method-calls-by-99-9-by-replacing-threadpass-with-queuepop/
# Takeaways
# 1. `Thread::pass` gives the thread scheduler a hint to pass execution to another thread. 
# A running thread may or may not switch, it depends on OS and processor.
# 2. Should not be used to defer work but rather to provide a hint to Ruby, 
# that there may be more important things that it could focus on.

# Thread::pass usage
threads = []

threads = 10.times.map do |i|
  Thread.new do
    # Make threads wait for a bit so all threads are created
    sleep(0.001) until threads.size == 10

    start = Time.now.to_f

    1_000_000.times do
        # Thread 0 will take a lot longer than other threads, as execution
        # is passed to threads 1-9
        Thread.pass if i.zero?

      start / rand
    end

    puts "Thread #{i},#{Time.now.to_f - start}"
  end
end

threads.each(&:join)