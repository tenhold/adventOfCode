require 'pry'
require 'set'

# clocks = File.read('test_inputs.txt') #.split(/\n/) #.map(&:split)

# clocks = []
# File.read('test_inputs.txt').gsub(" |","").split(/\n/).each_slice(2) { |s| clocks << s.map(&:split) }
clocks = File.read('inputs.txt').split("\n").map { |c| c.split(" | ").map(&:split) }

num = 0
MAPPED_NUMS = %w( 
  cagedb
  ab
  gcdfa
  fbcad
  eafb
  cdfbe
  cdfgeb
  dab
  acedgfb
  cefabd
).inject({}) do |hash, ele|
  hash[ele.chars.sort.join] = num
  num += 1
  hash
end

###### PT 1
# total = 0
# clocks.each do |clock|
#   total += clock.last.inject(0) do |sum, c|
#     sum += 1 if c.length == 2 || c.length == 3 || c.length == 4 || c.length == 7
#     sum
#   end
# end

###### PT 2
total = 0
clocks.each do |clock|
  cypher = {}
  times = clock.first.inject("") do |str, c|
    sorted = c.chars.sort.join
    if c.length == 2
      cypher["1"] = sorted
    elsif c.length == 7
      cyper["8"] = sorted
    elsif c.length == 4
      cypher["4"] = sorted 
    elsif c.length == 3
      cypher["7"] = sorted
    end
  end
  total += time.to_i
end

puts total