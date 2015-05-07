require 'player'
require 'ship'
require 'board'

describe Board do

  let (:board) { Board.new }
  let (:player1) { Player.new }

  it { is_expected.to respond_to(:out_of_bounds?).with(1).argument }
  it { is_expected.to respond_to :game_over? }
  it { is_expected.to respond_to(:convertor).with(1).argument }
  it { is_expected.to respond_to(:result).with(1).argument }

  context 'Cannot place a ship' do

    it 'outside the boundaries' do
      expect { subject.out_of_bounds?("A11") }.to raise_error 'Out of bounds'
    end

  end


end