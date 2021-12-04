require 'pry'

binary = File.read('inputs.csv').split(/\n/)


def part_1(binary)
  gamma_rate = "" # most common on each coloumn 
  epsilon_rate = ""
  # count each column and add the total up that is the gamma rate

  # loop over each binary row
  for i in 0...binary[0].length do
    # get each binary element
    zero = 0
    one = 0

    for j in 0...binary.length do
      zero += 1 if binary[j][i] == "0"
      one += 1 if binary[j][i] == "1"
    end
    if zero > one
      gamma_rate += "0"
      epsilon_rate += "1"
    else
      gamma_rate += "1"
      epsilon_rate += "0"
    end
  end

  gamma_binary = gamma_rate.to_i(2)
  epsilon_binary = epsilon_rate.to_i(2)

  return gamma_binary * epsilon_binary
end

=begin

binary[0][0]
binary[1[0]
binary[2[0]
...
binary[0][1]
binary[1][1]
binary[2][1]
...
binary[0][2]
binary[1][2]
binary[2][2]

=end

####################### Part 2 #######################

def part_2(binary, rate)

  # loop over each binary row
  for i in 0...binary[0].length do
    # get each binary element
    zero = 0
    one = 0

    for j in 0...binary.length do
      zero += 1 if binary[j][i] == "0"
      one += 1 if binary[j][i] == "1"
    end

    if rate == "gamma"
      to_filter = zero > one ? "0" : "1"
    elsif rate == "epsilon"
      to_filter = zero > one ? "1" : "0"
    end

    binary = binary.filter.with_index { |b| b[i] == to_filter } unless binary.length == 1
  end

  return binary[0].to_i(2)
end

puts part_2(binary, 'gamma') * part_2(binary, 'epsilon')