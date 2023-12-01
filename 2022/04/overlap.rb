def lower(pair_1, pair_2)
  pair_1[1].to_i < pair_2[0].to_i
end

def no_overlap(pair_1, pair_2)
  lower(pair_1, pair_2) || lower(pair_2, pair_1)
end

count = 0

File.readlines('./input.txt').each do |line|
  pair_1, pair_2 = line.split(',')
  low_1, high_1 = pair_1.split('-')
  low_2, high_2 = pair_2.split('-')

  unless no_overlap([low_1, high_1], [low_2, high_2])
    count +=1
  end
end

puts count


