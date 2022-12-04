require_relative 'a'

class Cleanup_part2 < Cleanup
  attr_reader :inputs
  def initialize(file)
    @inputs = File.readlines(file).map(&:chomp)
  end
  
  def intersect?(a,b)
    a.intersect?(b) || b.intersect?(a)
  end
  def result
    inputs.reduce(0) do |total, input|
      a, b = get_sections(input).map(&:to_a)
      total += 1 if intersect?(a,b)
      total
    end
  end
end

puts Cleanup_part2.new('inputs.txt').result

