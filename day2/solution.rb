file = File.open("puzzle_input.txt")
datas = file.readlines.map(&:chomp)

number_of_valid_password = 0

datas.each do |data|
  array = data.split(' ')

  count = array[0].split('-')
  letter = array[1][0...-1]
  password = array[2]
  new_password = password.gsub(letter, '')

  counted = password.length - new_password.length

  if count[0].to_i <= counted && counted <= count[1].to_i
    number_of_valid_password += 1
  end
end

puts number_of_valid_password


datas.each do |data|
  array = data.split(' ')

  positions = array[0].split('-')
  letter = array[1][0...-1]
  password = array[2]

  if password[positions[0].to_i - 1] == letter && password[positions[1].to_i - 1] != letter
    number_of_valid_password += 1
  elsif password[positions[0].to_i - 1] != letter && password[positions[1].to_i - 1] == letter
    number_of_valid_password += 1
  end
end

puts number_of_valid_password


