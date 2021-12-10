require 'csv'
require 'pry'

depths = File.read('inputs.csv').split(/\n/)
  .map(&:to_i)
  .each_cons(2)
  .count { |a,b| a < b }

if ARGV[0] == 'part_1'
  puts 'running part 1'
  increased = 0
  last_depth = nil

  File.read('test.csv').split(/\n/).each.with_index do |depth, i|
    if i == 0
      last_depth = depth.to_i
      next
    end
    increased += 1 if depth.to_i > last_depth
    
    last_depth = depth.to_i
  rescue => e
    puts e.message
  end
  
  puts increased
  
elsif ARGV[0] == 'part_2'
  puts 'running part 2'

  groups = []
  last_depth = nil
  increased = 0
  # loop over each depth
  # get the current index and the next two so three in total and add them togther.
  # increase the element by one
  depths = File.read('inputs.csv').split(/\n/).map(&:to_i)

  for i in 0..depths.length - 3 do 
    groups << depths[i..i+2].inject(0) { |sum, depth| sum += depth }
  end

  groups.each.with_index do |depth, i|
    begin
      if i == 0
        last_depth = depth
        next
      end
      increased += 1 if depth > last_depth

      last_depth = depth
    rescue => e
      puts e.message
    end
  end

  puts increased 
end