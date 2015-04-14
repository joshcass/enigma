gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'

class KeyTest < Minitest::Test

  def test_it_has_a_key
    result = Key.new
    assert result.respond_to?(:key)
  end

  def test_it_can_generate_a_five_digit_key
    random = Key.new
    assigned = Key.new("12345")
    assert_equal assigned.to_s.length, random.to_s.length
  end

  def test_it_can_generate_a_random_five_digit_key
    result = Key.new
    keys = []
    1000.times do
      keys << result
    end
    keys.group_by{|i| i}
    assert_equal 1000, keys.count
  end

  def test_it_can_accept_a_known_key
    result = Key.new("12345")
    assert_equal "12345", result.key
  end

  def test_it_can_give_the_rotation_for_the_first_number
    result = Key.new("12345")
    rotation = result.rotations
    assert_equal 12, rotation[0]
  end

  def test_it_can_give_all_four_rotation_values
    result = Key.new("41521")
    rotation = result.rotations
    assert_equal [41, 15, 52, 21], rotation
  end

  # edge cases - input key longer than 5 digits
end
