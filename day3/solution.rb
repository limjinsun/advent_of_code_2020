file = File.open('puzzle_input.txt')
datas = file.readlines.map(&:chomp)

def get_tree_count(datas, increase_value)
  tree_count = 0
  tree_index = increase_value

  datas.each_with_index { |row, index|
    next if index == 0

    until row.length > tree_index
      row += row
    end

    if row[tree_index] == '#'
      tree_count += 1
    end
    tree_index += increase_value
  }

  tree_count
end

def get_tree_count_2(datas, increase_value)
  tree_count = 0
  tree_index = increase_value

  datas.each_with_index { |row, index|
    next if index == 0 || index % 2 != 0

    until row.length > tree_index
      row += row
    end

    if row[tree_index] == '#'
      tree_count += 1
    end
    tree_index += increase_value
  }
  
  tree_count
end

puts get_tree_count(datas, 1) * get_tree_count(datas, 3) * get_tree_count(datas, 5) * get_tree_count(datas, 7) * get_tree_count_2(datas, 1)
