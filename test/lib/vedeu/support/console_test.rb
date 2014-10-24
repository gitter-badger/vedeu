require 'test_helper'

module Vedeu

  describe Console do

    describe '#winsize' do
      context 'when specified' do
        it 'returns a double representing the terminal size' do
          Console.new({ winsize: [12, 40] }).winsize.must_equal([12, 40])
        end
      end

      context 'by default' do
        it 'returns a double representing the terminal size' do
          Console.new.winsize.must_equal([25, 80])
        end
      end
    end

  end # Console

end # Vedeu
