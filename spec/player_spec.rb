# frozen_string_literal: true

require_relative '../lib/player'

# rubocop:disable Metrics/BlockLength, Lint/MissingCopEnableDirective

describe Player do
  let(:game_board) { double('GameBoard') }
  subject(:player) { described_class.new('Alice', 'X') }

  describe '#initialize' do
    it 'sets the player name' do
      expect(player.name).to eq('Alice')
    end

    it 'sets the player marker' do
      expect(player.marker).to eq('X')
    end
  end

  describe '#make_move' do
    before do
      allow(game_board).to receive(:cell_occupied?).and_return(false)
    end

    it 'prompts the player for input' do
      allow(player).to receive(:gets).and_return('1')
      expect do
        player.make_move(game_board)
      end.to output(/Alice, please choose where you want to place your marker \(X\)/).to_stdout
    end

    it 'returns the valid input' do
      allow(player).to receive(:gets).and_return('5')
      expect(player.make_move(game_board)).to eq('5')
    end

    it 'checks that the selected cell is not occupied' do
      allow(player).to receive(:gets).and_return('5')
      expect(game_board).to receive(:cell_occupied?).with('5').and_return(false)
      player.make_move(game_board)
    end
  end
end
