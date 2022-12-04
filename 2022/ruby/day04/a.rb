require 'pry'

inputs = File.readlines('inputs.txt').map(&:chomp)

def intersect?(a, b)
  b.begin <= a.end && a.begin <= a.end
end

results = inputs.reduce(0) do |total, i|
  a_section, b_section = i.split(',').map do |e|
    start, stop = e.split('-')
   (start.to_i..stop.to_i)
  end
  if a_section.cover?(b_section) || b_section.cover?(a_section)
    total += 1
  end
  total
end

puts results

