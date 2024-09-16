require_relative 'lib/board'
require_relative 'lib/playeer'
require_relative 'lib/game'

puts 'Hi everyone, welcome to the TIC TAC TOE game'
puts 'Player 1, please enter your name'
player1_name = gets.chomp
puts "Hi #{player1_name}, your marker will be - X"
puts 'Player 2, please enter your name'
player2_name = gets.chomp
puts "Hi #{player2_name}, your marker will be - 0"

b = Board.new([[' 1', '| 2', '| 3'], [' 4', '| 5', '| 6'], [' 7', '| 8', '| 9']])
b.display_board

player1 = Player.new(player1_name, 'X')
player2 = Player.new(player2_name, '0')

p player1.make_move

b.update_board('X', '1')
b.display_board
b.update_board('0', '2')
b.display_board
b.update_board('X', '3')
b.display_board
b.update_board('0', '4')
b.display_board
b.update_board('X', '5')
b.display_board
b.update_board('0', '6')
b.display_board
b.update_board('X', '7')
b.display_board
b.update_board('0', '8')
b.display_board
b.update_board('0', '9')
b.display_board
p b.tie_game?
p b.check_winner
