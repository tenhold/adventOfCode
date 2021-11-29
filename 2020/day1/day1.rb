require 'csv'
require 'pry'
require 'set'


nums = CSV.table('day1.csv')[:value]

for i in 0..nums.length - 1 do
  num1 = nums[i]
  num2 = -1
  num3 = -1
  for j in 1..nums.length - 1 do
    num2 = nums[j]
    for k in 2..nums.length - 1 do
      num3 = nums[k]
      if num1 + num2 + num3 == 2020
        puts "#{num1}, #{num2}, #{num3}"
        puts num1 * num2 * num3
        return
      end
    end
  end
end

=begin
nums = CSV.table('day1.csv')[:value].to_set

nums.each do |num|
  missing = 2020 - num
  if nums.include?(missing)
    puts "--#{num}, #{missing}--"
    puts num * missing
    return
  end
end
=end
