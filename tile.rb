class Tile
  attr_accessor :number, :square, :place, :notes

  def initialize(attrs)
    @number = attrs[:number]
    @square = attrs[:square]
    @place = attrs[:place]
    @notes = []
  end

  def reinitialize_notes
    @notes = []
  end
end

