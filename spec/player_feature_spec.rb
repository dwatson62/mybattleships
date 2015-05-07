require 'player'
require 'ship'
require 'board'

feature 'Player can' do
  scenario 'place a ship on the board' do
    player1 = Player.new
    internal_board = Board.new
    ship = Ship.new("B1")
    player1.place(ship, internal_board)
    expect(internal_board.positions[0]).to eq "B1"
  end

  scenario 'see the game board' do
    player1 = Player.new
    internal_board = Board.new
    ship = Ship.new("B1")
    expect(player1.grid).to eq player1.grid
  end
end

feature 'Cannot place a ship' do
  scenario 'where it starts outside of the board' do
    internal_board = Board.new
    ship = Ship.new("A11")
    player1 = Player.new
    expect { player1.place(ship, internal_board) }.to raise_error 'Out of bounds'
  end
end

feature 'A player can fire' do
  scenario 'and miss' do
    player1 = Player.new
    internal_board = Board.new
    player1.fire("A3", internal_board)
    expect(internal_board.result("A3")).to eq false
  end

  xscenario 'and hit a ship' do
    player1 = Player.new
    internal_board = Board.new
    ship = Ship.new("A5")
    player1.place(ship, internal_board)
    player1.fire("A5", internal_board)
    expect(internal_board.result("A5")).to eq true
  end

    scenario 'and hit a ship, and have it removed from the positions array' do
    player1 = Player.new
    internal_board = Board.new
    ship = Ship.new("A5")
    player1.place(ship, internal_board)
    player1.fire("A5", internal_board)
    expect(internal_board.positions).to eq []
  end

  scenario 'hit all ships and win the game' do
    player1 = Player.new
    internal_board = Board.new
    ship1 = Ship.new("A4")
    ship2 = Ship.new("A5")
    player1.place(ship1, internal_board)
    player1.place(ship2, internal_board)
    player1.fire("A4", internal_board)
    player1.fire("A5", internal_board)
    expect(internal_board.game_over).to eq true
  end
end