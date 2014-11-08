require 'test_helper'

module Vedeu

  describe Key do

    let(:input)  { '' }
    let(:output) { proc { :output } }

    describe '#initialize' do
      it 'returns a new instance of Key' do
        Key.new(input, output).must_be_instance_of(Key)
      end
    end

    describe '#press' do
      it 'returns the result of calling the proc' do
        Key.new(input, output).press.must_equal(:output)
      end
    end

  end # Key

end # Vedeu
