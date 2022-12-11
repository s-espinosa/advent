stacks = [
  %w[R G J B T V Z],
  %w[J R V L],
  %w[S Q F],
  %w[Z H N L F V Q G],
  %w[R Q T J C S M W],
  %w[S W T C H F],
  %w[D Z C V F N J],
  %w[L G Z D W R F Q],
  %w[J B W V P]
]

moves = []
File.readlines('./moves.txt').each do |line|
  _move, crates, _from, from, _to, to = line.split(' ')
  moves << {
    crates: crates.to_i,
    from: from.to_i,
    to: to.to_i
  }
end

moves.each do |move|
  from = stacks[move[:from] - 1]
  to = stacks[move[:to] - 1]

  move[:crates].times do
    to.push(from.pop)
  end
end

tops = []

stacks.each do |stack|
  tops << stack.last
end

part_1 = tops.join

stacks = [
  %w[R G J B T V Z],
  %w[J R V L],
  %w[S Q F],
  %w[Z H N L F V Q G],
  %w[R Q T J C S M W],
  %w[S W T C H F],
  %w[D Z C V F N J],
  %w[L G Z D W R F Q],
  %w[J B W V P]
]

moves.each do |move|
  from = stacks[move[:from] - 1]
  to = stacks[move[:to] - 1]
  number_of_crates = move[:crates]

  from.pop(number_of_crates).each do |letter|
    to.push(letter)
  end
end

tops = []

stacks.each do |stack|
  tops << stack.last
end

part_2 = tops.join

puts "Part 1: #{part_1}"
puts "Part 2: #{part_2}"

