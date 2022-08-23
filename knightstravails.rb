class Board
  attr_accessor :board
  def initialize
    @board = []
    i = 0
    while i < 64
      if i + 1 > 9
        @board << Field.new("#{i + 1}")
        i += 1
      else
        @board << Field.new("0#{i + 1}")
        i += 1
      end
    end
  end

  def print_board
    i = 0
    breaker = 1
    while i < 64
      if breaker == 8
        print " #{@board[i].number} \n\n"
        breaker = 1
      else
        print " #{@board[i].number} "
        breaker += 1
      end
      i += 1
    end
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