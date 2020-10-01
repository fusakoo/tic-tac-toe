# require_relative 'move'
# require_relative 'display_board'

class PlayTicTacToe
  board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

  # helper methods

  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(board, index, player)
    board[index] = player
  end

  def position_taken?(board, index)
    # ToDo: see if there's a way to simplify the code below using regex
    if (board[index] != ' ') || (board[index] == "") || (board[index] == nil)
      false
    else
      true
    end
  end

  def valid_move?(board, index)
    if index.between?(0, 8) && !position_taken?(board, index)
      true
    end
  end

  def turn_count(board)
    
  end  
end
