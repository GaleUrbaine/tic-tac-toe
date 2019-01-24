class Board
  attr_accessor :board
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts
  end

  def play(array)
    if @board[array[2]] == " "
      if array[1] == "X"
        @board[array[2]] << "X"
      else
        @board[array[2]] << "O"
      end
    else
      puts "Désolée, on passe ton tour."
    end
  end

  def victory?
    case
    when @board[0] == @board[1] && @board[0] == @board[2] && @board[0] != " " && @board[1] != " " && @board[2] != " "
      return true
    when @board[3] == @board[4] && @board[3] == @board[5] && @board[3] != " " && @board[4] != " " && @board[5] != " "
      return true
    when @board[6] == @board[7] && @board[6] == @board[8] && @board[6] != " " && @board[7] != " " && @board[8] != " "
      return true
    when @board[0] == @board[3] && @board[0] == @board[6] && @board[0] != " " && @board[3] != " " && @board[6] != " "
      return true
    when @board[2] == @board[5] && @board[2] == @board[8] && @board[2] != " " && @board[2] != " " && @board[8] != " "
      return true
    when @board[0] == @board[4] && @board[0] == @board[8] && @board[0] != " " && @board[4] != " " && @board[8] != " "
      return true
    when @board[2] == @board[4] && @board[2] == @board[6] && @board[2] != " " && @board[4] != " " && @board[6] != " "
      return true
    when @board[1] == @board[4] && @board[1] == @board[7] && @board[1] != " " && @board[4] != " " && @board[7] != " "
      return true
    else
      return false
    end
  end
end
