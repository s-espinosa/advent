require './lib/package'

describe Package do
  subject { described_class.new(worry_value: 4) }

  it 'exists' do
    expect(subject).to be_a(Package)
  end

  it 'has a worry value' do
    expect(subject.worry_value).to eq(4)
  end
end
