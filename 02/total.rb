require_relative './round'

total = 0
File.readlines('./input.txt').each do |line|
  moves = line.chomp.split
  total += Round.new(opponent_move: moves[0], my_move: moves[1]).points
end

puts total

total = 0
File.readlines('./input.txt').each do |line|
  moves = line.chomp.split
  total += Round.new(opponent_move: moves[0], my_move: moves[1]).new_points
end

puts total
