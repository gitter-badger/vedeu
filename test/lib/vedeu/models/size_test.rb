require 'test_helper'

module Vedeu

  describe Size do
    let(:attributes) {
      {
        centred: centred,
        tvn:     tvn,
        v:       v,
        vn:      vn,
        value:   value,
      }
    }
    let(:centred) { nil }
    let(:tvn)     { nil }
    let(:v)       { nil }
    let(:vn)      { nil }
    let(:value)   { nil }

    describe '#initialize' do
      it 'returns an instance of itself' do
        Size.new(attributes).must_be_instance_of(Size)
      end
    end

    describe '#first' do
      subject { Size.new(attributes).first }

      context 'when v and vn are set' do
        let(:v)  { 10 }
        let(:vn) { 70 }

        context 'and the calculated value is >= the terminal value' do
          let(:tvn) { 40 }

          it { subject.must_equal(1) }
        end

        context 'and the calculated value is < the terminal value' do
          let(:tvn) { 80 }

          it { subject.must_equal(nil) }
        end
      end

      context 'when a value is set' do
        let(:value) { 60 }

        context 'and the value is >= the terminal value' do
          let(:tvn) { 40 }

          it { subject.must_equal(1) }
        end
      end

      context 'when a value is not set' do
        it { subject.must_equal(nil) }
      end
    end

    describe '#last' do
      subject { Size.new(attributes).last }

      context 'when v and vn are set' do
        let(:v)  { 10 }
        let(:vn) { 70 }

        context 'and the calculated value is >= the terminal value' do
          let(:tvn) { 40 }

          it { subject.must_equal(tvn) }
        end

        context 'and the calculated value is < the terminal value' do
          let(:tvn) { 80 }

          it { subject.must_equal(nil) }
        end
      end

      context 'when a value is set' do
        let(:value) { 60 }

        context 'and the value is >= the terminal value' do
          let(:tvn) { 40 }

          it { subject.must_equal(tvn) }
        end
      end

      context 'when a value is not set' do
        it { subject.must_equal(nil) }
      end
    end

  end # Size

end # Vedeu
