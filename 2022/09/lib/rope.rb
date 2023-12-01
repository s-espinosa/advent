require './lib/head'
require './lib/tail'
require './lib/knot'

class Rope
  def self.travel(input = nil, knots = [Knot.new])
    input ||= File.read('./data/input.txt')
    rope = new(knots)
    rope.travel(input)
    rope
  end

  def initialize(knots)
    @head = Knot.new
    @knots = knots
  end

  def tail
    @knots.last
  end

  def head_location
    @head.location
  end

  def tail_location
    tail.location
  end

  def move(instructions)
    direction, steps = instructions.split(' ')

    steps.to_i.times do
      @head.move(direction)
      @knots.each_with_index do |knot, index|
        if index == 0
          knot.follow(@head)
        else
          knot.follow(@knots[index - 1])
        end
      end
    end
  end

  def travel(input)
    input.split("\n").each do |line|
      move(line.chomp)
    end
  end

  def tail_locations
    tail.locations
  end
end

if __FILE__ == $0
  # f = File.read('./data/sample_2.txt')
  r = Rope.travel
  tail_locations = r.tail_locations.count
  knots = [
    Knot.new,
    Knot.new,
    Knot.new,
    Knot.new,
    Knot.new,
    Knot.new,
    Knot.new,
    Knot.new,
    Knot.new,
  ]
  r2 = Rope.travel(nil, knots)
  tail_locations_2 = r2.tail_locations.count

  puts "Part 1: #{tail_locations}"
  puts "Part 2: #{tail_locations_2}"
end
