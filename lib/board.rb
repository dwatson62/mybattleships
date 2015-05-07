class Board

  attr_accessor :positions, :game_over

  def initialize
    @positions = []
    @game_over = false
  end

  def out_of_bounds?(square)
     x = convertor(square)
     fail 'Out of bounds' if x[1] > 9 || x[0] > 9 || x[0] < 0 || x[1] < 0
  end

  def convertor(square)
    alphabet = ("a".."z").to_a
    row, col = square.downcase.split(//,2)
    coords = alphabet.index(row), (col.to_i) - 1
  end

  def result(square)
    if positions.include?(square)
       positions.delete(square) # temporarily
       puts "BOOM!"
       game_over?
    else
      puts "You missed"
      false
    end
  end

  def game_over?
    if positions.empty?
      @game_over = true
      puts "Game over!"
    end
  end

end