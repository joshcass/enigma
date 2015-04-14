gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/total_rotations'

class TotalRotationsTest < Minitest::Test

  def test_it_can_sum_the_rotations_and_offset
    result = TotalRotations.new("41521", "020315")
    sum = result.sum
    assert_equal [50, 17, 54, 26], sum
  end

end
