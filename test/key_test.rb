gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'

class KeyTest < Minitest::Test

  def test_it_can_hold_a_key
    result = Key.new
    assert result.respond_to?(:key)
  end

  def test_it_has_a_method_to_calculate_rotataions
    result = Key.new
    assert result.respond_to?(:rotations)
  end

  def test_it_has_a_method_to_generate_a_key
    assert Key.respond_to?(:generate)
  end

  def test_it_has_a_default_key_value_if_none_given
    result = Key.new
    assert_equal "00000", result.key
  end

  def test_it_correctly_formats_a_key_less_than_five_digits
    result = Key.new("5")
    assert_equal "00005", result.key
  end

  def test_it_correctly_formats_a_key_given_as_integer
    result = Key.new(12345)
    assert_equal "12345", result.key
  end

  def test_it_can_accept_a_known_key
    result = Key.new("12345")
    assert_equal "12345", result.key
  end

  def test_it_can_generate_a_five_digit_key
    assert_equal 5, Key.generate.length
  end

  def test_it_can_generate_a_random_five_digit_key
    keys = []
    1000.times do
      keys << Key.generate
    end
    keys.group_by{|key| key}
    assert_equal 1000, keys.count
  end

  def test_it_returns_rotation_values_in_an_array
    result = Key.new("12345")
    assert result.rotations.is_a?Array
  end

  def test_it_can_give_the_rotation_for_the_first_number
    result = Key.new("12345")
    rotation = result.rotations
    assert_equal 12, rotation[0]
  end

  def test_it_can_give_the_rotation_for_the_second_number
    result = Key.new("12345")
    rotation = result.rotations
    assert_equal 23, rotation[1]
  end

  def test_it_can_give_the_rotation_for_the_third_number
    result = Key.new("12345")
    rotation = result.rotations
    assert_equal 34, rotation[2]
  end

  def test_it_can_give_the_rotation_for_the_fourth_number
    result = Key.new("12345")
    rotation = result.rotations
    assert_equal 45, rotation[3]
  end

  def test_it_can_give_all_four_rotation_values
    result = Key.new("41521")
    rotation = result.rotations
    assert_equal [41, 15, 52, 21], rotation
  end
end
