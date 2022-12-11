require './lib/head'

describe Head do
  subject { described_class.new }

  it 'exists' do
    expect(subject).to be_a(Head)
  end

  it 'has a starting x coordinate' do
    expect(subject.x).to eq(0)
  end

  it 'has a starting x coordinate' do
    expect(subject.y).to eq(0)
  end

  it 'can move right' do
    subject.move('R')

    expect(subject.y).to eq(1)
  end

  it 'can move left' do
    subject.move('L')

    expect(subject.y).to eq(-1)
  end

  it 'can move up' do
    subject.move('U')

    expect(subject.x).to eq(1)
  end

  it 'can move down' do
    subject.move('D')

    expect(subject.x).to eq(-1)
  end

  it 'has a location' do
    expect(subject.location).to eq('0,0')
  end
end

