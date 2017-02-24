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

# sample run
# ------------------------------
# Before the simulation starts
# Employed: ["Worker 1", "Worker 2", "Worker 3", "Worker 4", "Worker 5", "Worker 6"]
# Waitlist: ["Worker 7", "Worker 8", "Worker 9", "Worker 10"]
# ------------------------------
# <enter to cycle>
# -------Cycle 1-------
# FIRE: Worker 6
# HIRE: Worker 7
# Employed: ["Worker 1", "Worker 2", "Worker 3", "Worker 4", "Worker 5", "Worker 7"]
# Waitlist: ["Worker 8", "Worker 9", "Worker 10", "Worker 6"]
# -------Cycle 2-------
# FIRE: Worker 7
# FIRE: Worker 5
# FIRE: Worker 4
# FIRE: Worker 3
# FIRE: Worker 2
# HIRE: Worker 8
# HIRE: Worker 9
# HIRE: Worker 10
# HIRE: Worker 6
# HIRE: Worker 7
# Employed: ["Worker 1", "Worker 8", "Worker 9", "Worker 10", "Worker 6", "Worker 7"]
# Waitlist: ["Worker 5", "Worker 4", "Worker 3", "Worker 2"]
# -------Cycle 3-------
# FIRE: Worker 7
# HIRE: Worker 5
# Employed: ["Worker 1", "Worker 8", "Worker 9", "Worker 10", "Worker 6", "Worker 5"]
# Waitlist: ["Worker 4", "Worker 3", "Worker 2", "Worker 7"]
# -------Cycle 4-------
# FIRE: Worker 5
# FIRE: Worker 6
# FIRE: Worker 10
# FIRE: Worker 9
# HIRE: Worker 4
# HIRE: Worker 3
# HIRE: Worker 2
# HIRE: Worker 7
# Employed: ["Worker 1", "Worker 8", "Worker 4", "Worker 3", "Worker 2", "Worker 7"]
# Waitlist: ["Worker 5", "Worker 6", "Worker 10", "Worker 9"]
# -------Cycle 5-------
# FIRE: Worker 7
# FIRE: Worker 2
# FIRE: Worker 3
# FIRE: Worker 4
# HIRE: Worker 5
# HIRE: Worker 6
# HIRE: Worker 10
# HIRE: Worker 9
# Employed: ["Worker 1", "Worker 8", "Worker 5", "Worker 6", "Worker 10", "Worker 9"]
# Waitlist: ["Worker 7", "Worker 2", "Worker 3", "Worker 4"]
# -------Cycle 6-------
# FIRE: Worker 9
# HIRE: Worker 7
# Employed: ["Worker 1", "Worker 8", "Worker 5", "Worker 6", "Worker 10", "Worker 7"]
# Waitlist: ["Worker 2", "Worker 3", "Worker 4", "Worker 9"]
# -------Cycle 7-------
# FIRE: Worker 7
# FIRE: Worker 10
# FIRE: Worker 6
# HIRE: Worker 2
# HIRE: Worker 3
# HIRE: Worker 4
# Employed: ["Worker 1", "Worker 8", "Worker 5", "Worker 2", "Worker 3", "Worker 4"]
# Waitlist: ["Worker 9", "Worker 7", "Worker 10", "Worker 6"]
# -------Cycle 8-------
# FIRE: Worker 4
# FIRE: Worker 3
# FIRE: Worker 2
# FIRE: Worker 5
# FIRE: Worker 8
# HIRE: Worker 9
# HIRE: Worker 7
# HIRE: Worker 10
# HIRE: Worker 6
# HIRE: Worker 4
# Employed: ["Worker 1", "Worker 9", "Worker 7", "Worker 10", "Worker 6", "Worker 4"]
# Waitlist: ["Worker 3", "Worker 2", "Worker 5", "Worker 8"]
# -------Cycle 9-------
# FIRE: Worker 4
# FIRE: Worker 6
# FIRE: Worker 10
# FIRE: Worker 7
# FIRE: Worker 9
# HIRE: Worker 3
# HIRE: Worker 2
# HIRE: Worker 5
# HIRE: Worker 8
# HIRE: Worker 4
# Employed: ["Worker 1", "Worker 3", "Worker 2", "Worker 5", "Worker 8", "Worker 4"]
# Waitlist: ["Worker 6", "Worker 10", "Worker 7", "Worker 9"]
# -------Cycle 10-------
# FIRE: Worker 4
# FIRE: Worker 8
# FIRE: Worker 5
# FIRE: Worker 2
# HIRE: Worker 6
# HIRE: Worker 10
# HIRE: Worker 7
# HIRE: Worker 9
# Employed: ["Worker 1", "Worker 3", "Worker 6", "Worker 10", "Worker 7", "Worker 9"]
# Waitlist: ["Worker 4", "Worker 8", "Worker 5", "Worker 2"]
