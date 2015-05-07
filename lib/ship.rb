class Ship

  attr_accessor :start_position, :size, :direction

  def initialize(start_position = "A1", direction = "H")
    @start_position = start_position
    @size = 1
    @direction = direction
  end

end