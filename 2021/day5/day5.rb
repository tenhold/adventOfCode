require 'pry'
require 'matrix'

# get each quordinate 
# set a map of '.' -> 2d array -> nums would be flipped ex: 0,9 = array[9][0]
  # need to get the largest number in the input to build the board from or hard code to 1000
# if either x1 = x2 or y1 = y2 then use the spanning cordinates to mark a map

inputs = File.readlines('inputs.txt').map(&:chomp)
  .map { |c| c.split(' -> ').map { |d| d.split(",").map(&:to_i) }.flatten }

def generate_matrix(num)
  matrix = []
  for i in 0...num do
    row = Array.new(num, 0)
    matrix << row
  end
  matrix
end

def build_cordinates(array)
  x1, y1, x2, y2 = array
  cord = []
  if x1 == x2 && y1 < y2
    for i in y1..y2 do 
      cord << [i,x1]
    end
  elsif x1 == x2 and y1 > y2
    for i in y2..y1 do
      cord << [i,x1]
    end
  elsif y1 == y2 && x1 < x2
    for i in x1..x2 do
      cord << [y1,i]
    end
  elsif y1 == y2 && x1 > x2
    for i in x2..x1 do
      cord << [y1,i]
    end
  end
  cord unless cord.empty?
end

board = generate_matrix(1000)

all_cords = inputs.map do |cordinates|
  build_cordinates(cordinates)
end.compact!

all_cords.each do |cords|
  cords.each do |cord|
    x, y = cord
    board[y][x] += 1
  end
end

dangerous_areas = 0
board.each { |line| line.each { |area| dangerous_areas += 1 if area >= 2 } }

puts dangerous_areas