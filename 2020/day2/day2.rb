require 'pry'
require 'csv'

=begin
def isValid (char, amount, password)
  count = password.inject(0) do |c, ele|
    c += 1 if ele == char
    c
  end
  count >= amount.first && count <= amount.last ? true : false
end
=end

def isValid (char, idx_1, idx_2, password)
  valid = 0
  password.each.with_index do |ele, i|
    i += 1
    if (i == idx_1 || i == idx_2) && ele == char
      valid += 1
    end
  end
  valid
end

t = 0
f = 0

CSV.foreach('day2.csv') do |row|
  _, idx_1, idx_2, char, password =  row[0].split(/^(\d+)-(\d+) (\w): (\w+)$/)

=begin
  str = row[0].split(' ')
  amount = str[0].split('-').map { |n| n.to_i }
  idx_1 = amount.first
  idx_2 = amount.last
  char = str[1][0]
  password = str.last.split('')
=end

  isValid(char, idx_1.to_i, idx_2.to_i, password.split('')) == 1 ? t += 1 : f += 1 
rescue => e
  puts "ERROR: #{e.message}"
end

puts "true: #{t}"
puts "false: #{f}"
