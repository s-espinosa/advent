class MostCalories
  def initialize(file_location)
    @file_location = file_location
    @max_1 = 0
    @max_2 = 0
    @max_3 = 0
  end

  def calculate
    total = 0
    File.readlines('./elves.txt').each do |line|
      if line == "\n"
        recalculate_max(total)
        total = 0
      else
        total += line.to_i
      end
    end
    recalculate_max(total)
    @max_1 + @max_2 + @max_3
  end

  def recalculate_max(total)
    if total >= @max_1
      @max_3 = @max_2
      @max_2 = @max_1
      @max_1 = total
    elsif total >= @max_2
      @max_3 = @max_2
      @max_2 = total
    elsif total >= @max_3
      @max_3 = total
    end
  end
end

mc = MostCalories.new('./elves.txt')

puts mc.calculate
