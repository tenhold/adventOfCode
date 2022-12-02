require 'pry'
=begin
A for Rock, B for Paper, and C for Scissors

X for Rock, Y for Paper, and Z for Scissors

Z beats B
X beats C
Y beats A

X = 1, Y = 2, Z = 3

X == loss Y == draw Z == win
=end

inputs = File.readlines('inputs.txt').map(&:split)

games = {
  'A' => ['Z', 'X', 'Y'],
  'B' => ['X', 'Y', 'Z'],
  'C' => ['Y', 'Z', 'X']
}

result = ['X', 'Y', 'Z']

results = inputs.reduce(0) do |sum, game|
  o, m = game
  throw_idx = result.index(m)
  t = games[o][throw_idx]

  if m == 'X' # lose
    sum += 0 + (result.index(t) + 1)
  elsif m == 'Y' # draw
    sum += 3 + (result.index(t) + 1)
  else
    sum += 6 + (result.index(t) + 1)
  end
  sum
end
puts results

