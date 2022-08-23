class Board
  attr_accessor :board
  def initialize
    @board = []
    i = 0
    while i < 64
      if i + 1 > 9
        @board << Field.new("#{i}")
        i += 1
      else
        @board << Field.new("#{i}")
        i += 1
      end
    end
  end

  def print_board
    i = 0
    breaker = 1
    while i < 64
      if breaker == 8 && i < 10
        print " 0#{@board[i].number} \n\n"
        breaker = 1
      elsif breaker == 8
        print " #{@board[i].number} \n\n"
        breaker = 1
      elsif i < 10
        print " 0#{@board[i].number} "
        breaker += 1
      else
        print " #{@board[i].number} "
        breaker += 1
      end
      i += 1
    end
  end

  def knight_moves(start, goal)
    start_val = start[0] * 8 + start[1]
    goal_val = goal[0] * 8 + goal[1]

    start_field = @board[start_val]
    goal_field = @board[goal_val]

    puts start_field.number
    puts goal_field.number
  end
end

class Field
  attr_accessor :number, :holds_knight
  def initialize(number)
    @number = number
    @holds_knight = false
  end
end

board = Board.new
board.print_board

board.knight_moves([0, 0], [1, 1])