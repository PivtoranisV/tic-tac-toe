# frozen_string_literal: true

require_relative 'board'
require_relative 'playeer'

class Game
  puts 'Hi everyone, welcome to the TIC TAC TOE game'
  puts 'Player 1, please enter your name'
  player1_name = gets.chomp
  puts "Hi #{player1_name}, your marker will be - X"
  puts 'Player 2, please enter your name'
  player2_name = gets.chomp
  puts "Hi #{player2_name}, your marker will be - O"
  puts "#{player1_name} and #{player2_name}, please check bellow the starting game board,
  each number can be replayced with your marker"

  # Initialize the board and display it
  game_board = Board.new([[' 1', '| 2', '| 3'], [' 4', '| 5', '| 6'], [' 7', '| 8', '| 9']])
  game_board.display_board

  # Initialize the players
  player1 = Player.new(player1_name, 'X')
  player2 = Player.new(player2_name, 'O')

  loop do
    player1_choice = player1.make_move
    game_board.update_board(player1.marker, player1_choice)
    game_board.display_board
    break if game_board.tie_game? || game_board.check_winner

    player2_choice = player2.make_move
    game_board.update_board(player2.marker, player2_choice)
    game_board.display_board
    break if game_board.tie_game? || game_board.check_winner
  end

  # Check final result
  winner_marker = game_board.check_winner
  if winner_marker == player1.marker
    winner_name = player1.name
  elsif winner_marker == player2.marker
    winner_name = player2.name
  end

  if winner_marker
    puts "#{winner_name} wins! Congratulations"
  else
    puts "It's a tie!"
  end
end
