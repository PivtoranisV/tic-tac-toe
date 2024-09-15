require_relative 'lib/board'
require_relative 'lib/playeer'
require_relative 'lib/game'

b = Board.new([[' 1', '| 2', '| 3'], [' 4', '| 5', '| 6'], [' 7', '| 8', '| 9']])
b.display_board
b.update_board('X', '1')
b.display_board
b.update_board('0', '9')
b.display_board
b.update_board('X', '5')
b.display_board
b.update_board('0', '3')
b.display_board
