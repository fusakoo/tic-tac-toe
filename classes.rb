# stores player data
class Player
  attr_accessor :name, :score

  def initialize(name)
    @name = name
    @score = 0
  end
end

# creates the board for the game
class Board
  # note: when @board is defined in initialize here & super'ed into TicTacToe
  # the board instance variable has MethodError w/ array methods b/c Board class

  WIN_COMBINATIONS = [
    [0, 1, 2], # top horizontal
    [3, 4, 5], # mid horizontal
    [6, 7, 8], # bottom horizontal
    [0, 3, 6], # left vertical
    [1, 4, 7], # mid vertical
    [2, 5, 8], # right vertical
    [0, 4, 8], # upper-left to lower-bottom vertical
    [6, 4, 2]  # bottom-left to upper-right vertical
  ]

  def self.display_board(board)
    puts "\n #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
end
