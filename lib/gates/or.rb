require './lib/helpers/signals'
require './lib/gates/nand'

module Gates
  class Or
    attr_accessor :input_a, :input_b

    include Helpers::Signals

    def initialize(inputs = {})
      @input_a = inputs[:input_a]
      @input_b = inputs[:input_b]
    end

    def output
      a_nand_a = Nand.new(input_a: input_a, input_b: input_a)
      b_nand_b = Nand.new(input_a: input_b, input_b: input_b)
      n3 = Nand.new(input_a: a_nand_a.output, input_b: b_nand_b.output)
      n3.output
    end
  end
end
