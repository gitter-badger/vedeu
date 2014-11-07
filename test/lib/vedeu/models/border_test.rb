require 'test_helper'

module Vedeu

  describe Border do

    describe '#initialize' do
      it 'returns a new instance of Border' do
        Border.new.must_be_instance_of(Border)
      end
    end

  end # Border

end # Vedeu
