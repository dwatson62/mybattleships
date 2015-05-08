require_relative 'ship'
require_relative 'board'
require_relative 'destroyer'

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
    if ship.size > 1
      if ship.direction == "H"
        horizontal_size(ship, board)
      else
        vertical_size(ship,board)
      end
    else
      board.positions << ship.start_position
    end
  end

  def convertor(square)
    alphabet = ("a".."z").to_a
    row, col = square.downcase.split(//,2)
    coords = alphabet.index(row), (col.to_i) - 1
  end

  def fire(square, board, player)

    if square == "N"
      go_nuclear(square, board, player)
    else
      count = board.positions.length
      board.result(square)
      if board.positions.length < count
        change_to_hit(square, player)
      else
        change_to_x(square, player)
      end
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

  def horizontal_size(ship, board)
    row, col = convertor(ship.start_position)
    board.positions << ship.start_position
    (ship.size - 1).times { board.positions << board.positions.last.next }
  end

  def vertical_size(ship, board)
    x, y = (ship.start_position).split(//,2)
    x = x.chars
    (ship.size - 1).times { x << x.last.next }
    x.map!{ |letter| letter + y }
    board.positions << x
    board.positions.flatten!
  end

  def go_nuclear(square, board, player)
    square = player.grid.flatten
      square.each do |x|
        count = board.positions.length
        board.result(x)
        if board.positions.length < count
          change_to_hit(x, player)
        else
          change_to_x(x, player)
        end
      end
      board.game_over?
    end
end