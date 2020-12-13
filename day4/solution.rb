file = File.open('puzzle_input.txt')
data = file.readlines

arr = []
result = []

data.each_with_index { |line, index|
  arr << line.strip

  if line.length == 1 
    result << arr.join(' ').strip
    arr.clear
  end

  if index == data.size - 1
    result << arr.join(' ').strip
    arr.clear
  end
}

result_hash = result.map{ |data| 
  data.split(' ').each_with_object({}){ |item, hash| 
    content = item.split(':')
    hash[content.first] = content.last
  }
}

valid_count = 0

def valid?(hash)
  hash.key?('hcl') && hash.key?('hgt') && hash.key?('pid') && hash.key?('byr') && hash.key?('eyr') && hash.key?('iyr') && hash.key?('ecl')
end

def check_values(hash)
  return false unless hash['byr'].to_i >= 1920 && hash['byr'].to_i <= 2002
  return false unless hash['iyr'].to_i >= 2010 && hash['iyr'].to_i <= 2020
  return false unless hash['eyr'].to_i >= 2020 && hash['eyr'].to_i <= 2030

  if hash['hgt'].match(/\d+in$/).nil? && hash['hgt'].match(/\d+cm$/).nil?
   return false
  else
    if !hash['hgt'].match(/\d+in$/).nil? 
      return false unless hash['hgt'].match(/\d+/).to_s.to_i >= 59 && hash['hgt'].match(/\d+/).to_s.to_i <= 76
    elsif !hash['hgt'].match(/\d+cm$/).nil? 
      return false unless hash['hgt'].match(/\d+/).to_s.to_i >= 150 && hash['hgt'].match(/\d+/).to_s.to_i <= 193
    end
  end

  return false unless hash['hcl'] == hash['hcl'].match(/#[\d|a-f]+/).to_s
  return false unless %w[amb blu brn gry grn hzl oth].any? { |e| e == hash['ecl'] }
  return raise_false('passport', hash) unless hash['pid'] == hash['pid'].match(/\d{9}/).to_s

  return true
end

result_hash.each { |hash| 
  if valid?(hash)
    if check_values(hash)
      valid_count += 1
    end
  end
}

puts valid_count

file.close





