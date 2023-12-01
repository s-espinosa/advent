class Monkey

  @@all = []

  def self.all
    @@all
  end

  def self.create(args)
    @@all << new(args)
  end

  attr_reader :id,
              :items,
              :operation,
              :divisor,
              :true_monkey_id,
              :false_monkey_id,
              :inspections

  def initialize(id:, items: [], operation:, divisor:, true_monkey_id:, false_monkey_id:)
    @id = id
    @items = items
    @operation = operation
    @divisor = divisor
    @true_monkey_id = true_monkey_id
    @false_monkey_id = false_monkey_id
    @inspections = 0
  end

  def true_monkey
    @@all.find { |monkey| monkey.id == @true_monkey_id }
  end

  def false_monkey
    @@all.find { |monkey| monkey.id == @false_monkey_id }
  end

  def inspect_items
    until items == []
      item = items.shift
      inspect(item)
      @inspections += 1
    end
  end

  def inspect(old)
    eval(operation)
    item = item / 3
    if item % divisor == 0
      send_item_to(true_monkey, item)
    else
      send_item_to(false_monkey, item)
    end
  end

  def send_item_to(monkey, item)
    monkey.items << item
  end
end

if __FILE__ == $0
  input = File.read('./data/sample.txt')
  monkeys = input.split("\n\n")
  monkeys.each do |monkey|
    lines = monkey.split("\n").map(&:strip)
    id = lines[0].gsub(':', '').split(' ').last.to_i
    items = lines[1].split(': ').last.split(', ').map(&:to_i)
    operation = lines[2].split(': ').last.gsub('new', 'item')
    divisor = lines[3].split(' ').last.to_i
    true_monkey_id = lines[4].split(' ').last.to_i
    false_monkey_id = lines[5].split(' ').last.to_i
    Monkey.create({
      id: id,
      items: items,
      operation: operation,
      divisor: divisor,
      true_monkey_id: true_monkey_id,
      false_monkey_id: false_monkey_id
    })
  end
  10_000.times do |index|
    Monkey.all.each do |monkey|
      monkey.inspect_items
    end
  end
  inspections = Monkey.all.map(&:inspections).sort
  monkey_business = inspections[-1] * inspections[-2]

  puts monkey_business
  require 'pry'; binding.pry
end
