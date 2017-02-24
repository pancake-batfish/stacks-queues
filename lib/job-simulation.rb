require './Stack.rb'
require './Queue.rb'

class JobSimulation
  attr_reader :workers, :waiting, :roll

  def initialize (jobs_available, job_seekers)

      @workers = Stack.new
      @waiting = Queue.new

      job_seekers.times do |worker|
        #establish initial Employed list (Stack)
        if worker < jobs_available
          @workers.push("Worker #{worker + 1}")
        else
          #establish initial Waitlist (Queue)
          @waiting.enqueue("Worker #{worker + 1}")
        end
      end
  end

  def cycle
    # roll a die
    fired = rand(1..6)

    fired.times do
      # fire (roll) number of people
      newly_fired = @workers.pop
      puts "FIRE: #{newly_fired}"
      @waiting.enqueue(newly_fired)
    end

    fired.times do
      # hire (roll) number of people
      newly_hired = @waiting.dequeue
      puts "HIRE: #{newly_hired}"
      @workers.push(newly_hired)
    end

  end
end

## Allows us to run our code and see what's happening:
sim = JobSimulation.new(6,10)
puts "------------------------------"
puts "Before the simulation starts"
puts "Employed: #{sim.workers}"
puts "Waitlist: #{sim.waiting}"
puts "------------------------------"
print "<enter to cycle>\n"

# count = 0
# until gets.chomp != ""
10.times do |count|
  puts "-------Cycle #{count+=1}-------"
  sim.cycle
  puts "Employed: #{sim.workers}"
  puts "Waitlist: #{sim.waiting}"
end
