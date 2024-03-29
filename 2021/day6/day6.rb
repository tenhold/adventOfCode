require 'pry'
# each fish is the number of days until it creates a new lanternfish.

#  every 7 days it creates a new fish, it needs 2 day before it starts it cycle after create

#  create new fish with timer of 8 after it creates a fish it has 6 more cycles before it creates another one

TEST_INPUTS = [3,4,3,1,2] # starting fish with current timer
INPUTS = File.read('inputs.txt').split(',').map(&:to_i)

# each day decrase all numbers by one 
# if a fish timer is at 0 
  # reset the timer to 6 
  # create a new fish with a timer of 8 on the back of the list


def count_fish(fish, days)
  fish_at_stages = Array.new(9, 0)
  fish.each { |f| fish_at_stages[f] += 1 }
  days.times do
    fish_at_stages.rotate!
    fish_at_stages[6] += fish_at_stages.last
  end
  fish_at_stages.inject(:+)
end
puts count_fish(INPUTS, 256)

# def count_fish(fish, days)
#   new_fish = []
#   if days == 0
#     return fish.length
#   end
#   fish.map! do |f, i|
#     if f == 0
#       f = 7
#       new_fish << 8
#     end
#     f -= 1
#   end.push(*new_fish)
#   return count_fish(fish, days -= 1)
# end
