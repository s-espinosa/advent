require './lib/monkey'
require './lib/package'

describe Monkey do
  subject do
    described_class.new(
      id: 0,
      packages: packages,
      operation: operation,
      divisor: 3,
      true_monkey_id: 1,
      false_monkey_id: 2,
    )
  end

  let(:operation) { 'new = old * 19' }
  let(:package_1) { Package.new(worry_value: 14) }
  let(:package_2) { Package.new(worry_value: 12) }
  let(:packages) { [package_1, package_2] }
  let(:true_monkey) do
    described_class.new(
      id: 1,
      packages: [],
      operation: 'new = old + 6',
      divisor: 4,
      true_monkey_id: 2,
      false_monkey_id: 0,
    )
  end
  let(:false_monkey) do
    described_class.new(
      id: 2,
      packages: [],
      operation: 'new = old * old',
      divisor: 5,
      true_monkey_id: 0,
      false_monkey_id: 1,
    )
  end
  let(:monkey_args) do
    {
      id: 3,
      packages: [],
      operation: 'new = old * old',
      divisor: 5,
      true_monkey_id: 0,
      false_monkey_id: 1,
    }
  end


  it 'exists' do
    expect(subject).to be_a(Monkey)
  end

  it 'has an id' do
    expect(subject.id).to eq(0)
  end

  it 'starts with a collection of packages' do
    expect(subject.packages).to eq(packages)
  end

  it 'starts with an operation' do
    expect(subject.operation).to eq(operation)
  end

  it 'starts with a test divisor' do
    expect(subject.divisor).to eq(3)
  end

  it 'starts with a true monkey' do
    expect(subject.true_monkey_id).to eq(true_monkey.id)
  end

  it 'starts with a false monkey' do
    expect(subject.false_monkey_id).to eq(false_monkey.id)
  end

  it 'has a collection of monkeys' do
    expect(described_class.all).to eq([])
  end

  it 'can add a new monkey' do
    Monkey.create(monkey_args)

    expect(Monkey.all.size).to eq(1)
  end
end
