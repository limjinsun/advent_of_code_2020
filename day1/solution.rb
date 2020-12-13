# Find the two entries that sum to 2020; what do you get if you multiply them together?

file = File.open("puzzle_input.txt")
file_data = file.readlines.map(&:chomp)
data = file_data.map{ |e| e.to_i }.sort!

head = data.first
tail = data.last

result = head + tail

until result == 2020
  if result < 2020
    head = data[data.find_index(head) + 1]
  else
    tail = data[data.find_index(tail) - 1]
  end
  result = head + tail
end

# what is the product of the three entries that sum to 2020?

head = data.first
tail = data.last
second = data[1]

puts data.inspect
puts "\n\n\n"

for fixed_item in data
  index = data.find_index(fixed_item)
  data.delete_at(index)

  l = 0
  r = data.length - 1

  result = fixed_item + data[l] + data[r]
  
  while ( l < r )
    if result == 2020
      puts fixed_item * data[l] * data[r]
      return
    else
      if result < 2020
        l += 1
      else
        r -= 1
      end
    end
    result = fixed_item + data[l] + data[r]
  end

  data.insert(index, fixed_item)
end

