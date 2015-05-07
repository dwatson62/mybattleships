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

  def fire (square, board)
    board.result(square)
    change_grid(square)
  end

  def see_grid
    @grid.each { |x| p x }
  end

  def change_grid(square)
    row, col = convertor(square)
    grid[row][col] = "X"
  end

end