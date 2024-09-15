# frozen_string_literal: true

class Board
  def initialize(board)
    @board = board
  end

  def display_board
    puts "\nTIC TAC TOE \n \n"
    @board.each_with_index do |row, index|
      puts row.join(' ')
      puts '---|---|---' unless index == 2
    end
    puts "\nTIC TAC TOE \n \n"
  end

  def update_board(player_marker, player_choice)
    @board.map! do |row|
      row.map do |option|
        option.include?(player_choice) ? option.sub(/[1-9]/, player_marker) : option
      end
    end
  end

  def tie_game
    @board.none? { |options| options.to_s.match?(/[1-9]/) }
  end
end
