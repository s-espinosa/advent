class Round
  def initialize(opponent_move:, my_move:)
    @opponent_move = opponent_move
    @my_move = my_move
  end

  def points
    move_points + result_points
  end

  def new_points
    new_move_points + new_result_points
  end

  private
  attr_reader :my_move,
    :opponent_move

  def win?
    winners[opponent_move] == my_move
  end

  def draw?
    draws[opponent_move] == my_move
  end

  def winners
    {
      'A' => 'Y',
      'B' => 'Z',
      'C' => 'X'
    }
  end

  def draws
    {
      'A' => 'X',
      'B' => 'Y',
      'C' => 'Z'
    }
  end

  def move_points
    move_table[my_move]
  end

  def move_table
    {
      'X' => 1,
      'Y' => 2,
      'Z' => 3
    }
  end

  def result_points
    return 6 if win?
    return 3 if draw?
    return 0
  end

  def new_result_points
    return 6 if my_move == 'Z'
    return 3 if my_move == 'Y'
    return 0 if my_move == 'X'
  end

  def new_move_points
    new_move_table[my_new_move]
  end

  def new_move_table
    {
      'A' => 1,
      'B' => 2,
      'C' => 3
    }
  end

  def my_new_move
    if my_move == 'Z'
      new_winners[opponent_move]
    elsif my_move == 'Y'
      opponent_move
    else
      new_losers[opponent_move]
    end
  end

  def new_winners
    {
      'A' => 'B',
      'B' => 'C',
      'C' => 'A'
    }
  end

  def new_losers
    {
      'A' => 'C',
      'B' => 'A',
      'C' => 'B'
    }
  end
end
