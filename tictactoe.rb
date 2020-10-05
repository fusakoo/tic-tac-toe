require_relative 'classes'

# Runs the game logic

class TicTacToe < Board
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

  def play(board)
    turn(board) until done?(board)
    if won?(board)
      winner(board) == "X" ? (match_winner = "Player 1") : (match_winner = "Player 2")
      puts "\n Ding ding! #{match_winner}, you did it!"
    elsif draw?(board)
      puts "\n Draw!"
    end
  end

  def turn(board)
    if turn_count(board).even?
      puts "\n Player 1('X'), please enter 1-9: "
    else
      puts "\n Player 2('O'), please enter 1-9: "
    end
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(board, index)
      move(board, index, current_player(board))
      Board.display_board(board)
    end
  end

  protected

  def won?(board)
    WIN_COMBINATIONS.each do |combination| # check value (X or O) at win spots
      spot_1 = board[combination[0]]
      spot_2 = board[combination[1]]
      spot_3 = board[combination[2]]

      # the combination must be returned in order for winner() method to work
      if spot_taken?(board, combination[0]) && 
         spot_1 == spot_2 && 
         spot_2 == spot_3
        return combination
      end
    end
    false
  end

  def winner(board)
    if won?(board)
      board[won?(board)[0]]
    end
  end

  def full?(board)
    board.all? { |i| i == 'X' || i == 'O' }
  end

  def draw?(board)
    if !won?(board) && full?(board)
      true
    elsif !won?(board) && !full?(board)
      false
    elsif won?(board)
      false
    end
  end

  def done?(board)
    if draw?(board) || won?(board) || full?(board)
      true
    end
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(board, index, player)
    board[index] = player
  end

  def spot_taken?(board, index)
    board[index] != ' '
  end

  def valid_move?(board, index)
    if index.between?(0, 8) && !spot_taken?(board, index)
      true
    elsif !(index.between?(0,8))
      puts "\n You've inputted an invalid number (must be between 1-9)."
      puts " Please select another spot: "
    else
      puts "\n The spot you've selected ('#{index + 1}') is taken."
      puts " Please select another spot: "
    end
  end

  def turn_count(board)
    counter = 0
    board.each do |spot|
      if %w[X O].include? spot
        counter += 1
      end
    end
    counter
  end

  def current_player(board)
    turn_count(board).even? ? 'X' : 'O'
  end
end
