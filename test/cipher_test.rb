gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cipher'

class CipherTest < Minitest::Test

  def test_it_can_hold_a_rotation_value
    result = Cipher.new
    assert result.respond_to?(:rotation)
  end

  def test_has_method_to_create_cipher
    result = Cipher.new
    assert result.respond_to?(:cipher)
  end

  def test_generates_correct_character_set_as_an_array
    result = Cipher.new.characters
    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], result
  end

  def test_no_given_rotation_value_defaults_to_zero
    result = Cipher.new
    assert_equal 0, result.rotation
  end

  def test_it_can_accept_a_rotation_value
    result = Cipher.new(30)
    assert_equal 30, result.rotation
  end

  def test_it_can_accept_a_negative_rotation_value
    result = Cipher.new(-14)
    assert_equal -14, result.rotation
  end

  def test_it_returns_the_rotations_in_a_hash
    result = Cipher.new(10)
    assert result.cipher.is_a?Hash
  end

  def test_it_can_generate_cipher_hash_with_zero_rotation
    result = Cipher.new
    hash = {"a"=>"a", "b"=>"b", "c"=>"c", "d"=>"d", "e"=>"e", "f"=>"f", "g"=>"g", "h"=>"h", "i"=>"i", "j"=>"j", "k"=>"k", "l"=>"l", "m"=>"m", "n"=>"n", "o"=>"o", "p"=>"p", "q"=>"q", "r"=>"r", "s"=>"s", "t"=>"t", "u"=>"u", "v"=>"v", "w"=>"w", "x"=>"x", "y"=>"y", "z"=>"z", "0"=>"0", "1"=>"1", "2"=>"2", "3"=>"3", "4"=>"4", "5"=>"5", "6"=>"6", "7"=>"7", "8"=>"8", "9"=>"9", " "=>" ", "."=>".", ","=>","}
    assert_equal hash, result.cipher
  end

  def test_it_can_generate_a_cipher_hash_with_positive_rotation
    result = Cipher.new(54)
    hash = {"a"=>"p", "b"=>"q", "c"=>"r", "d"=>"s", "e"=>"t", "f"=>"u", "g"=>"v", "h"=>"w", "i"=>"x", "j"=>"y", "k"=>"z", "l"=>"0", "m"=>"1", "n"=>"2", "o"=>"3", "p"=>"4", "q"=>"5", "r"=>"6", "s"=>"7", "t"=>"8", "u"=>"9", "v"=>" ", "w"=>".", "x"=>",", "y"=>"a", "z"=>"b", "0"=>"c", "1"=>"d", "2"=>"e", "3"=>"f", "4"=>"g", "5"=>"h", "6"=>"i", "7"=>"j", "8"=>"k", "9"=>"l", " "=>"m", "."=>"n", ","=>"o"}
    assert_equal hash, result.cipher
  end

  def test_it_can_generate_a_cipher_hash_with_negative_rotation
    result = Cipher.new(-23)
    hash = {"a"=>"q", "b"=>"r", "c"=>"s", "d"=>"t", "e"=>"u", "f"=>"v", "g"=>"w", "h"=>"x", "i"=>"y", "j"=>"z", "k"=>"0", "l"=>"1", "m"=>"2", "n"=>"3", "o"=>"4", "p"=>"5", "q"=>"6", "r"=>"7", "s"=>"8", "t"=>"9", "u"=>" ", "v"=>".", "w"=>",", "x"=>"a", "y"=>"b", "z"=>"c", "0"=>"d", "1"=>"e", "2"=>"f", "3"=>"g", "4"=>"h", "5"=>"i", "6"=>"j", "7"=>"k", "8"=>"l", "9"=>"m", " "=>"n", "."=>"o", ","=>"p"}
    assert_equal hash, result.cipher
  end
end
