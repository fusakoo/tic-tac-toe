# Main ruby file that runs the game
require_relative 'tictactoe'
require_relative 'classes'

def start_game
  puts "\n Let's play Tic Tac Toe!"
  puts "\n Use numbers 1-9 to pick a spot on the grid"
  puts " Player 1 will be 'X' and Player 2 will be 'O'"
  sample_board = %w[1 2 3 4 5 6 7 8 9]
  Board.display_board(sample_board)

  puts "\n Alright. Player 1, what's your name?"
  @name1 = gets.chomp
  player1 = Player.new(@name1)

  puts "\n Great! Player 2, what's your name?"
  @name2 = gets.chomp
  player2 = Player.new(@name2)

  new_game = TicTacToe.new(player1, player2)
  board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  new_game.play(board)
end

def play_game
  quit_playing = false
  # continue_playing = false

  until quit_playing
    start_game

    puts "\n To stop playing, type 'quit'. Otherwise, hit 'Enter' to play again."
    next unless gets.chomp == 'quit'

    quit_playing = true
  end
end

play_game
