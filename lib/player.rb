require_relative 'ship'
require_relative 'board'

class Player

  attr_accessor :grid

  def initialize
    @grid = Array.new(10) { (1..10).to_a }
    letter = "A"
    @grid.each do |arr|
      arr.map! { |x| letter + x.to_s }
      letter = letter.next
    end
  end

  def place(ship, board)
    fail 'Out of bounds' if board.out_of_bounds?(ship.start_position)
    fail 'Cannot place on top of another ship' if board.overlapping?(ship)
    board.positions << ship.start_position
  end

  def convertor(square)
    alphabet = ("a".."z").to_a
    row, col = square.downcase.split(//,2)
    coords = alphabet.index(row), (col.to_i) - 1
  end

  def fire(square, board, player)
    count = board.positions.length
    board.result(square)
    if board.positions.length < count
      change_to_hit(square, player)
    else
      change_to_x(square, player)
    end
  end

  def see_grid(player)
    player.grid.each { |x| p x }
  end

  def change_to_x(square, player)
    row, col = convertor(square)
    player.grid[row][col] = "X"
  end

  def change_to_hit(square, player)
    row, col = convertor(square)
    player.grid[row][col] = "HIT"
  end

end