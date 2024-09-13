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
end
