# frozen_string_literal: true

require 'colorize'
class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def make_move(game_board)
    puts "#{name}, please choose where you want to place your marker (#{marker})".colorize(:green)
    puts 'Please enter a number from 1 to 9 to identify your option:'.colorize(:green)
    loop do
      input = gets.chomp

      return input if input.match?(/^[1-9]$/) && !game_board.cell_occupied?(input)

      puts 'Invalid move. Either the input is not a number between 1-9 or the cell is already occupied.'.colorize(:red)
    end
  end
end
