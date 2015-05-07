class Board

  attr_accessor :positions

  def initialize
    @positions = []
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
       # positions.delete(square) #temporarily
      "BOOM!"
    else
      "You missed"
    end
  end

end