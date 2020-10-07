# Main ruby file that runs the game
require_relative 'tictactoe'
require_relative 'classes'

def play_game
  puts "\n Let's play Tic Tac Toe!"
  puts "\n Use numbers 1-9 to pick a spot on the grid"
  puts " Player 1 will be 'X' and Player 2 will be 'O'"
  Board.display_board([*1..10])

  puts "\n Alright. Player 1, what's your name?"
  @name1 = gets.chomp
  player1 = Player.new(@name1)

  puts " Great! Player 2, what's your name?"
  @name2 = gets.chomp
  player2 = Player.new(@name2)

  new_game = TicTacToe.new(player1, player2)
  Board.display_board(new_game.board)

  new_game.play
  replay_game(player1, player2)
end

def new_game(player1, player2)
  puts "\n Let's play Tic Tac Toe!"
  puts "\n Use numbers 1-9 to pick a spot on the grid"
  puts " Player 1 will be 'X' and Player 2 will be 'O'"
  Board.display_board([*1..10])

  new_game = TicTacToe.new(player1, player2)
  new_game.play
end

def replay_game(player1, player2)
  responded = false

  until responded do
    puts " Would you like to play again? (Y or N)"
    response = gets.chomp.upcase

    if response == 'Y'
      new_game(player1, player2)
    elsif response == 'N'
      responded = true
    else
      puts " Sorry, invalid response. Please respond with 'Y' or 'N'."
    end
  end
end

play_game
