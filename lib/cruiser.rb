class Cruiser < Ship

  attr_accessor :start_position, :size, :direction

  def initialize(start_position = "A1", direction = "H")
    super
    @size = 3
    @direction = direction
  end

end