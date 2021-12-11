require 'pry'
require 'csv'

inputs = File.read("inputs.txt").split(/\n/).map { |i| i.split("") }

LOOK_UP_HASH = {
  ")" => 3, # points.
  "]" => 57, # points.
  "}" => 1197, # points.
  ">" => 25137, # points.
}
PRENS = {
  "(" => ")",
  "[" => "]",
  "{" => "}",
  "<" => ">",
}
OPENING = PRENS.keys
CLOSING = PRENS.values.map { |v| v[0] } 

def check_prens(arr)
  invalid = 0
  arr.each.with_index do |line, i|
    error = get_error_num(line)
    invalid += LOOK_UP_HASH[error] unless error.nil?
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

puts check_prens(inputs)
=begin

{([(<{}[<>[]}>{[]{[(<()> - Expected ], but found } instead.



for each line create a queue

=end