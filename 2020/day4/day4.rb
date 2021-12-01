require 'csv'
require 'pry'
require 'set'

@valid = 0
@invalid = 0

required_fields = [
  'byr',
  'iyr',
  'eyr',
  'hgt',
  'hcl',
  'ecl',
  'pid',
#  'cid' # can be skipped
]

def v_byr(year)
  year.to_i >= 1920 && year.to_i <= 2002 ? true : false 
end

def v_iyr(year)
  year.to_i >= 2010 && year.to_i <= 2020 ? true : false
end

def v_eyr(year)
  year.to_i >= 2020 && year.to_i <= 2030 ? true : false
end

def v_hgt(height) 
  if height&.match?(/^[\d]+(in)/)
    num = height[0...-2].to_i
    if num >= 59 && num <= 79
      return true
    else
      return false
    end
  elsif height&.match?(/^[\d]+(cm)/)
    num = height[0...-2].to_i
    if num >= 150 && num <= 193
      return true
    else
      return false
    end
  end

  return false
end

def v_hcl(hcl)
  hcl.match?(/^#(?:[0-9a-fA-F]{3}){1,2}$/)
end

def v_ecl(ecl)
  colors = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth']
  colors.include?(ecl)
end

def v_pid(pid)
  pid.match?(/^\d{9}$/)
end

p_ids = File.read('day4.csv').split("\n\n").map.with_index do |p, i|
  p_id = p.split(' ').inject({}) do |h,str|
    val = str.split(':')
    h[val.first] = val.last
    h
  end
  p_id
end

# loop over the array of ids 
# if the id is missing a required field then it is in valid

p_ids.each do |id|
  # if the length is 7 check to see if all required fields are present
  unless id.count >= 7 && required_fields.all? { |k| id.keys.include?(k) }
    @invalid += 1
    next
  end
  unless (v_byr(id["byr"]) &&
          v_eyr(id["eyr"]) &&
          v_hgt(id["hgt"]) &&
          v_hcl(id["hcl"]) &&
          v_ecl(id["ecl"]) &&
          v_pid(id["pid"]))
    @invalid +=1
    next
  end
  
  @valid += 1
end

puts "Valid: #{@valid} Invalid: #{@invalid}"
