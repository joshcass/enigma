# Generates the character set and creates a cipher hash based on the rotation value passed in.
class Cipher
  attr_reader :rotation

  def initialize(rotation = 0)
    @rotation = rotation
  end

  def cipher
    Hash[characters.zip(characters_rotate)]
  end

  def characters
    ("a".."z").to_a + ("0".."9").to_a + [" ", ".", ","]
  end

  private
  def characters_rotate
    characters.rotate(rotation)
  end
end
