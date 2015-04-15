gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/denigma'

class DenigmaTest < Minitest::Test

  def test_it_can_encrypt_a_message
    result = Denigma.new("wd.p39js6k3bn 4rs y", "150415")
    assert_equal "13638", result.crack
  end
end
