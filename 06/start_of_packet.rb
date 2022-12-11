stream = File.read('./input.txt').chomp.chars

pointer = 0
comparisons = 0

until comparisons == 6
  comparisons = 0
  comparisons += 1 if stream[pointer] != stream[pointer + 1]
  comparisons += 1 if stream[pointer] != stream[pointer + 2]
  comparisons += 1 if stream[pointer] != stream[pointer + 3]
  comparisons += 1 if stream[pointer + 1] != stream[pointer + 2]
  comparisons += 1 if stream[pointer + 1] != stream[pointer + 3]
  comparisons += 1 if stream[pointer + 2] != stream[pointer + 3]
  pointer += 1
end

puts "Part 1: #{pointer + 4}"

base = 0
lower = 0
upper = 1

until lower == 14
  until upper == 14
    if stream[base+lower] != stream[base+upper]
      upper += 1
    else
      base += 1
      lower = 0
      upper = 1
    end
  end
  lower += 1
  upper = lower + 1
end

puts "Part 2: #{base + 14}"

