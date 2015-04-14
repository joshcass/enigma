gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cipher'

class CipherTest < Minitest::Test

  def test_it_generates_character_set
    skip
    result = Cipher.new
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","],
      result.characters
  end

  def test_it_can_rotate_character_set
    skip
    result = Cipher.new(54)
    assert_equal ["p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ",", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o"],
      result.characters_rotate
  end

  def test_it_can_generate_cipher_hash
    result = Cipher.new(54)
    assert_equal
      result.cipher
  end
end
