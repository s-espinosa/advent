class AdventDirectory
  attr_reader :files,
              :name,
              :parent

  def initialize(name:, parent:)
    @files = []
    @name = name
    @parent = parent
  end

  def size
    @files.sum do |file|
      file.size
    end
  end
end

class AdventFile
  attr_reader :size

  def initialize(name:, size:)
    @size = size
  end
end

class AdventSystem
  MAXSIZE = 100_000

  attr_reader :head,
              :current_node

  def initialize
    @head = AdventDirectory.new(name: 'root', parent: nil)
    @current_node = @head
  end

  def self.create
    input = File.read('./input.txt').split("\n")
    new.create(input)
  end

  def create(input)
    until input == []
      current_command = input.shift
      if current_command == '$ cd /'
        @current_node = @head
      elsif current_command[0..3] == '$ cd'
        change_directory(current_command[5..-1])
      elsif current_command[0..3] == '$ ls'
        process_directories(input)
      end
    end
    self
  end

  def change_directory(name)
    if name == '..'
      @current_node = @current_node.parent
    else
      @current_node = @current_node.files.find do |file|
        file.is_a?(AdventDirectory) && file.name == name
      end
    end
  end

  def process_directories(input)
    next_line = input.first
    while next_line != nil && next_line[0] != '$'
      current_line = input.shift
      if current_line[0..2] == 'dir'
        directory = AdventDirectory.new(name: current_line[4..-1], parent: @current_node)
        @current_node.files << directory
      elsif current_line[0] != '$'
        size, name = current_line.split(' ')
        file = AdventFile.new(name: name, size: size.to_i)
        @current_node.files << file
      end
      next_line = input.first
    end
  end

  def small_directories(current_node: @head, small: [])
    current_node.files.each do |directory|
      if directory.is_a?(AdventDirectory) && directory.size <= MAXSIZE
        small << directory
        small_directories(current_node: directory, small: small)
      elsif directory.is_a?(AdventDirectory)
        small_directories(current_node: directory, small: small)
      end
    end

    small.flatten
  end

  def sum_of_smallest
    small_directories.sum do |directory|
      directory.size
    end
  end

  def big_enough(current_node: @head, big: [])
    current_node.files.each do |directory|
      if directory.is_a?(AdventDirectory) && directory.size >= needed
        big << directory
        big_enough(current_node: directory, big: big)
      end
    end
    big
  end

  def smallest_big
    big_enough.sort_by(&:size).first
  end

  def needed
    @needed ||= (@head.size + 30_000_000) - 70_000_000
  end
end

as = AdventSystem.create

puts "Part 1: #{as.sum_of_smallest}"
puts "Part 2: #{as.smallest_big.size}"
