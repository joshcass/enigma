gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'

class OffsetTest < Minitest::Test

  def test_it_can_accpet_a_provided_date
    result = Offset.new("040776")
    assert_equal "040776", result.date
  end

  def test_it_can_generate_current_date_in_proper_format
    result = Offset.new
    date = Time.now.strftime("%d%m%y")
    assert_equal date, result.today
  end

  def test_it_can_determine_the_offset_key
    result = Offset.new("020315")
    assert_equal [9, 2, 2, 5], result.offset_key
  end

end
