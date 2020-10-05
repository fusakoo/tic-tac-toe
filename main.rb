# Main ruby file that runs the game
require_relative 'tictactoe'

quit_playing = false

until quit_playing
  new_game = TicTacToe.new

  puts "\n Let's play Tic Tac Toe!"
  puts "\n Use numbers 1-9 to pick a spot on the grid"
  puts " Player 1 will be 'X' and Player 2 will be 'O'"
  puts "\n"
  sample_board = %w[1 2 3 4 5 6 7 8 9]
  Board.display_board(sample_board)
  puts "\n"

  board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  new_game.play(board)

  puts "\n To stop playing, type 'quit'. Otherwise, hit 'Enter' to play again."
  next unless gets.chomp == 'quit'

  quit_playing = true
end
