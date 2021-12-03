require 'csv'
require 'pry'

# get the horizontal position and depth and multiply them
# down = increases
# up = decreases
# foward 
#   - increases your horizontal position by X units.
#   - increases your depth by your aim multiplied by X

####################### Part 1 #######################

def part_1(file)
  depth = 0
  aim = 0
  hor_pos = 0

  movements = File.read(file).split(/\n/).each do |movement|
    direction, amount = movement.split(' ')
    if direction == 'forward'
      hor_pos += amount.to_i
      # depth += aim * amount.to_i unless aim == 0
    end

    if direction == 'up'
      depth -= amount.to_i
    end

    if direction == 'down'
      depth += amount.to_i
    end
  end

  return (depth * hor_pos)
end

####################### Part 2 #######################

def part_2(file)
  depth = 0
  aim = 0
  hor_pos = 0

  movements = File.read(file).split(/\n/).each do |movement|
    direction, amount = movement.split(' ')
    if direction == 'forward'
      hor_pos += amount.to_i
      depth += aim * amount.to_i unless aim == 0
    end

    if direction == 'up'
      aim -= amount.to_i
    end

    if direction == 'down'
      aim += amount.to_i
    end
  end

  return (depth * hor_pos)
end

puts %(
----------------  RESULTS  ----------------- 
part 1: #{part_1('inputs.csv')}
part 2: #{part_2('inputs.csv')}
--------------------------------------------  
)