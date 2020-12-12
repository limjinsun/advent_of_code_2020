file = File.open("puzzle_input.txt")
file_data = file.readlines.map(&:chomp)

puts file_data.inspect