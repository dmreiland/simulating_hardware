require './test/test_helper'
require './lib/adders/ripple'
require './lib/helpers/binary'

class RippleAdderTest < GateTest
  def adder
    @adder ||= Adders::Ripple.new(8)
  end

  def test_zero_inputs_add_to_zero_outputs
    adder.input_a = Helpers::Binary.new('00000000')
    adder.input_b = Helpers::Binary.new('00000000')
    assert_equal Helpers::Binary.new('00000000'), adder.output
  end
end
