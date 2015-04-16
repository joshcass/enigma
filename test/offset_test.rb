gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'

class OffsetTest < Minitest::Test

  def test_it_can_hold_a_date
    result = Offset.new
    assert result.respond_to?(:date)
  end

  def test_it_has_a_method_to_calculate_offsest
    result = Offset.new
    assert result.respond_to?(:offsets)
  end

  def test_it_has_a_method_to_gnerate_current_date
    assert Offset.respond_to?(:today)
  end

  def test_it_has_a_default_value_for_date
    result = Offset.new
    assert_equal "000000", result.date
  end

  def test_it_correctly_formats_a_date_given_as_integer
    result = Offset.new(160415)
    assert_equal "160415", result.date
  end

  def test_it_can_accept_a_provided_date
    result = Offset.new("040776")
    assert_equal "040776", result.date
  end

  def test_it_can_generate_current_date_in_proper_format
    result = Offset.today
    date = Time.now.strftime("%d%m%y")
    assert_equal date, result
  end

  def test_it_returns_the_offset_values_in_an_array
    result = Offset.new("160415")
    assert result.offsets.is_a?Array
  end

  def test_it_can_determine_the_offset_key
    result = Offset.new("020315")
    assert_equal [9, 2, 2, 5], result.offsets
  end

  def test_it_can_determine_offset_key_for_zero_date
    result = Offset.new
    assert_equal [0, 0, 0, 0], result.offsets
  end
end
