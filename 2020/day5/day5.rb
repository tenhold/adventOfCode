require 'csv'
require 'pry'

def get_row(row, high, low) 
  if row.nil?
    return low
  end

  mid = (low + high) / 2

  if row[0] == 'F' || row[0] == 'L'
    high = mid
  end

  if row[0] == 'B' || row[0] == 'R'
    low = mid
  end
  return get_row(row[1..-1], high, low)
end

max_id = 0

CSV.foreach('day5.txt') do |line|
  line = line.join.split('')

  row = get_row(line[0..6], 128, 0)
  seat = get_row(line[7..-1], 8, 0)
  id = (row * 8) + seat
  max_id = id if id > max_id
end

puts max_id