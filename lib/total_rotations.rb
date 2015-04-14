require './lib/key'
require './lib/offset'

class TotalRotations
  attr_reader :key, :date

  def initialize(key, date)
    @key = Key.new(key)
    @date = Offset.new(date)
  end

  def sum
    key.rotations.zip(date.offsets).map {|n| n.reduce(:+)}
  end
end
