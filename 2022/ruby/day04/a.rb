require 'pry'
class Cleanup
  attr_reader :inputs
  def initialize(file)
    @inputs = File.readlines(file).map(&:chomp)
  end

  def section(row)
    start, stop = row.split('-')
    (start.to_i..stop.to_i)
  end

  def get_sections(input)
    input.split(',').map { |row| section(row) }
  end

  def cover?(a,b)
    a.cover?(b) || b.cover?(a)
  end

  def result
    inputs.reduce(0) do |total, input| 
      a, b = get_sections(input)
      total += 1 if cover?(a,b)

      total
    end
  end
end

puts Cleanup.new('inputs.txt').result
