require 'pry'
require 'matrix'

inputs = File.read('test_inputs.txt').split(/\n\n/)

# split each num into an array
nums = inputs[0].split(',')
# split each board in to a matrix
boards = inputs[1..-1].map { |b| b.split(/\n/).map { |r| r.split(' ').map { |cell| { num: cell, seen: false } } } }

# convert the array of arrays into a ruby Matrix
# loop over the Matrix and check each element to see if the number is the same as the picked number
# if that is true then mark seen as true

# after each loop check each row and column to see if all are true. ---- board.column(0).all? {|e| e[:seen] == true }
# if it is true then stop and pick that board as the winner.

board_1 = Matrix[*boards[0]]
board_2 = Matrix[*boards[1]]
board_3 = Matrix[*boards[2]]

def bingo(board, nums)
  nums.each.with_index do |picked_num, count|
    board.each_with_index do |cell, r, c|
      if cell[:num] == picked_num
        cell[:seen] = true
      end

      if board.column(c).all? { |ele| ele[:seen] == true } || board.row(r).all? { |ele| ele[:seen] == true }
        return count #"FOUND!!! #{board[r,c]}"
      end
    end
  end
end

puts bingo(board_1, nums)
puts bingo(board_2, nums)
puts bingo(board_3, nums)