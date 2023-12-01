count = 0

File.readlines('./input.txt').each do |line|
  pair_1, pair_2 = line.split(',')
  low_1, high_1 = pair_1.split('-')
  low_2, high_2 = pair_2.split('-')

  if low_1.to_i <= low_2.to_i && high_2.to_i <= high_1.to_i
    count += 1
  elsif low_2.to_i <= low_1.to_i && high_1.to_i <= high_2.to_i
    count += 1
  end
end

puts count


