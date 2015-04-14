class Cipher
  attr_reader :rotation

  def initialize(rotation = 0)
    @rotation = rotation
  end

  def cipher
    Hash[characters.zip(charcters_rotate)]
  end

  private

  def characters
    ("a".."z").to_a + ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
  end

  def characters_rotate
    characters.rotate(rotation)
  end
end
