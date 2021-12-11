require 'pry'
require 'csv'

inputs = File.read("inputs.txt").split(/\n/).map { |i| i.split("") }
test_inputs = File.read("test_inputs.txt").split(/\n/).map { |i| i.split("") }

INVALID_LOOK_UP = {
  ")" => 3, # points.
  "]" => 57, # points.
  "}" => 1197, # points.
  ">" => 25137, # points.
}

VALID_LOOK_UP = {
  ")" => 1, # points.
  "]" => 2, # points.
  "}" => 3, # points.
  ">" => 4, # points. 
}
PRENS = {
  "(" => ")",
  "[" => "]",
  "{" => "}",
  "<" => ">",
}
OPENING = PRENS.keys
CLOSING = PRENS.values.map { |v| v[0] } 

def check_prens_pt_1(arr)
  invalid = 0
  arr.each.with_index do |line, i|
    error = get_error_num(line)
    invalid += INVALID_LOOK_UP[error] unless error.nil?
  end
  return invalid
end

def get_error_num(line) 
  stack = []
  line.each do |char|
    if OPENING.include?(char)
      stack.append(char)
    elsif CLOSING.include?(char)
      if char == PRENS[stack.last] 
        stack.pop
      else 
        return char
      end
    end
  end
  nil
end

######################################   PT 2   ######################################

def check_prens_pt_2(arr)
  totals = []
  arr.each.with_index do |line, i|
    valid_row = get_valid_row(line)
    unless valid_row.nil?
      totals << sum_valid_row(valid_row)
    end
  end
  totals.sort[totals.length / 2]
end

def get_valid_row(line) 
  stack = []
  line.each do |char|
    if OPENING.include?(char)
      stack.append(char)
    elsif CLOSING.include?(char)
      if char == PRENS[stack.last] 
        stack.pop
      else 
        return nil 
      end
    end
  end
  stack.reverse
end

def sum_valid_row(arr)
  arr.inject(0) do |sum, ele|
    closing = PRENS[ele]
    sum *= 5
    sum += VALID_LOOK_UP[closing]
    sum
  end
end

puts "part 1: #{check_prens_pt_1(inputs)}"
puts "part 2: #{check_prens_pt_2(inputs)}"