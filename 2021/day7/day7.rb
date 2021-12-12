require 'pry'

class Day7
  
end

time = Time.now.utc

TEST_INPUTS = [16,1,2,0,4,2,7,1,2,14]

inputs = File.read('inputs.txt').split(',').map(&:to_i)

def get_moves(inputs)
  total_posititions = inputs.tally

  fuels = []

  (inputs.min..inputs.max).each do |num|
    fuels << inputs.inject(0) do |sum, crab|
      diff = (crab - num).abs
      sub_sum = (1..diff).inject(0, :+)
      sum += sub_sum
      sum
    end

  end
  return fuels.min
end

puts get_moves(inputs)
puts Time.now.utc - time