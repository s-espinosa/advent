doubles = []

File.readlines('./input.txt').each do |line|
  line = line.chomp

  pointer_1 = 0
  pointer_2 = line.length / 2
  found = false
  until found == true
    if line[pointer_1] == line[pointer_2]
      doubles << line[pointer_1]
      found = true
    elsif pointer_2 == line.length - 1
      pointer_2 = line.length/2
      pointer_1 += 1
    else
      pointer_2 += 1
    end
  end
end

lower = ('a'..'z').to_a
upper = ('A'..'Z').to_a
all = lower + upper

points = doubles.map do |letter|
  all.index(letter) + 1
end.sum

lines = []

File.readlines('./input.txt').each_with_index do |line, index|
  if index % 3 == 0
    lines << [line.chomp]
  else
    lines.last << line.chomp
  end
end

badge_letters = []
lines.each do |line|
  first = line[0]
  second = line[1]
  third = line[2]

  first_and_second = []

  first.chars.each do |first_letter|
    second.chars.each do |second_letter|
      if second_letter == first_letter
        first_and_second << first_letter
      end
    end
  end

  pointer_1 = 0
  pointer_2 = 0

  found = false
  until found == true
    if first_and_second[pointer_1] == third[pointer_2]
      badge_letters << third[pointer_2]
      found = true
    elsif pointer_2 == third.length - 1
      pointer_2 = 0
      pointer_1 += 1
    else
      pointer_2 += 1
    end
  end
end

points = badge_letters.map do |letter|
  all.index(letter) + 1
end.sum

require 'pry'; binding.pry
