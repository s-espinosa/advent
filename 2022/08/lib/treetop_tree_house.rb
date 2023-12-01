class TreetopTreeHouse
  def self.count_visible
    new.count_visible
  end

  def self.highest_scenic_score
    new.highest_scenic_score
  end

  def count_visible(input = nil)
    input = input || read_input
    count_each_visible_tree(input)
  end

  def read_input
    File.readlines('data/input.txt').map do |line|
      line.chomp.chars
    end
  end

  def count_each_visible_tree(input)
    visible_trees = []

    visible_trees << left_visible(input)
    visible_trees << right_visible(input)
    visible_trees << top_visible(input)
    visible_trees << bottom_visible(input)

    visible_trees.flatten.uniq.count
  end

  def left_visible(input)
    row_index = 0
    column_index = 0
    left_visible_trees = []

    until row_index == input.length
      current_height = -1
      until column_index == input[row_index].length
        tree_height = input[row_index][column_index].to_i
        if tree_height > current_height
          left_visible_trees << "#{column_index},#{row_index}"
          current_height = tree_height
        end
        column_index += 1
      end
      column_index = 0
      row_index += 1
    end

    left_visible_trees
  end

  def right_visible(input)
    row_index = 0
    column_index = input.first.length - 1
    right_visible_trees = []

    until row_index == input.length
      current_height = -1
      until column_index == 0
        tree_height = input[row_index][column_index].to_i
        if tree_height > current_height
          right_visible_trees << "#{column_index},#{row_index}"
          current_height = tree_height
        end
        column_index -= 1
      end
      column_index = input.first.length - 1
      row_index += 1
    end

    right_visible_trees
  end

  def top_visible(input)
    row_index = 0
    column_index = 0
    top_visible_trees = []

    until column_index == input.first.length
      current_height = -1
      until row_index == input.length - 1
        tree_height = input[row_index][column_index].to_i
        if tree_height > current_height
          top_visible_trees << "#{column_index},#{row_index}"
          current_height = tree_height
        end
        row_index += 1
      end
      column_index += 1
      row_index = 0
    end

    top_visible_trees
  end

  def bottom_visible(input)
    row_index = input.length - 1
    column_index = 0
    bottom_visible_trees = []

    until column_index == input.first.length
      current_height = -1
      until row_index == 0
        tree_height = input[row_index][column_index].to_i
        if tree_height > current_height
          bottom_visible_trees << "#{column_index},#{row_index}"
          current_height = tree_height
        end
        row_index -= 1
      end
      column_index += 1
      row_index = input.length - 1
    end

    bottom_visible_trees
  end

  def highest_scenic_score
    input = read_input
    scores = []

    input.each_with_index do |row, row_index|
      row.each_with_index do |_column, column_index|
        scores << scenic_score(input, row_index, column_index)
      end
    end

    scores.max
  end

  def scenic_score(input, row, column)
    left = view_left(input, row, column)
    right = view_right(input, row, column)
    up = view_up(input, row, column)
    down = view_down(input, row, column)

    left * right * up * down
  end

  def view_left(input, row, column)
    tree_height = input[row][column]
    score = 0

    until false
      column -= 1
      next_height = input[row][column]

      if next_height == nil
        break
      elsif column == -1
        break
      elsif next_height >= tree_height
        score += 1
        break
      else
        score += 1
      end
    end

    score
  end

  def view_right(input, row, column)
    tree_height = input[row][column]
    score = 0

    until false
      column += 1
      next_height = input[row][column]

      if next_height == nil
        break
      elsif next_height >= tree_height
        score += 1
        break
      else
        score += 1
      end
    end

    score
  end

  def view_up(input, row, column)
    tree_height = input[row][column]
    score = 0

    until false
      row -= 1
      next_height = input[row][column]

      if next_height == nil
        break
      elsif row == -1
        break
      elsif next_height >= tree_height
        score += 1
        break
      else
        score += 1
      end
    end

    score
  end

  def view_down(input, row, column)
    tree_height = input[row][column]
    score = 0

    until false
      row += 1
      if input[row]
        next_height = input[row][column]
      else
        next_height = nil
      end

      if next_height == nil
        break
      elsif next_height >= tree_height
        score += 1
        break
      else
        score += 1
      end
    end

    score
  end
end

visible = TreetopTreeHouse.count_visible
score = TreetopTreeHouse.highest_scenic_score

puts "Part 1: #{visible}"
puts "Part 2: #{score}"
