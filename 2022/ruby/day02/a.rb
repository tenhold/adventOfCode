require 'pry'
=begin
A for Rock, B for Paper, and C for Scissors

X for Rock, Y for Paper, and Z for Scissors

Z beats B
X beats C
Y beats A

X = 1, Y = 2, Z = 3
=end

inputs = File.readlines('inputs.txt').map(&:split)

results = inputs.reduce(0) do |sum, game|
  o, m = game
  if m == 'X'
    sum += 1
    if o == 'C'
      sum += 6
    elsif o == 'A'
      sum += 3
    end
  elsif m == 'Y'
    sum += 2
    if o == 'A'
      sum += 6
    elsif o == 'B'
      sum += 3
    end
  elsif m == 'Z'
    sum += 3
    if o == 'B'
      sum += 6
    elsif o == 'C'
      sum += 3
    end
  end
  sum
end
puts results

