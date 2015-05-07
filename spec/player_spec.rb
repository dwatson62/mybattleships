require 'player'
require 'ship'
require 'board'

describe Player do

    let (:board) { Board.new }
    let (:ship) { Ship.new("A3") }

  it { is_expected.to respond_to(:place).with(2).arguments }
  it { is_expected.to respond_to(:see_grid).with(1).argument }
  it { is_expected.to respond_to(:fire).with(3).arguments }
  it { is_expected.to respond_to(:change_to_x).with(2).arguments }
  it { is_expected.to respond_to(:change_to_hit).with(2).arguments }

  context 'Can place on the board' do

    it 'a ship on square A3' do
      expect(subject.place(ship, board)).to eq ["A3"]
    end

    it 'a 2 square ship vertically' do
      destroyer = Destroyer.new("C1", "V")
      subject.place(destroyer, board)
      expect(board.positions).to eq ["C1", "D1"]
    end
  end

  context 'Cannot place' do

    it 'on top of another ships starting position' do
      ship = Ship.new("B2")
      ship1 = Ship.new("B2")
      subject.place(ship, board)
      expect { subject.place(ship, board) }.to raise_error
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