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
          @workers.push("Worker #{worker}")
        else
          #establish initial Waitlist (Queue)
          @waiting.enqueue("Worker #{worker}")
        end
      end
  end

  def cycle
    # roll a die
    # fire (roll) number of people
    # hire (roll) number of people

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
#   puts "-------Cycle #{count+=1}-------"
#   sim.cycle
#   puts "Employed: #{sim.workers}"
#   puts "Waitlist: #{sim.waiting}"
# end
