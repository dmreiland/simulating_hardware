require './test/test_helper'
require './lib/helpers/binary'

class BinaryTest < GateTest
  def test_it_converts_zero_input_to_an_array_of_low
    b = Helpers::Binary.new('0')
    assert_equal 1, b.bits.count
    assert_equal LOW, b.bits[0]
  end

  def test_it_converts_101010_input_to_an_array_of_high_low_values
    b = Helpers::Binary.new('101010')
    assert_equal 6, b.bits.count
    assert_low b.bits[0]
    assert_high b.bits[1]
    assert_low b.bits[2]
    assert_high b.bits[3]
    assert_low b.bits[4]
    assert_high b.bits[5]
  end

  def test_it_equates_instances_based_on_digits
    a = Helpers::Binary.new('101010')
    b = Helpers::Binary.new('101010')
    assert_equal a, b
  end

  def test_it_allows_spaces_in_the_input_string
    a = Helpers::Binary.new('10 10 10')
    b = Helpers::Binary.new('101010')
    assert_equal a, b
  end

  def test_it_builds_representations_from_arrays_of_bits
    a = Helpers::Binary.new('10 10 10')
    b = Helpers::Binary.from_bits([1, 0, 1, 0, 1, 0])
    assert_equal a, b
  end

  def test_it_exposes_the_bit_size
    assert_equal 4, Helpers::Binary.new("0000").size
  end
end
