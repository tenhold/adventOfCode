require 'csv'
require 'pry'
require 'set'

required_fields = Set.new([
  'byr',
  'iyr',
  'eyr',
  'hgt',
  'hcl',
  'ecl',
  'pid',
  'cid'
])

p_ids = File.read('day4.csv').split("\n\n").map.with_index do |p, i|
  p_id = p.split(' ').inject({}) do |h,str|
    val = str.split(':')
    h[val.first] = val.last
    h
  end
end

# loop over the array of ids 
# if the id is missing a required field then it is in valid
binding.pry


