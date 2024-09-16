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
    # Check rows for a winner
    @board.each do |row|
      return row[0].strip if row.join.strip.gsub('|', '').split.uniq.join.length == 1
    end
    # Check columns for a winner
    (0..2).each do |col|
      column = [@board[0][col].gsub('|', '').strip, @board[1][col].gsub('|', '').strip,
                @board[2][col].gsub('|', '').strip]
      return column[0] if column.uniq.length == 1
    end
    # Check diagonals for a winner
    diagonal1 = [@board[0][0].gsub('|', '').strip, @board[1][1].gsub('|', '').strip, @board[2][2].gsub('|', '').strip]
    diagonal2 = [@board[0][2].gsub('|', '').strip, @board[1][1].gsub('|', '').strip, @board[2][0].gsub('|', '').strip]

    return diagonal1[0] if diagonal1.uniq.length == 1
    return diagonal2[0] if diagonal2.uniq.length == 1

    # No winner found
    nil
  end
end
