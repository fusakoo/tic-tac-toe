# require_relative 'move'

# Status: Currently bugged 10/01/2020
# 1. Does not display_board after every turn => resolved
# 2. Position_taken? not working as expected => resolved
# 3. Need to invalidate inputs for values other than 1-9 => resolved
# 4. Need to decouple some of the classes
# 5. won? is not working

class TicTacToe
  def play(board)
    turn(board) until end?(board)
    if won?(board)
      winner(board) == 'O' || winner(board) == 'O'
      puts "\n Ding ding! #{winner(board)} you did it!"
    elsif draw?(board)
      puts "\n Draw!"
    end
  end

  def turn(board)
    display_board(board)
    if turn_count(board).even?
      puts "\n Player 1('X'), please enter 1-9: "
    else
      puts "\n Player 2('O'), please enter 1-9: "
    end
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(board, index)
      move(board, index, current_player(board))
      turn(board)
    end
  end

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

  def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
        win_combination
      end
    end
    false
  end

  def full?(board)
    board.all? {|i| i == "X" || i == "O"}
  end

  def draw?(board)
    if !won?(board) && full?(board)
      true
    elsif !won?(board) && !full?(board)
      false
    else
      false
    end
  end

  def end?(board)
    if draw?(board) || won?(board) || full?(board)
      true
    end
  end

  def winner(board)
    if won?(board)
      board[won?(board)[0]]
    end
  end

  def display_board(board)
    puts "\n  #{board[0]} | #{board[1]} | #{board[2]} "
    puts " -----------"
    puts "  #{board[3]} | #{board[4]} | #{board[5]} "
    puts " -----------"
    puts "  #{board[6]} | #{board[7]} | #{board[8]} "
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
  new_game.display_board(sample_board)
  puts "\n"

  board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  new_game.play(board)

  puts " To stop playing, type 'quit'. Otherwise, hit 'Enter' to play again."
  next unless gets.chomp == 'quit'

  quit_playing = true
end
