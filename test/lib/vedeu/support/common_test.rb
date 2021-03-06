require 'test_helper'

class VedeuCommonClass
  include Vedeu::Common

  def defined_value_test(variable)
    defined_value?(variable)
  end
end # VedeuCommonClass

module Vedeu

  describe Common do

    describe '#defined_value?' do
      it 'return true when the variable is not nil or empty' do
        VedeuCommonClass.new.defined_value_test('not empty').must_equal(true)
      end

      it 'returns false when the variable is nil or empty' do
        VedeuCommonClass.new.defined_value_test([]).must_equal(false)
      end

      it 'returns false when dealing with hash keys which may not exist or ' \
         'have a value' do
        attributes = {}

        VedeuCommonClass.new.defined_value_test(attributes[:misc]).must_equal(false)
      end
    end

  end # Common

end # Vedeu
