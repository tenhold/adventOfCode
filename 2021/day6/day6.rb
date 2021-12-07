require 'pry'
# each fish is the number of days until it creates a new lanternfish.

#  every 7 days it creates a new fish, it needs 2 day before it starts it cycle after create

#  create new fish with timer of 8 after it creates a fish it has 6 more cycles before it creates another one

TEST_INPUTS = [3,4,3,1,2] # starting fish with current timer
INPUTS = [1,1,3,5,1,1,1,4,1,5,1,1,1,1,1,1,1,3,1,1,1,1,2,5,1,1,1,1,1,2,1,4,1,4,1,1,1,1,1,3,1,1,5,1,1,1,4,1,1,1,4,1,1,3,5,1,1,1,1,4,1,5,4,1,1,2,3,2,1,1,1,1,1,1,1,1,1,1,1,1,1,5,1,1,1,1,1,1,1,1,2,2,1,1,1,1,1,5,1,1,1,3,4,1,1,1,1,3,1,1,1,1,1,4,1,1,3,1,1,3,1,1,1,1,1,3,1,5,2,3,1,2,3,1,1,2,1,2,4,5,1,5,1,4,1,1,1,1,2,1,5,1,1,1,1,1,5,1,1,3,1,1,1,1,1,1,4,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,3,2,1,1,1,1,2,2,1,2,1,1,1,5,5,1,1,1,1,1,1,1,1,1,1,1,1,2,2,1,1,4,2,1,4,1,1,1,1,1,1,1,2,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,1,5,1,1,1,1,1,1,1,1,3,1,1,3,3,1,1,1,3,5,1,1,4,1,1,1,1,1,4,1,1,3,1,1,1,1,1,1,1,1,2,1,5,1,1,1,1,1,1,1,1,1,1,4,1,1,1,1]
# INPUTS = File.read('inputs.txt').split(',').map(&:to_i)

# each day decrase all numbers by one 
# if a fish timer is at 0 
  # reset the timer to 6 
  # create a new fish with a timer of 8 on the back of the list


# def count_fish(fish, days)
#   new_fish = []
#   while days > 0
#     fish.map! do |f, i|
#       if f == 0
#         f = 7
#         new_fish << 8
#       end
#       f -= 1
#     end
#     fish.push(*new_fish)
#     new_fish = []
#     days -= 1
#   end
#   fish
# end


def count_fish(fish, days)
  new_fish = []
  if days == 0
    return fish.length
  end
  fish.map! do |f, i|
    if f == 0
      f = 7
      new_fish << 8
    end
    f -= 1
  end.push(*new_fish)
  return count_fish(fish, days -= 1)
end

count = count_fish(INPUTS, 80)
puts count
