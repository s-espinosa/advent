class Polynomial
  attr_reader :x_value,
              :coefficients

  def initialize(x_value:, coefficients: [0, 1])
    @x_value = x_value
    @coefficients = coefficients
  end

  def evaluate
    sum = 0
    coefficients.each_with_index do |coefficient, index|
      sum += coefficient * (@x_value ** index)
    end
    sum
  end

  def +(integer)
    @coefficients[0] += integer
    Polynomial.new(x_value: @x_value, coefficients: @coefficients)
  end

  def *(integer)
    if integer == @x_value
      new_coefficients = @coefficients.unshift(0)
      Polynomial.new(x_value: @x_value, coefficients: new_coefficients)
    else
      new_coefficients = @coefficients.map do |coefficient|
        coefficient * integer
      end
      Polynomial.new(x_value: @x_value, coefficients: new_coefficients)
    end
  end

  def %(integer)
    old_x = @x_value
  end
end
