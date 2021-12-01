require 'pry'
require 'csv'
require 'set'

=begin
answers = File.read('day6.txt').split("\n\n").reduce(0) do |yes,answer|
  set = Set.new(answer.gsub("\n",'').split(''))
  yes += set.count
  yes
end
=end

groups = File.read('day6.txt').split("\n\n")

puts (groups.map do |group|
  responses = group.split(/\n/).map { |response| Set.new(response.each_char) }
  responses.inject do |product, current| 
    product.intersection(current) 
  end.length
end).sum

