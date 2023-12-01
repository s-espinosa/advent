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
