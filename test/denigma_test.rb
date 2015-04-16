gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/denigma'

class DenigmaTest < Minitest::Test

  def test_it_can_crack_a_message_key
    result = Denigma.new("wd.p39js6k3bn 4rs y", "150415")
    assert_equal "13638", result.crack
  end

  def test_it_can_crack_encrypted_brother_karamazov
    skip
    crypt = File.open("./test/test_encrypted.txt", "r")
    encrypted = crypt.read.chomp
    result = Denigma.new(encrypted, "150415")
    assert_equal "58876", result.crack
  end

end
