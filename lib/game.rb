# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require 'colorize'

class Game
  def initialize
    puts 'Hi everyone, welcome to the TIC TAC TOE game'.colorize(:yellow)
    @board = Board.new([[' 1', '| 2', '| 3'], [' 4', '| 5', '| 6'], [' 7', '| 8', '| 9']])
    setup_players
  end

  def play
    loop do
      player_turn(@player1)
      break if game_over?

      player_turn(@player2)
      break if game_over?
    end
    display_result
  end

  private

  def setup_players
    puts 'Player 1, please enter your name:'.colorize(:green)
    player1_name = gets.chomp
    puts "Hi #{player1_name}, your marker will be X".colorize(:blue)

    puts 'Player 2, please enter your name:'.colorize(:green)
    player2_name = gets.chomp
    puts "Hi #{player2_name}, your marker will be O".colorize(:blue)

    @player1 = Player.new(player1_name, 'X')
    @player2 = Player.new(player2_name, 'O')
    puts "#{player1_name} and #{player2_name}, please check bellow the starting game board".colorize(:green)
    puts 'each number can be replayced with your marker'.colorize(:green)
    @board.display_board
  end

  def player_turn(player)
    player_choice = player.make_move(@board)
    @board.update_board(player.marker, player_choice)
    @board.display_board
  end

  def game_over?
    @board.tie_game? || @board.check_winner
  end

  def display_result
    winner_marker = @board.check_winner
    if winner_marker
      winner_name = winner_marker == @player1.marker ? @player1.name : @player2.name
      puts "#{winner_name} wins! Congratulations!".colorize(:blue)
    else
      puts "It's a tie!".colorize(:yellow)
    end
  end
end
