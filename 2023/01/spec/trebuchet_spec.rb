require 'trebuchet'

describe Trebuchet do
  it 'sums all calibration values in a file' do
    expect(described_class.calibrate_file(file: './spec/mock_input.txt')).to eq(142)
  end

  it 'sums all calibration values in a text string' do
    input_text = File.open('./spec/mock_input.txt', 'r').read

    expect(described_class.calibrate_text(input_text: input_text)).to eq(142)
  end

  it 'calibrates a single line of text' do
    input_text = '1abc2'

    expect(described_class.calibrate_text(input_text: input_text)).to eq(12)
  end
end
