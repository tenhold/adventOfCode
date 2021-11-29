require 'csv'
require 'pry'

x = 0
y = 0
tree = 0

CSV.foreach('day3.csv').with_index do |row, i|
  i += 1
  y = x
  # times each row by the curent index + 1
  hill = row.join * i
  
  tree += 1 if hill[y] == '#' && i != 1
  # move 3 over from current location 
  x += 3 
rescue => e
  puts "ERROR: #{e.message}"
end

puts "Trees: #{tree}"
