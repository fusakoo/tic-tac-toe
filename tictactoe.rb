require_relative 'classes'

# Runs the game logic
class TicTacToe < Board
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def play(board)
    turn(board) until done?(board)
    if won?(board)
      match_winner = winner(board) == 'X' ? @player1 : @player2
      match_winner.score += 1
      puts "\n Ding ding! #{match_winner.name}, you're the winner!"
      puts " Current score: #{@player1.name} #{@player1.score} | #{@player2.name} #{@player2.score}"
    elsif draw?(board)
      puts "\n Draw!"
    end
  end

  def turn(board)
    if turn_count(board).even?
      puts "\n #{@player1.name} ('X'), please enter 1-9: "
    else
      puts "\n #{@player2.name} ('O'), please enter 1-9: "
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
      spot1 = board[combination[0]]
      spot2 = board[combination[1]]
      spot3 = board[combination[2]]

      # the combination must be returned in order for winner() method to work
      if spot_taken?(board, combination[0]) &&
         spot1 == spot2 &&
         spot2 == spot3
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
    draw?(board) || won?(board) || full?(board)
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
