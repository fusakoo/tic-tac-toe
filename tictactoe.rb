require_relative 'classes'

# main class that runs the game logic
class TicTacToe < Board
  attr_reader :board

  def initialize(player1, player2)
    @board = Array.new(9, ' ')
    @player1 = player1
    @player2 = player2
  end

  def play
    turn until done?
    if won?
      match_winner = winner == 'X' ? @player1 : @player2
      match_winner.score += 1
      puts "\n Ding ding! #{match_winner.name}, you're the winner!"
      puts " Current score: #{@player1.name} #{@player1.score} | #{@player2.name} #{@player2.score}"
    elsif draw?
      puts "\n Draw!"
    end
  end

  def turn
    if turn_count.even?
      puts "\n #{@player1.name} ('X'), please enter a number between 1-9: "
    else
      puts "\n #{@player2.name} ('O'), please enter a number between 1-9: "
    end
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      Board.display_board(@board)
    end
  end

  protected

  def won?
    WIN_COMBINATIONS.each do |combination| # check value (X or O) at win spots
      spot1 = @board[combination[0]]
      spot2 = @board[combination[1]]
      spot3 = @board[combination[2]]

      # the combination must be returned in order for winner() method to work
      if spot_taken?(combination[0]) &&
         spot1 == spot2 &&
         spot2 == spot3
        return combination
      end
    end
    false
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def full?
    @board.all? { |spot| spot != ' ' }
  end

  def draw?
    if !won? && full?
      true
    elsif !won? && !full?
      false
    elsif won?
      false
    end
  end

  def done?
    draw? || won? || full?
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def spot_taken?(index)
    @board[index] != ' '
  end

  def valid_move?(index)
    if index.between?(0, 8) && !spot_taken?(index)
      true
    elsif !(index.between?(0,8))
      puts "\n You've inputted an invalid number (must be between 1-9)."
      puts " Please select a spot: "
    else
      puts "\n The spot you've selected ('#{index + 1}') is taken."
      puts " Please select another spot: "
    end
  end

  def turn_count
    counter = 0
    @board.each do |spot|
      if %w[X O].include? spot
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count.even? ? 'X' : 'O'
  end
end
