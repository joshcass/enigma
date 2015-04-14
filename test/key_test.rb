gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'

class KeyTest < Minitest::Test

  def test_initial_it_has_a_key
    result = Key.new
    assert_equal "0", result.key
  end

  def test_it_can_generate_a_five_digit_key
    result = Key.new
    key = result.key
    assert_equal key.to_s.size == 5, result.generate.to_s == 5
  end

  def test_it_can_generate_a_random_five_digit_key
    result = Key.new
    keys = []
    1000.times do
      keys << result.generate
    end
    keys.group_by{|i| i}
    assert_equal 1000, keys.count
  end

  def test_it_can_accept_a_known_key
    result = Key.new(12345)
    assert_equal "12345", result.key
  end

  def test_it_can_give_the_rotation_for_the_first_number
    result = Key.new(12345)
    rotation = result.rotations
    assert_equal 12, rotation[0]
  end

  def test_it_can_give_all_four_rotation_values
    result = Key.new(41521)
    rotation = result.rotations
    assert_equal [41, 15, 52, 21], rotation
  end


end
