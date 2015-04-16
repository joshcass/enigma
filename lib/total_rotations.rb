require './lib/key'
require './lib/offset'

# Sums the key and offset array values.
class TotalRotations
  attr_reader :key, :date

  def initialize(key = Key.new, date = Offset.new)
    @key = Key.new(key)
    @date = Offset.new(date)
  end

  def sum
    key.rotations.zip(date.offsets).map {|pair| pair.reduce(:+)}
  end
end
