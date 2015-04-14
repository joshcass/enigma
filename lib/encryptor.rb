require_relative 'key'
require_relative 'offset'

class Encryptor
  attr_reader :key, :date

  def initialize(key, date)
    @key = key
    @date = date
  end




  private

  def add_rotation_and_offset
    r = Key.new(key).rotations
    o = Offset.new(date).offset_key

    r.zip(o).map do |n|
      n.reduce(:+)
    end
  end

end


class Cipher
  attr_reader :rotation

  def initialize(rotation)
    @rotation = rotation
  end

  def cipher
    Hash[characters.zip(characters.rotate(rotation))]
  end

  private

  def characters
    ("a".."z").to_a + ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"] + [" ", ".", ","]
  end

end
