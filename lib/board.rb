# frozen_string_literal: true

class Board
  def initialize(board)
    @board = board
  end

  def display_board
    puts "\nTIC TAC TOE \n \n"
    @board.each do |row|
      puts row.join(' ')
      puts '---|---|---'
    end
    puts "\nTIC TAC TOE \n \n"
  end
end
