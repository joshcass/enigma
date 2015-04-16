gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/total_rotations'

class TotalRotationsTest < Minitest::Test

  def test_it_can_hold_a_key
    result = TotalRotations.new("12345", "160415")
    assert  result.respond_to?(:key)
  end

  def test_it_can_hold_a_date
    result = TotalRotations.new("12345", "164015")
    assert  result.respond_to?(:date)
  end

  def test_it_has_method_to_calcualte_sum
    result = TotalRotations.new("12345", "164015")
    assert result.respond_to?(:sum)
  end

  def test_key_is_a_Key_object
    result = TotalRotations.new("12345", "164015")
    assert result.key.is_a?Key
  end

  def test_date_is_a_offset_object
    result = TotalRotations.new("12345", "164015")
    assert result.date.is_a?Offset
  end

  def test_it_creates_new_default_key_object_if_no_key_given
    result = TotalRotations.new("164015")
    assert result.key.is_a?Key
  end

  def test_it_creates_a_new_default_offset_object_if_no_date_given
    result = TotalRotations.new("12345")
    assert result.date.is_a?Offset
  end

  def test_result_of_sum_is_an_array
    result = TotalRotations.new("12345", "164015")
    assert result.sum.is_a?Array
  end

  def test_it_can_sum_the_first_pair_of_rotation_offset_values
    result = TotalRotations.new("41521", "020315")
    sum = result.sum
    assert_equal 50, sum[0]
  end

  def test_it_can_sum_the_second_pair_of_rotation_offset_values
    result = TotalRotations.new("41521", "020315")
    sum = result.sum
    assert_equal 17, sum[1]
  end

  def test_it_can_sum_the_third_pair_of_rotation_offset_values
    result = TotalRotations.new("41521", "020315")
    sum = result.sum
    assert_equal 54, sum[2]
  end

  def test_it_can_sum_the_fourth_pair_of_rotation_offset_values
    result = TotalRotations.new("41521", "020315")
    sum = result.sum
    assert_equal 26, sum[3]
  end

  def test_it_can_sum_the_rotations_and_offset
    result = TotalRotations.new("41521", "020315")
    sum = result.sum
    assert_equal [50, 17, 54, 26], sum
  end
end
