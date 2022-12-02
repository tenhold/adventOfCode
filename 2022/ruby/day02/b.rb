require 'pry'

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
  score = result.index(t) + 1
  if m == 'X' # lose
    sum += 0 + score
  elsif m == 'Y' # draw
    sum += 3 + score
  else # win
    sum += 6 + score
  end
  sum
end
puts results

