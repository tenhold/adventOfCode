inputs = File.readlines('inputs.txt').first.split('')

result = nil

low_idx = 0
high_idx = 3

while result.nil? || inputs.size <= high_idx
  count = Hash.new(0)
  opt = inputs[low_idx..high_idx]
  dup = nil 
  opt.each { |v| count[v] += 1 } 
  count.each { |k,v| dup = k if v > 1 }

  result = high_idx + 1 if dup.nil? # return case

  inputs[low_idx..high_idx].each do |o|
    i = low_idx
    if o == dup
      low_idx = i + 1
      high_idx = i + 4
      break
    end
    i += 1
  end
end

puts result
