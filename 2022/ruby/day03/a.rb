inputs = File.readlines('inputs.txt').map(&:chomp)
letters = ('a'..'z').to_a + ('A'..'Z').to_a

result = inputs.reduce(0) do |sum, sack|
  half = sack.size / 2
  a = sack.chars.first(half)
  b = sack.chars.last(half)
  found = (a & b).first
  
  sum += letters.index(found) + 1
end

puts result
