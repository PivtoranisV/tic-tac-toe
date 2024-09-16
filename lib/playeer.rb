# frozen_string_literal: true

class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def make_move
    puts "#{name}, please choose where you want to place your marker (#{marker})"
    puts 'Please enter a number from 1 to 9 to identify your option:'
    gets.chomp
  end
end
