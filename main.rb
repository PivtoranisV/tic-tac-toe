require_relative 'lib/board'
require_relative 'lib/playeer'
require_relative 'lib/game'

b = Board.new([[' 1', '| 2', '| 3'], [' 4', '| 5', '| 6'], [' 7', '| 8', '| 9']])
b.display_board
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
