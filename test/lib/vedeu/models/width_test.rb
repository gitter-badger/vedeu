require 'test_helper'

module Vedeu

  # describe Width do
  #   let(:attributes) {
  #     {
  #       centred: centred,
  #       txn:     txn,
  #       width:   width,
  #       x:       x,
  #       xn:      xn,
  #     }
  #   }
  #   let(:centred) { nil }
  #   let(:txn)     { 80  }
  #   let(:xn)      { nil }
  #   let(:x)       { nil }
  #   let(:width)   { nil }

  #   describe '#centred?' do
  #     context 'when the attribute is not set' do
  #       it { Width.new(attributes).centred?.must_equal(false) }
  #     end

  #     context 'when the attribute is set' do
  #       let(:centred) { true }

  #       it { Width.new(attributes).centred?.must_equal(true) }
  #     end
  #   end

  #   describe '#width?' do
  #     context 'when the attribute is not set' do
  #       it { Width.new(attributes).width?.must_equal(false) }
  #     end

  #     context 'when the attribute is set' do
  #       let(:width) { 20 }

  #       it { Width.new(attributes).width?.must_equal(true) }
  #     end
  #   end

  #   describe '#width' do
  #     context 'when the attribute is not set' do
  #       it { Width.new(attributes).width.must_equal(nil) }
  #     end

  #     context 'when the attribute is set' do
  #       let(:width) { 20 }

  #       it { Width.new(attributes).width.must_equal(20) }
  #     end
  #   end

  #   describe '#first' do
  #     let(:instance)   { Width.new(attributes) }
  #     let(:attributes) {
  #       {
  #         centred: centred,
  #         txn:     txn,
  #         width:   width,
  #         x:       x,
  #         xn:      xn,
  #       }
  #     }
  #     let(:centred) { nil }
  #     let(:txn)     { 80  }
  #     let(:xn)      { nil }
  #     let(:x)       { nil }
  #     let(:width)   { nil }

  #     subject { instance.first }

  #     it 'returns a Fixnum' do
  #       subject.must_be_instance_of(Fixnum)
  #     end

  #     context 'when centred' do
  #       let(:centred) { true }


  #     end

  #     context 'when not centred' do
  #       let(:centred) { false }

  #       context 'and x is set' do
  #         let(:x) { 5 }

  #         it { subject.must_equal(5) }

  #         context 'and x is less than 1' do
  #           let(:x) { -5 }

  #           it { subject.must_equal(1) }
  #         end

  #         context 'and x is greater than the terminal size' do
  #           let(:x) { 100 }

  #           it { subject.must_equal(80) }
  #         end
  #       end

  #       context 'or xn is set' do
  #         let(:xn) { 55 }

  #         context 'and xn is less than 1' do
  #           let(:xn) { -5 }

  #           it { subject.must_equal(1) }
  #         end

  #         context 'and xn is greater than the terminal size' do
  #           let(:xn) { 100 }

  #           it { subject.must_equal(1) }
  #         end

  #         context 'and width is set' do
  #           let(:width) { 40 }

  #           it { subject.must_equal(15) }
  #         end

  #         context 'and width is not set' do
  #           it { subject.must_equal(25) }
  #         end
  #       end

  #       context 'or x and xn are not set' do
  #         it { subject.must_equal(1) }
  #       end
  #     end
  #   end # #first

  #   # describe '#last' do
  #   #   let(:attributes) {
  #   #     {
  #   #       centred: centred,
  #   #       txn:     txn,
  #   #       xn:      xn,
  #   #       x:       x,
  #   #       width:   width,
  #   #     }
  #   #   }
  #   #   let(:centred) { nil }
  #   #   let(:txn)     { 80  }
  #   #   let(:xn)      { nil }
  #   #   let(:x)       { nil }
  #   #   let(:width)   { nil }

  #   #   subject { Width.new(attributes).last }

  #   #   it 'returns a Fixnum' do
  #   #     subject.must_be_instance_of(Fixnum)
  #   #   end

  #   #   context 'when centred' do
  #   #     let(:centred) { true }

  #   #     context 'and a width is set' do
  #   #       let(:width) { 40 }

  #   #       context 'but both x and xn are set' do
  #   #         let(:x)  { 5 }
  #   #         let(:xn) { 35 }

  #   #         # it { subject.must_equal() }

  #   #         context 'value out of bounds (greater)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #         context 'value out of bounds (lesser)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #       end
  #   #       context 'and only x is set' do
  #   #         let(:x)  { 5 }

  #   #         # it { subject.must_equal() }

  #   #         context 'value out of bounds (greater)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #         context 'value out of bounds (lesser)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #       end
  #   #       context 'and only xn is set' do
  #   #         let(:xn) { 35 }

  #   #         # it { subject.must_equal() }

  #   #         context 'value out of bounds (greater)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #         context 'value out of bounds (lesser)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #       end
  #   #       context 'with neither x or xn set' do
  #   #         # it { subject.must_equal() }

  #   #         context 'value out of bounds (greater)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #         context 'value out of bounds (lesser)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #       end
  #   #     end

  #   #     context 'but a width is not set' do
  #   #       context 'but both x and xn are set' do
  #   #         let(:x)  { 5 }
  #   #         let(:xn) { 35 }

  #   #         # it { subject.must_equal() }
  #   #       end
  #   #       context 'and only x is set' do
  #   #         let(:x)  { 5 }

  #   #         # it { subject.must_equal() }
  #   #         context 'value out of bounds (greater)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #         context 'value out of bounds (lesser)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #       end
  #   #       context 'and only xn is set' do
  #   #         let(:xn) { 35 }

  #   #         # it { subject.must_equal() }
  #   #         context 'value out of bounds (greater)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #         context 'value out of bounds (lesser)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #       end
  #   #       context 'with neither x or xn set' do
  #   #         # it { subject.must_equal(1) }

  #   #         context 'value out of bounds (greater)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #         context 'value out of bounds (lesser)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #       end
  #   #     end
  #   #   end

  #   #   context 'when not centred' do
  #   #     let(:centred) { false }

  #   #     context 'and a width is set' do
  #   #       let(:width) { 40 }

  #   #       context 'but both x and xn are set' do
  #   #         let(:x)  { 5 }
  #   #         let(:xn) { 35 }

  #   #         # it { subject.must_equal() }

  #   #         context 'value out of bounds (greater)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #         context 'value out of bounds (lesser)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #       end
  #   #       context 'and only x is set' do
  #   #         let(:x)  { 5 }

  #   #         # it { subject.must_equal() }

  #   #         context 'value out of bounds (greater)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #         context 'value out of bounds (lesser)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #       end
  #   #       context 'and only xn is set' do
  #   #         let(:xn) { 35 }

  #   #         # it { subject.must_equal() }

  #   #         context 'value out of bounds (greater)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #         context 'value out of bounds (lesser)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #       end
  #   #       context 'with neither x or xn set' do
  #   #         # it { subject.must_equal() }

  #   #         context 'value out of bounds (greater)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #         context 'value out of bounds (lesser)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #       end
  #   #     end

  #   #     context 'but a width is not set' do
  #   #       let(:width) { nil }

  #   #       context 'but both x and xn are set' do
  #   #         let(:x)  { 5 }
  #   #         let(:xn) { 35 }

  #   #         # it { subject.must_equal() }

  #   #         context 'value out of bounds (greater)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #         context 'value out of bounds (lesser)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #       end
  #   #       context 'and only x is set' do
  #   #         let(:x)  { 5 }

  #   #         # it { subject.must_equal() }

  #   #         context 'value out of bounds (greater)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #         context 'value out of bounds (lesser)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #       end
  #   #       context 'and only xn is set' do
  #   #         let(:xn) { 35 }

  #   #         # it { subject.must_equal() }

  #   #         context 'value out of bounds (greater)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #         context 'value out of bounds (lesser)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #       end
  #   #       context 'with neither x or xn set' do
  #   #         # it { subject.must_equal(1) }

  #   #         context 'value out of bounds (greater)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #         context 'value out of bounds (lesser)' do
  #   #           let(:xn) { }

  #   #           # it { subject.must_equal() }
  #   #         end
  #   #       end
  #   #     end
  #   #   end
  #   # end # #last

  #   describe '#size' do
  #     let(:attributes) {
  #       {
  #         txn:   txn,
  #         width: width,
  #         x:     x,
  #         xn:    xn,
  #       }
  #     }
  #     let(:txn)     { 80  }
  #     let(:xn)      { nil }
  #     let(:x)       { nil }
  #     let(:width)   { nil }

  #     subject { Vedeu::Width.new(attributes).size }

  #     it 'returns a Fixnum' do
  #       subject.must_be_instance_of(Fixnum)
  #     end

  #     context 'when a width is set' do
  #       let(:width) { 40 }

  #       context 'but both x and xn are set' do
  #         let(:x)  { 5  }
  #         let(:xn) { 55 }

  #         it 'overrides width' do
  #           subject.must_equal(50)
  #         end
  #       end
  #       context 'and only x is set' do
  #         let(:x) { 5 }

  #         it { subject.must_equal(45) }
  #       end
  #       context 'and only xn is set' do
  #         let(:xn) { 35 }

  #         it { subject.must_equal(80) }
  #       end
  #       context 'with neither x or xn set' do
  #         it { subject.must_equal(width) }

  #         context 'value out of bounds (greater)' do
  #           let(:width) { 100 }

  #           it { subject.must_equal(80) }
  #         end

  #         context 'value out of bounds (lesser)' do
  #           let(:width) { -10 }

  #           it { subject.must_equal(1) }
  #         end
  #       end
  #     end

  #     context 'when a width is not set' do
  #       context 'but both x and xn are set' do
  #         let(:x)  { 5  }
  #         let(:xn) { 55 }

  #         it { subject.must_equal(50) }
  #       end
  #       context 'and only x is set' do
  #         let(:x) { 5 }

  #         it { subject.must_equal(75) }

  #         context 'less than 1' do
  #           let(:x) { -5 }

  #           it { subject.must_equal(80) }
  #         end

  #         context 'greater than terminal size' do
  #           let(:x) { 120 }

  #           it { subject.must_equal(80) }
  #         end
  #       end
  #       context 'and only xn is set' do
  #         let(:xn) { 35 }

  #         it { subject.must_equal(35) }

  #         context 'less than 1' do
  #           let(:xn) { -5 }

  #           it { subject.must_equal(80) }
  #         end

  #         context 'greater than terminal size' do
  #           let(:xn) { 120 }

  #           it { subject.must_equal(80) }
  #         end
  #       end

  #       context 'with neither x or xn set' do
  #         it { subject.must_equal(txn) }
  #       end
  #     end

  #   end # #size

  # end # Width

end # Vedeu
