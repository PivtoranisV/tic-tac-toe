# frozen_string_literal: true

require 'colorize'

class Board
  def initialize(board)
    @board = board
  end

  def display_board
    puts "\nTIC TAC TOE \n".colorize(:yellow)
    @board.each_with_index do |row, index|
      puts row.join(' ')
      puts '---|---|---' unless index == 2
    end
    puts "\n \n"
  end

  def update_board(player_marker, player_choice)
    @board.map! do |row|
      row.map do |option|
        option.include?(player_choice) ? option.sub(/[1-9]/, player_marker) : option
      end
    end
  end

  def cell_occupied?(player_choice)
    @board.flatten.none? { |option| option.include?(player_choice) }
  end

  def tie_game?
    @board.none? { |options| options.to_s.match?(/[1-9]/) }
  end

  def check_winner
    clean_board = @board.map do |row|
      row.map { |cell| cell.sub('|', '').strip }
    end
    winning_combination = [
      # Rows
      clean_board[0], clean_board[1], clean_board[2],
      # Columns
      [clean_board[0][0], clean_board[1][0], clean_board[2][0]],
      [clean_board[0][1], clean_board[1][1], clean_board[2][1]],
      [clean_board[0][2], clean_board[1][2], clean_board[2][2]],
      # Diagonals
      [clean_board[0][0], clean_board[1][1], clean_board[2][2]],
      [clean_board[0][2], clean_board[1][1], clean_board[2][0]]
    ]
    winning_combination.each do |combo|
      return combo[0] if combo.uniq.size == 1
    end
    # No winner found
    nil
  end
end
