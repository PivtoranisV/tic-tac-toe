require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/player'

# rubocop:disable Metrics/BlockLength, Lint/MissingCopEnableDirective
describe Board do
  subject(:board) { described_class.new([[' 1', '| 2', '| 3'], [' 4', '| 5', '| 6'], [' 7', '| 8', '| 9']]) }

  describe '#check_winner' do
    context 'when a player wins by row' do
      it 'detects a win when a player has three in a top row' do
        board.update_board('X', '1')
        board.update_board('X', '2')
        board.update_board('X', '3')
        expect(board.check_winner).to eq('X')
      end

      it 'detects a win when a player has three in a middle row' do
        board.update_board('O', '4')
        board.update_board('O', '5')
        board.update_board('O', '6')
        expect(board.check_winner).to eq('O')
      end
    end

    context 'when a player wins by column' do
      it 'detects a win in the first column' do
        board.update_board('X', '1')
        board.update_board('X', '4')
        board.update_board('X', '7')
        expect(board.check_winner).to eq('X')
      end

      it 'detects a win in the second column' do
        board.update_board('O', '2')
        board.update_board('O', '5')
        board.update_board('O', '8')
        expect(board.check_winner).to eq('O')
      end
    end

    context 'when a player wins by diagonal' do
      it 'detects a win in the main diagonal' do
        board.update_board('X', '1')
        board.update_board('X', '5')
        board.update_board('X', '9')
        expect(board.check_winner).to eq('X')
      end

      it 'detects a win in the anti-diagonal' do
        board.update_board('O', '3')
        board.update_board('O', '5')
        board.update_board('O', '7')
        expect(board.check_winner).to eq('O')
      end
    end
  end

  describe '#tie_game' do
    context 'when all spaces are filled' do
      subject(:board) { described_class.new([['X', '| O', '| X'], ['O', '| X', '| O'], ['O', '| X', '| O']]) }
      it 'returns true' do
        expect(board).to be_tie_game
      end
    end

    context 'when there are still empty spaces' do
      subject(:board_with_empty_space) do
        described_class.new([['X', '| O', '| X'], ['O', '| X', '| O'], ['O', '| 8', '| O']])
      end
      it 'returns false' do
        expect(board_with_empty_space).not_to be_tie_game
      end
    end
  end
end
