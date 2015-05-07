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
    board.positions << ship.start_position
  end

  def checksquare(square)
    "ship"
  end

  def convertor(square)
    alphabet = ("a".."z").to_a
    row, col = square.downcase.split(//,2)
    coords = alphabet.index(row), (col.to_i) - 1
  end

  def fire(square, board)
    count = board.positions.length
    board.result(square)
    if board.positions.length < count
      change_to_hit(square)
    else
      change_to_x(square)
    end
  end

  def see_grid
    @grid.each { |x| p x }
  end

  def change_to_x(square)
    row, col = convertor(square)
    grid[row][col] = "X"
  end

  def change_to_hit(square)
    row, col = convertor(square)
    grid[row][col] = "HIT"
  end

end