require_relative 'ship'
require_relative 'board'

class Player

  def place(ship, board)
    fail 'Out of bounds' if board.out_of_bounds?(ship.start_position)
    board.positions << ship.start_position
  end

  def checksquare(square)
    "ship"
  end

  def convertor square
    alphabet = ("a".."z").to_a
    row, col = square.downcase.split(//,2)
    coords = alphabet.index(row), (col.to_i) - 1
  end

  def fire (square, board)
    board.result(square)
  end

end