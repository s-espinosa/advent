require 'rspec'
require './lib/treetop_tree_house'

describe TreetopTreeHouse do
  it 'exists' do
    tth = described_class.new

    expect(tth).to be_a(TreetopTreeHouse)
  end

  it 'can_count_a_level_field' do
    input = [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
    ]

    tth = described_class.new

    expected = 8
    actual = tth.count_visible(input)

    expect(actual).to eq(expected)
  end

  it 'can count a field with a single tree' do
    input = [
      [0, 0, 0],
      [0, 1, 0],
      [0, 0, 0]
    ]

    tth = described_class.new

    expected = 9
    actual = tth.count_visible(input)

    expect(actual).to eq(expected)
  end

  it 'can count a field with a dip' do
    input = [
      [1, 1, 1],
      [1, 0, 1],
      [1, 1, 1]
    ]

    tth = described_class.new

    expected = 8
    actual = tth.count_visible(input)

    expect(actual).to eq(expected)
  end

  it 'can count from the top' do
    input = [
      [1, 1, 1],
      [1, 0, 1],
      [1, 1, 1]
    ]

    tth = described_class.new

    expected = ['0,0', '1,0', '2,0']
    actual = tth.top_visible(input)

    expect(actual).to eq(expected)
  end

  it 'can count from the bottom' do
    input = [
      [1, 1, 1],
      [1, 0, 1],
      [1, 1, 1]
    ]

    tth = described_class.new

    expected = ['0,2', '1,2', '2,2']
    actual = tth.bottom_visible(input)

    expect(actual).to eq(expected)
  end

  it 'can count from the left' do
    input = [
      [1, 1, 1],
      [1, 0, 1],
      [1, 1, 1]
    ]

    tth = described_class.new

    expected = ['0,0', '0,1', '0,2']
    actual = tth.left_visible(input)

    expect(actual).to eq(expected)
  end

  it 'can count from the right' do
    input = [
      [1, 1, 1],
      [1, 0, 1],
      [1, 1, 1]
    ]

    tth = described_class.new

    expected = ['2,0', '2,1', '2,2']
    actual = tth.right_visible(input)

    expect(actual).to eq(expected)
  end

  it 'can count a field with dips' do
    input = [
      [0, 0, 0, 0],
      [0, 0, 7, 0],
      [0, 2, 0, 1],
      [8, 5, 5, 8],
      [0, 4, 3, 0],
      [0, 0, 0, 0]
    ]

    tth = described_class.new

    expected = 22
    actual = tth.count_visible(input)

    expect(actual).to eq(expected)
  end

  it 'can count a field with tunnels' do
    input = [
      [8, 8, 8, 8],
      [8, 8, 8, 8],
      [0, 0, 0, 0],
      [8, 8, 8, 8],
      [8, 8, 8, 8],
      [8, 8, 8, 8]
    ]

    tth = described_class.new

    expected = 16
    actual = tth.count_visible(input)

    expect(actual).to eq(expected)
  end

  it 'can count a field with obstructed tunnels and a small hill' do
    input = [
      [8, 8, 8, 8],
      [8, 8, 8, 8],
      [0, 0, 1, 0],
      [8, 8, 8, 8],
      [8, 8, 9, 8],
      [8, 8, 8, 8]
    ]

    tth = described_class.new

    expected = 18
    actual = tth.count_visible(input)

    expect(actual).to eq(expected)
  end

  it 'can determine a scenic score' do
    input = [
      [3, 0, 3, 7, 3],
      [2, 5, 5, 1, 2],
      [6, 5, 3, 3, 2],
      [3, 3, 5, 4, 9],
      [3, 5, 3, 9, 0]
    ]

    tth = described_class.new

    expected = 4
    actual = tth.scenic_score(input, 1, 2)

    expect(actual).to eq(expected)
  end

  it 'can determine a scenic score with different coordinates' do
    input = [
      [3, 0, 3, 7, 3],
      [2, 5, 5, 1, 2],
      [6, 5, 3, 3, 2],
      [3, 3, 5, 4, 9],
      [3, 5, 3, 9, 0]
    ]

    tth = described_class.new

    expected = 8
    actual = tth.scenic_score(input, 3, 2)

    expect(actual).to eq(expected)
  end

  it 'can evaluate a left view' do
    input = [
      [3, 0, 3, 7, 3],
      [2, 5, 5, 1, 2],
      [6, 5, 3, 3, 2],
      [3, 3, 5, 4, 9],
      [3, 5, 3, 9, 0]
    ]

    tth = described_class.new

    expected = 1
    actual = tth.view_left(input, 1, 2)

    expect(actual).to eq(expected)
  end

  it 'can evaluate a right view' do
    input = [
      [3, 0, 3, 7, 3],
      [2, 5, 5, 1, 2],
      [6, 5, 3, 3, 2],
      [3, 3, 5, 4, 9],
      [3, 5, 3, 9, 0]
    ]

    tth = described_class.new

    expected = 2
    actual = tth.view_right(input, 1, 2)

    expect(actual).to eq(expected)
  end

  it 'can evaluate an up view' do
    input = [
      [3, 0, 3, 7, 3],
      [2, 5, 5, 1, 2],
      [6, 5, 3, 3, 2],
      [3, 3, 5, 4, 9],
      [3, 5, 3, 9, 0]
    ]

    tth = described_class.new

    expected = 1
    actual = tth.view_up(input, 1, 2)

    expect(actual).to eq(expected)
  end

  it 'can evaluate a down view' do
    input = [
      [3, 0, 3, 7, 3],
      [2, 5, 5, 1, 2],
      [6, 5, 3, 3, 2],
      [3, 3, 5, 4, 9],
      [3, 5, 3, 9, 0]
    ]

    tth = described_class.new

    expected = 2
    actual = tth.view_down(input, 1, 2)

    expect(actual).to eq(expected)
  end
end
