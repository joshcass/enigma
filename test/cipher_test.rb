gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cipher'

class CipherTest < Minitest::Test

  def test_it_generates_a_character_set
    skip
    result = Cipher.new
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], result.characters
  end

  def test_it_can_rotate_a_character_set
    skip
    result = Cipher.new(54)
    assert_equal ["p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ",", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o"], result.characters_rotate
  end

  def test_it_can_generate_a_cipher_hash
    result = Cipher.new(54)
    hash = {"a"=>"p", "b"=>"q", "c"=>"r", "d"=>"s", "e"=>"t", "f"=>"u", "g"=>"v", "h"=>"w", "i"=>"x", "j"=>"y", "k"=>"z", "l"=>"0", "m"=>"1", "n"=>"2", "o"=>"3", "p"=>"4", "q"=>"5", "r"=>"6", "s"=>"7", "t"=>"8", "u"=>"9", "v"=>" ", "w"=>".", "x"=>",", "y"=>"a", "z"=>"b", "0"=>"c", "1"=>"d", "2"=>"e", "3"=>"f", "4"=>"g", "5"=>"h", "6"=>"i", "7"=>"j", "8"=>"k", "9"=>"l", " "=>"m", "."=>"n", ","=>"o"}
    assert_equal hash, result.cipher
  end
end
