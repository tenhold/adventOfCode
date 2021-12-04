require 'pry'
require 'matrix'

inputs = File.read('inputs.txt').split(/\n\n/)

# split each num into an array
nums = inputs[0].split(',').map { |num| num.to_i }
# split each board in to a matrix
boards = inputs[1..-1].map { |b| b.split(/\n/).map { |r| r.split(' ').map { |cell| { num: cell.to_i, seen: false } } } }

# convert the array of arrays into a ruby Matrix
# loop over the Matrix and check each element to see if the number is the same as the picked number
# if that is true then mark seen as true

# after each loop check each row and column to see if all are true. ---- board.column(0).all? {|e| e[:seen] == true }
# if it is true then stop and pick that board as the winner.

board_1 = Matrix[*boards[0]]
board_2 = Matrix[*boards[1]]
board_3 = Matrix[*boards[2]]

def bingo(board, nums)
  column = nil
  row = nil
  nums.each.with_index do |picked_num, count|
    board.each_with_index do |cell, r, c|
      if cell[:num] == picked_num
        cell[:seen] = true
      end

      if board.column(c).all? { |ele| ele[:seen] == true } || board.row(r).all? { |ele| ele[:seen] == true }
        unmarked_nums = board.inject(0) do |sum, hash|
          sum += hash[:num] if hash[:seen] == false
          sum
        end
        return {
          time: count,
          unmarked_nums: unmarked_nums,
          picked_num: picked_num
        }
      end
      
    end
  end
end

winner = nil

boards.each do |board|
  m_board = Matrix[*board]
  game = bingo(m_board, nums)
  winner = game if winner.nil?
  if game[:time] < winner[:time]
    winner =  game
  end
end

puts winner[:unmarked_nums] * winner[:picked_num]