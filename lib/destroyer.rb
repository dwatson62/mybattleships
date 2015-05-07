class Destroyer < Ship

  attr_accessor :start_position, :size

  def initialize(start_position = "A1")
    super
    @size = 2
  end

end