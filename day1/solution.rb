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

puts head * tail

