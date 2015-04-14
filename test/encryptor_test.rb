gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor'

class EncryptorTest < Minitest::Test

  def test_it_generates_a_master_cipher
    skip
    result = Encryptor.new("hello", "41521", "020315")
    result.generate_cipher
    array = [{"a"=>"l", "b"=>"m", "c"=>"n", "d"=>"o", "e"=>"p", "f"=>"q", "g"=>"r", "h"=>"s", "i"=>"t", "j"=>"u", "k"=>"v", "l"=>"w", "m"=>"x", "n"=>"y", "o"=>"z", "p"=>"0", "q"=>"1", "r"=>"2", "s"=>"3", "t"=>"4", "u"=>"5", "v"=>"6", "w"=>"7", "x"=>"8", "y"=>"9", "z"=>" ", "0"=>".", "1"=>",", "2"=>"a", "3"=>"b", "4"=>"c", "5"=>"d", "6"=>"e", "7"=>"f", "8"=>"g", "9"=>"h", " "=>"i", "."=>"j", ","=>"k"}, {"a"=>"r", "b"=>"s", "c"=>"t", "d"=>"u", "e"=>"v", "f"=>"w", "g"=>"x", "h"=>"y", "i"=>"z", "j"=>"0", "k"=>"1", "l"=>"2", "m"=>"3", "n"=>"4", "o"=>"5", "p"=>"6", "q"=>"7", "r"=>"8", "s"=>"9", "t"=>" ", "u"=>".", "v"=>",", "w"=>"a", "x"=>"b", "y"=>"c", "z"=>"d", "0"=>"e", "1"=>"f", "2"=>"g", "3"=>"h", "4"=>"i", "5"=>"j", "6"=>"k", "7"=>"l", "8"=>"m", "9"=>"n", " "=>"o", "."=>"p", ","=>"q"}, {"a"=>"p", "b"=>"q", "c"=>"r", "d"=>"s", "e"=>"t", "f"=>"u", "g"=>"v", "h"=>"w", "i"=>"x", "j"=>"y", "k"=>"z", "l"=>"0", "m"=>"1", "n"=>"2", "o"=>"3", "p"=>"4", "q"=>"5", "r"=>"6", "s"=>"7", "t"=>"8", "u"=>"9", "v"=>" ", "w"=>".", "x"=>",", "y"=>"a", "z"=>"b", "0"=>"c", "1"=>"d", "2"=>"e", "3"=>"f", "4"=>"g", "5"=>"h", "6"=>"i", "7"=>"j", "8"=>"k", "9"=>"l", " "=>"m", "."=>"n", ","=>"o"}, {"a"=>"0", "b"=>"1", "c"=>"2", "d"=>"3", "e"=>"4", "f"=>"5", "g"=>"6", "h"=>"7", "i"=>"8", "j"=>"9", "k"=>" ", "l"=>".", "m"=>",", "n"=>"a", "o"=>"b", "p"=>"c", "q"=>"d", "r"=>"e", "s"=>"f", "t"=>"g", "u"=>"h", "v"=>"i", "w"=>"j", "x"=>"k", "y"=>"l", "z"=>"m", "0"=>"n", "1"=>"o", "2"=>"p", "3"=>"q", "4"=>"r", "5"=>"s", "6"=>"t", "7"=>"u", "8"=>"v", "9"=>"w", " "=>"x", "."=>"y", ","=>"z"}]
    assert_equal array, result.master_cipher
  end

  def test_it_can_encrypt_a_message
    result = Encryptor.new("try ", "41521", "020315")
    assert_equal "48ax", result.encrypt
  end
end
