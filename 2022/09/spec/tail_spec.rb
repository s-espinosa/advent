require './lib/tail'
require './lib/head'

describe Tail do
  subject { described_class.new }

  it 'exists' do
    expect(subject).to be_a(Tail)
  end

  it 'has an x coordinate' do
    expect(subject.x).to eq(0)
  end

  it 'has a y coordinate' do
    expect(subject.y).to eq(0)
  end

  it 'can follow right' do
    head = Head.new(2, 0)
    subject.follow(head)

    expect(subject.x).to eq(1)
  end

  it 'can follow left' do
    head = Head.new(-2, 0)
    subject.follow(head)

    expect(subject.x).to eq(-1)
  end

  it 'can follow up' do
    head = Head.new(0, 2)
    subject.follow(head)

    expect(subject.y).to eq(1)
  end

  it 'can follow down' do
    head = Head.new(0, -2)
    subject.follow(head)

    expect(subject.y).to eq(-1)
  end

  it 'starts with a path' do
    expect(subject.path).to eq(['0,0'])
  end

  it 'knows where it has been' do
    head = Head.new(2, 0)
    subject.follow(head)

    expected = ['0,0', '1,0']
    actual = subject.path

    expect(actual).to eq(expected)
  end

  it 'can follow north north east' do
    head = Head.new(1, 2)

    subject.follow(head)

    expect(subject.path.last).to eq('1,1')
  end

  it 'can follow east north east' do
    head = Head.new(2, 1)

    subject.follow(head)

    expect(subject.path.last).to eq('1,1')
  end

  it 'can follow north north west' do
    head = Head.new(-1, 2)

    subject.follow(head)

    expect(subject.path.last).to eq('-1,1')
  end

  it 'can follow west north west' do
    head = Head.new(-2, 1)

    subject.follow(head)

    expect(subject.path.last).to eq('-1,1')
  end

  it 'can follow south south east' do
    head = Head.new(1, -2)

    subject.follow(head)

    expect(subject.path.last).to eq('1,-1')
  end

  it 'can follow east south east' do
    head = Head.new(2, -1)

    subject.follow(head)

    expect(subject.path.last).to eq('1,-1')
  end

  it 'can follow south south west' do
    head = Head.new(-1, -2)

    subject.follow(head)

    expect(subject.path.last).to eq('-1,-1')

  end

  it 'can follow west south west' do
    head = Head.new(-2, -1)

    subject.follow(head)

    expect(subject.path.last).to eq('-1,-1')
  end

  it 'has a location' do
    expect(subject.location).to eq('0,0')
  end
end
