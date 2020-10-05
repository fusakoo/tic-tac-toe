# TODO
# Finish up the player class to store data (i.e. player name) for customization

# Stores player data

# class Player
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end
# end

# Creates the board for the game

class Board
  def self.display_board(board)
    puts "\n  #{board[0]} | #{board[1]} | #{board[2]} "
    puts " -----------"
    puts "  #{board[3]} | #{board[4]} | #{board[5]} "
    puts " -----------"
    puts "  #{board[6]} | #{board[7]} | #{board[8]} "
  end
end
