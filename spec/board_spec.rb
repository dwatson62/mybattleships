require 'player'
require 'ship'
require 'board'

describe Board do

    it { is_expected.to respond_to :out_of_bounds? }

    context 'Cannot place a ship outside the boundaries' do

    it 'out of bounds returns true' do
      internal_board = Board.new
      player1 = Player.new
      expect { internal_board.out_of_bounds?("A11") }.to raise_error 'Out of bounds'
    end

  end


end