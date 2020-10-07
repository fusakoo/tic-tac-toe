# main ruby file that runs the game
require_relative 'tictactoe'
require_relative 'classes'

# main method; plays game
def play_game
  puts "\n Let's play Tic Tac Toe!"
  puts " Enter a number between 1-9 to pick a spot on the grid."
  Board.display_board([*1..10])
  puts "\n Player 1 will be 'X' and Player 2 will be 'O'."

  puts "\n Alright. Player 1, what's your name?"
  @name1 = gets.chomp
  player1 = Player.new(@name1)

  puts " Great! Player 2, what's your name?"
  @name2 = gets.chomp
  player2 = Player.new(@name2)

  puts "\n Game on!"
  new_game = TicTacToe.new(player1, player2)
  Board.display_board(new_game.board)

  new_game.play
  # once above game is complete, check with the user to play another round
  ask_new_game(player1, player2)
end

# begin a new instance of game
def begin_new_game(player1, player2)
  puts "\n Alright, let's play again."
  puts " Here's the grid with numbers 1-9 corresponding to the spots again."
  Board.display_board([*1..10])

  new_game = TicTacToe.new(player1, player2)
  Board.display_board(new_game.board)
  new_game.play
end

# replay game
def ask_new_game(player1, player2)
  responded = false

  until responded do
    puts " Would you like to play again? (Enter 'Y' for yes, 'N' for no)"
    response = gets.chomp.upcase

    if response == 'Y'
      begin_new_game(player1, player2)
    elsif response == 'N'
      puts " Thanks for playing!"
      responded = true
    else
      puts " Sorry, invalid response. Please respond with either 'Y' or 'N'."
    end
  end
end

play_game
