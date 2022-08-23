class Board
  attr_accessor :board
  def initialize
    @board = []
    8.times do
      arr = []
      8.times { arr << Field.new }
      @board << arr
    end

    i = 0
    while i < 64
      @board.flatten[i].number = i
      i += 1
    end
  end

  def print_board
    i = 0
    breaker = 1
    while i < 64
      if breaker == 8 && i < 10
        print " 0#{@board.flatten[i].number} \n\n"
        breaker = 1
      elsif breaker == 8
        print " #{@board.flatten[i].number} \n\n"
        breaker = 1
      elsif i < 10
        print " 0#{@board.flatten[i].number} "
        breaker += 1
      else
        print " #{@board.flatten[i].number} "
        breaker += 1
      end
      i += 1
    end
  end

  def knight_moves(start, goal = nil)
    s_row = start[0]
    s_column = start[1]
    s_field = self.board[s_row][s_column]
    #s_field.holds_knight = true
    p s_field

    g_row = goal[0]
    g_column = goal[1]
    g_field = self.board[g_row][g_column]
    #g_field.holds_knight = true
    p g_field
  end

  def build_tree(node, final, arr = [], i = 0) # Coordinate arrays
    #return p "imax #{arr}" if i == 4
    puts i
    #return if arr.last == final
    arr << node
    return p "#{arr} found" if node == final

    node_row = node[0]
    node_column = node[1]
    p node = self.board[node_row][node_column]

    final_row = final[0]
    final_column = final[1]
    final = self.board[final_row][final_column]

    build_tree([node_row + 1, node_column + 2], [final_row, final_column], arr, i + 1) unless self.board[node_row + 1][node_column + 2].nil?
    build_tree([node_row + 2, node_column + 1], [final_row, final_column], arr, i + 1) unless self.board[node_row + 2][node_column + 1].nil?
    puts "\n\n"

  end

  def build_tree2(node, final, arr = [], i = 0) # Coordinate arrays
    return p "imax #{arr}" if i == 4
    puts i
    #return if arr.last == final
    arr << node

    node_row = node[0]
    node_column = node[1]
    p node = self.board[node_row][node_column]

    final_row = final[0]
    final_column = final[1]
    final = self.board[final_row][final_column]
    return p "#{arr} found" if node == final

    build_tree([node_row + 2, node_column + 1], [final_row, final_column], arr, i + 1) unless self.board[node_row + 2][node_column + 1].nil?
    build_tree([node_row + 1, node_column + 2], [final_row, final_column], arr, i + 1) unless self.board[node_row + 1][node_column + 2].nil?
    puts "\n\n"

  end
end

class Field
  attr_accessor :number, :holds_knight, :n_1, :n_2
  def initialize(number = nil)
    @number = number

    @n_1 = nil
    @n_2 = nil
  end
end

board = Board.new
#board.knight_moves([0, 0], [1, 1])
board.print_board
board.build_tree([0, 0], [2, 4])
#board.build_tree[[0, 0], [4, 2]]
