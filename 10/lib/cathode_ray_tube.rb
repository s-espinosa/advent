class CathodeRayTube
  def self.get_input
    File.read('./data/input.txt')
  end

  def self.process(input = nil)
    input ||= get_input
    crt = new
    crt.process(input)
    crt
  end

  attr_reader :cycles,
              :drawing,
              :register,
              :signal_strengths

  def initialize
    @cycles = 0
    @register = 1
    @signal_strengths = []
    @drawing = ""
  end

  def draw
    if [@register, @register + 1, @register + 2].include?(@cycles % 40)
      @drawing << '#'
    else
      @drawing << '.'
    end
    @drawing << "\n" if @cycles % 40 == 0
  end

  def process(instructions)
    instructions.chomp.split("\n").each do |instruction|
      tick(instruction)
    end
  end

  def record_register
    if (@cycles + 20) % 40 == 0
      @signal_strengths << @register * @cycles
    end
  end

  def tick(instruction)
    if instruction == 'noop'
      @cycles += 1
      record_register
      draw
    else
      @cycles += 1
      record_register
      draw
      @cycles += 1
      record_register
      draw
      @register += instruction.split.last.to_i
    end
  end
end

if __FILE__ == $0
  c = CathodeRayTube.process

  strengths = c.signal_strengths.sum
  drawing = c.drawing

  puts "Part 1: #{strengths}"
  puts "Part 2:\n#{drawing}"
end
