require 'player'
require 'ship'
require 'board'

feature 'Player can' do

  let(:player1) { Player.new }
  let(:internal_board) { Board.new }

  scenario 'place a ship on the board' do
    ship = Ship.new("B1")
    player1.place(ship, internal_board)
    expect(internal_board.positions[0]).to eq "B1"
  end

  scenario 'see the game board' do
    ship = Ship.new("B1")
    expect(player1.grid).to eq player1.grid
  end
end

feature 'Cannot place a ship' do

  let(:player1) { Player.new }
  let(:internal_board) { Board.new }

  scenario 'where it starts outside of the board' do
    ship = Ship.new("A11")
    expect { player1.place(ship, internal_board) }.to raise_error 'Out of bounds'
  end

  scenario 'on top of another ships start position' do
    ship = Ship.new("B2")
    ship1 = Ship.new("B2")
    player1.place(ship, internal_board)
    expect { player1.place(ship, internal_board) }.to raise_error
  end

end

feature 'A player can fire' do

  let(:player1) { Player.new }
  let(:internal_board) { Board.new }

  scenario 'and miss' do
    player1.fire("A3", internal_board, player1)
    expect(internal_board.result("A3")).to eq false
  end

  xscenario 'and hit a ship' do
    ship = Ship.new("A5")
    player1.place(ship, internal_board)
    player1.fire("A5", internal_board, player1)
    expect(internal_board.result("A5")).to eq true
  end

    scenario 'and hit a ship, and have it removed from the positions array' do
    ship = Ship.new("A5")
    player1.place(ship, internal_board)
    player1.fire("A5", internal_board, player1)
    expect(internal_board.positions).to eq []
  end

  scenario 'hit all ships and win the game' do
    ship1 = Ship.new("A4")
    ship2 = Ship.new("A5")
    player1.place(ship1, internal_board)
    player1.place(ship2, internal_board)
    player1.fire("A4", internal_board, player1)
    player1.fire("A5", internal_board, player1)
    expect(internal_board.game_over).to eq true
  end
end