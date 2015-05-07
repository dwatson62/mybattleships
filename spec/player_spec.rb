require 'player'
require 'ship'
require 'board'

describe Player do

  it { is_expected.to respond_to(:place).with(2).arguments }
  it { is_expected.to respond_to(:see_grid).with(1).argument }
  it { is_expected.to respond_to(:fire).with(3).arguments }
  it { is_expected.to respond_to(:change_to_x).with(2).arguments }
  it { is_expected.to respond_to(:change_to_hit).with(2).arguments }

  context 'Can place on the board' do

    let (:board) { Board.new }
    let (:ship) { Ship.new("A3") }

    it 'a ship on square A3' do
      expect(subject.place(ship, board)).to eq ["A3"]
    end
  end

  context 'Cannot place' do

    let ()

    it 'on top of another ships starting position' do
      ship = Ship.new("B2")
      ship1 = Ship.new("B2")
      player1.place(ship, internal_board)
      expect { player1.place(ship, internal_board) }.to raise_error
    end
  end


  context 'Can fire at a board' do

    let (:board) { Board.new }
    let (:ship) { Ship.new("A3") }

    it 'and return a miss' do
      subject.place(ship, board)
      expect(subject.fire("A5", board, subject)).to eq "X"
    end

    it 'and hit a ship' do
      subject.place(ship, board)
      expect(subject.fire("A3", board, subject)).to eq "HIT"
    end

  end
end