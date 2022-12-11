require 'benchmark'

stream = File.read('./input.txt').chomp.chars

pointer = 0
comparisons = 0

until comparisons == 6
  comparisons = 0
  comparisons += 1 if stream[pointer] != stream[pointer + 1]
  comparisons += 1 if stream[pointer] != stream[pointer + 2]
  comparisons += 1 if stream[pointer] != stream[pointer + 3]
  comparisons += 1 if stream[pointer + 1] != stream[pointer + 2]
  comparisons += 1 if stream[pointer + 1] != stream[pointer + 3]
  comparisons += 1 if stream[pointer + 2] != stream[pointer + 3]
  pointer += 1
end


base = 0
lower = 0
upper = 1

until lower == 14
  until upper == 14
    if stream[base+lower] != stream[base+upper]
      upper += 1
    else
      base += 1
      lower = 0
      upper = 1
    end
  end
  lower += 1
  upper = lower + 1
end

class TuningTrouble
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def vamonos!(num)
    index = 0
    no_repeats = false
    until no_repeats == true
      if text[index..(index + num - 1)].chars.uniq.length == num
        no_repeats = true
      else
        index += 1
      end
    end
    index + num
  end

  def self.part_one!(text)
    new(text).vamonos!(4)
  end

  def self.part_two!(text)
    new(text).vamonos!(14)
  end
end

def sal(stream)
  stream = stream.chars
  base = 0
  lower = 0
  upper = 1

  until lower == 14
    until upper == 14
      if stream[base+lower] != stream[base+upper]
        upper += 1
      else
        base += 1
        lower = 0
        upper = 1
      end
    end
    lower += 1
    upper = lower + 1
  end

  return base + 14
end

def lee(stream)
  input = stream.split("")
  window_size = 14

  0.upto(input.size - 1) do |window_end|
    if window_end < window_size - 1 # keep running window_end to achieve window_size
      next
    else # we have 4 chars
      potential_set = input.slice((window_end - (window_size -1)), window_size)
      if (potential_set == potential_set.uniq)
        window_end + 1
        break
      else
        next
      end
    end
  end
end

def mark(stream)
  TuningTrouble.part_two!(stream)
end

n = 100
sal_stream = stream.join('')

Benchmark.bm(7) do |x|
  x.report("sal:")  { n.times { sal(sal_stream) } }
  x.report("lee:")  { n.times { lee(sal_stream) } }
  x.report("mark:") { n.times { mark(sal_stream) } }
end
