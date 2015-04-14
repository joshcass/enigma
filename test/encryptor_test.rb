gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'
require './lib/key'
require './lib/encryptor'

class EncryptorTest < Minitest::Test

  def test_it_has_a_key
    result = Encryptor.new("41521", "020315")
    assert_equal "41521", result.key
  end

  def test_it_has_a_date
    result = Encryptor.new("41521", "020315")
    assert_equal "020315", result.date
  end

  def test_it_can_add_rotation_and_offset
    result = Encryptor.new("41521", "020315")
    assert_equal [50, 17, 54, 26], result.add_rotation_and_offset
  end

end
