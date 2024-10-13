# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

# rubocop:disable Metrics/BlockLength, Lint/MissingCopEnableDirective

describe Game do
  let(:board) { instance_double('Board') }
  let(:player1) { instance_double('Player', name: 'Alice', marker: 'X') }
  let(:player2) { instance_double('Player', name: 'Bob', marker: 'O') }
  subject(:game) { Game.new }

  before do
    allow(Board).to receive(:new).and_return(board)
    allow(board).to receive(:display_board)
    allow(board).to receive(:update_board)
    allow(game).to receive(:setup_players)
    allow(game).to receive(:player_turn)
  end

  describe '#initialize' do
    it 'displays a welcome message' do
      expect { Game.new }.to output(/welcome to the TIC TAC TOE game/).to_stdout
    end

    it 'sets up a new game board' do
      expect(Board).to have_received(:new)
    end
  end

  describe '#play' do
    it 'ends the game when a player wins' do
      allow(game).to receive(:game_over?).and_return(false, true)
      allow(game).to receive(:display_result)

      expect(game).to receive(:player_turn).twice
      game.play
    end

    it 'ends the game in a tie if the board is full with no winner' do
      allow(game).to receive(:game_over?).and_return(false, true)
      allow(game).to receive(:display_result)

      expect(game).to receive(:player_turn).twice
      game.play
    end
  end

  describe '#game_over?' do
    it 'returns true if the game is a tie' do
      allow(board).to receive(:tie_game?).and_return(true)
      allow(board).to receive(:check_winner).and_return(nil)
      expect(game.send(:game_over?)).to be(true)
    end
  end

  describe '#display_result' do
    it 'announces a tie if there is no winner' do
      allow(board).to receive(:check_winner).and_return(nil)
      expect { game.send(:display_result) }.to output(/It's a tie!/).to_stdout
    end
  end
end
