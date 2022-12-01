require 'pry'

inputs = File.read('inputs.txt').split("\n\n").map(&:split)
puts inputs.map { |c| c.map(&:to_i).reduce(:+) }.max
