require './lib/polynomial'

describe Polynomial do
  subject { described_class.new(x_value: 18) }

  it 'exists' do
    expect(subject).to be_a(Polynomial)
  end

  it 'has an x value' do
    expect(subject.x_value).to eq(18)
  end

  it 'has a collection of coefficients' do
    expect(subject.coefficients).to eq([0, 1])
  end

  it 'can evaluate to a real number' do
    expect(subject.evaluate).to eq(18)
  end

  it 'can be added to' do
    plus_three = subject + 3

    expect(plus_three.evaluate).to eq(21)
  end

  it 'can be multiplied' do
    times_three = subject * 3

    expect(times_three.evaluate).to eq(54)
  end

  it 'can be squared' do
    squared = subject * 18

    expect(squared.evaluate).to eq(324)
  end

  it 'gives a remainder' do
    remainder = subject % 3

    expect(remainder).to eq(2)
  end
end
