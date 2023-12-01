require './lib/rope'

describe Rope do
  subject { described_class.new }

  it 'exists' do
    expect(subject).to be_a(Rope)
  end

  it 'has a head location' do
    expected = '0,0'
    actual = subject.head_location

    expect(actual).to eq(expected)
  end

  it 'has a tail locaion' do
    expected = '0,0'
    actual = subject.tail_location

    expect(actual).to eq(expected)
  end

  it 'can move its head' do
    subject.move('R 4')
    expected_head_location = '0,4'
    actual = subject.head_location

    expect(actual).to eq(expected_head_location)
  end

  it 'can move its tail' do
    subject.move('R 4')
    expected_tail_location = '0,3'
    actual = subject.tail_location

    expect(actual).to eq(expected_tail_location)
  end
end
