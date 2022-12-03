inputs = File.readlines('inputs.txt').map(&:chomp)
letters = ('a'..'z').to_a + ('A'..'Z').to_a

result = inputs.each_slice(3).reduce(0) do |sum, sacks|
  a,b,c = sacks.map! { |s| s.split('') }
  found = (a & b & c).first
  
  sum += letters.index(found) + 1
end

puts result
