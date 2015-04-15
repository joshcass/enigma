gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_can_decrypt_a_message
    result = Enigma.new("try ", "41521", "020315")
    assert_equal "48ax", result.encrypt
  end

  def test_it_can_encrypt_a_message
    result = Enigma.new("48ax", "41521", "020315")
    assert_equal "try ", result.decrypt
  end
end
