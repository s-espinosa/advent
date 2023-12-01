class Trebuchet
  def self.calibrate_file(file:)
    input_text = File.open(file, 'r').read

    calibrate_text(input_text: input_text)
  end 

  def self.calibrate_text(input_text:)
    new.calibrate_text(input_text: input_text)
  end

  def initialize
    @first_integer = nil
    @last_integer = nil
  end

  def calibrate_text(input_text:)
    input_text.split.map do |line|
      calibrate_line(line_of_text: line)
    end.sum
  end

  private

  def calibrate_line(line_of_text:)
    find_integer_strings(line_of_text: line_of_text)

    calibrated_value = smoosh_integer_strings(
      string_one: @first_integer,
      string_two: @last_integer
    )
    reset
    calibrated_value
  end

  def find_integer_strings(line_of_text:)
    line_of_text.each_char do |character|
      Integer(character)

      @first_integer = character if @first_integer.nil?
      @last_integer = character
    rescue
      next
    end
  end

  def smoosh_integer_strings(string_one:, string_two:)
    Integer(string_one.concat(string_two))
  end

  def reset
    @first_integer = nil
    @last_integer = nil
  end
end

if __FILE__ == $PROGRAM_NAME
  puts Trebuchet.calibrate_file(file: './data/input.txt')
  puts "This will only be printed when directly launched."
end
