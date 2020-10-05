# require_relative 'move'

module CreateBoard
  def self.display_board(board)
    puts "\n  #{board[0]} | #{board[1]} | #{board[2]} "
    puts " -----------"
    puts "  #{board[3]} | #{board[4]} | #{board[5]} "
    puts " -----------"
    puts "  #{board[6]} | #{board[7]} | #{board[8]} "
  end
end

class TicTacToe
  include CreateBoard
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  # def initialize
  #   @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  # end

  def play(board)
    # turn(board) until over?(board)
    until over?(board)
      turn(board)
    end
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
      CreateBoard.display_board(board)
    end
  end

  def won?(board)
    WIN_COMBINATIONS.each do |combination|
      position_1 = board[combination[0]]
      position_2 = board[combination[1]]
      position_3 = board[combination[2]]

      # the combination must be returned in order for winner() method to work
      if position_taken?(board, combination[0]) && 
         position_1 == position_2 && 
         position_2 == position_3
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

  def over?(board)
    if draw?(board) || won?(board) || full?(board)
      true
    end
  end

  protected

  def input_to_index(input)
    input.to_i - 1
  end

  def move(board, index, player)
    board[index] = player
  end

  def position_taken?(board, index)
    # TODO: see if there's a way to simplify the code below using regex
    if (board[index] == ' ') || (board[index] == '') || (board[index] == nil)
      false
    else
      true
    end
  end

  def valid_move?(board, index)
    if index.between?(0, 8) && !position_taken?(board, index)
      true
    elsif !(index.between?(0,8))
      puts "\n Invalid number (must be between 1-9)."
      puts " Try selecting another spot."
    else
      puts "\n The spot you've selected ('#{index + 1}') is taken."
      puts " Try selecting another spot."
    end
  end

  def turn_count(board)
    counter = 0
    board.each do |space|
      # if space == "X" || space == "O"
      if %w[X O].include? space
        counter += 1
      end
    end
    counter
  end

  def current_player(board)
    turn_count(board).even? ? 'X' : 'O'
  end
end

quit_playing = false

until quit_playing
  new_game = TicTacToe.new

  puts "\n Let's play Tic Tac Toe!"
  puts "\n Use numbers 1-9 to pick a spot on the grid"
  puts " Player 1 will be 'X' and Player 2 will be 'O'"
  puts "\n"
  sample_board = %w[1 2 3 4 5 6 7 8 9]
  CreateBoard.display_board(sample_board)
  puts "\n"

  board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  new_game.play(board)

  puts "\n To stop playing, type 'quit'. Otherwise, hit 'Enter' to play again."
  next unless gets.chomp == 'quit'

  quit_playing = true
end
