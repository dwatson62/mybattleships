class Ship

  attr_accessor :start_position, :size

  def initialize(start_position = "A1")
    @start_position = start_position
    @size = 1
  end

end