require './lib/cathode_ray_tube'

describe CathodeRayTube do
  subject { described_class.new }
  it 'exists' do
    expect(subject).to be_a(CathodeRayTube)
  end

  it 'is initialized with a number of cycles' do
    expect(subject.cycles).to eq(0)
  end

  it 'is initialized with a register' do
    expect(subject.register).to eq(1)
  end

  it 'ticks with noop input' do
    subject.tick('noop')

    expected = 1
    actual = subject.cycles

    expect(actual).to eq(expected)
  end

  it 'ticks with add input' do
    subject.tick('add 3')

    expected = 2
    actual = subject.cycles

    expect(actual).to eq(expected)
  end

  it 'adjusts the register with add input' do
    subject.tick('add 3')

    expected = 4
    actual = subject.register

    expect(actual).to eq(expected)
  end

  it 'adjusts the register with add input' do
    subject.tick('add -5')

    expected = -4
    actual = subject.register

    expect(actual).to eq(expected)
  end

  it 'processes a series of instructions' do
    instructions = "noop\naddx 3\naddx -5\n"
    subject.process(instructions)

    expected = -1
    actual = subject.register

    expect(actual).to eq(expected)
  end

  it 'records signal strengths' do
    instructions = File.read('./data/example.txt')
    subject.process(instructions)

    expected = [420, 1140, 1800, 2940, 2880, 3960]
    actual = subject.signal_strengths

    expect(actual).to eq(expected)
  end
end
