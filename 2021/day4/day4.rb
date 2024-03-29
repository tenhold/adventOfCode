require 'pry'
require 'matrix'

inputs = File.read('test_inputs.txt').split(/\n\n/)

# split each num into an array
nums = inputs[0].split(',').map { |num| num.to_i }
# split each board in to a matrix
boards = inputs[1..-1].map { |b| b.split(/\n/).map { |r| r.split(' ').map { |cell| { num: cell.to_i, seen: false } } } }

# convert the array of arrays into a ruby Matrix
# loop over the Matrix and check each element to see if the number is the same as the picked number
# if that is true then mark seen as true

# after each loop check each row and column to see if all are true. ---- board.column(0).all? {|e| e[:seen] == true }
# if it is true then stop and pick that board as the winner.

def bingo(board, nums)
  nums.each.with_index do |picked_num, count|
    board.each_with_index do |cell, r, c|
      if cell[:num] == picked_num
        cell[:seen] = true
      end

      if  won?(board, c, nil) || won?(board, nil, r)
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

def won?(board, column, row)
  return board.column(column).all?{ |e| e[:seen] == true } unless column.nil?
  return board.row(row).all?{ |e| e[:seen] == true } unless row.nil?
end

def find_winner(boards, nums)
  winner = nil
  
  boards.each do |board|
    m_board = Matrix[*board]
    game = bingo(m_board, nums)
    winner = game if winner.nil?
    if game[:time] < winner[:time]
      winner = game
    end
  end

  winner[:unmarked_nums] * winner[:picked_num]
end

def find_loser(boards, nums)
  loser = nil
  boards.each do |board|
    m_board = Matrix[*board]
    game = bingo(m_board, nums)
    loser = game if loser.nil?
    if game[:time] > loser[:time]
      loser =  game
    end
  end
  loser[:unmarked_nums] * loser[:picked_num]
end

puts "loser: #{find_loser(boards, nums)}"
# puts "winner: #{find_winner(boards, nums)}"