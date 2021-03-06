require 'test_helper'

module Vedeu

  describe Configuration do

    before { Configuration.reset! }
    after  { test_configuration }

    describe '#colour_mode' do
      it 'returns the value of the colour_mode option' do
        skip
        Configuration.colour_mode.must_equal(16777216)
        Configuration.colour_mode.must_equal(256)
      end
    end

    describe '#debug?' do
      it 'returns the value of the debug option' do
        Configuration.debug?.must_equal(false)
      end
    end

    describe '#interactive?' do
      it 'returns the value of the interactive option' do
        Configuration.interactive?.must_equal(true)
      end
    end

    describe '#log' do
      it 'returns the value of the log option' do
        skip
        Configuration.log.must_match(/vedeu_test\.log/)
      end
    end

    describe '#once?' do
      it 'returns the value of the once option' do
        Configuration.once?.must_equal(false)
      end
    end

    describe '#terminal_mode' do
      it 'returns the value of the mode option' do
        Configuration.terminal_mode.must_equal(:raw)
      end
    end

    describe '#trace?' do
      it 'returns the value of the trace option' do
        Configuration.trace?.must_equal(false)
      end
    end

    describe '.configure' do
      it 'returns the options configured' do
        Configuration.configure.must_equal(
          {
            colour_mode:   256,
            debug:         false,
            interactive:   true,
            log:           '/tmp/vedeu.log',
            once:          false,
            system_keys:   {
              exit:        'q',
              focus_next:  :tab,
              focus_prev:  :shift_tab,
              mode_switch: :escape
            },
            terminal_mode: :raw,
            trace:         false
          }
        )
      end
    end

  end # Configuration

end # Vedeu
