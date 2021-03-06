require 'test_helper'

module Vedeu

  module Config

    describe CLI do

      before { Configuration.reset! }
      after  { test_configuration }

      describe '#colour_mode' do
        it '--colour-mode' do
          Configuration.configure(['--colour-mode', '16777216'])
          Configuration.colour_mode.must_equal(16777216)
        end

        it '--colour-mode' do
          Configuration.configure(['--colour-mode', '256'])
          Configuration.colour_mode.must_equal(256)
        end

        it '--colour-mode' do
          Configuration.configure(['--colour-mode', '16'])
          Configuration.colour_mode.must_equal(16)
        end

        it '--colour-mode' do
          Configuration.configure(['--colour-mode', '348'])
          Configuration.colour_mode.must_equal(8)
        end
      end

      describe '#debug?' do
        it '--debug' do
          Configuration.configure(['--debug'])
          Configuration.debug?.must_equal(true)
        end
      end

      describe '#interactive?' do
        it '--interactive' do
          Configuration.configure(['--interactive'])
          Configuration.interactive?.must_equal(true)
        end

        it '--noninteractive' do
          Configuration.configure(['--noninteractive'])
          Configuration.interactive?.must_equal(false)
        end

        it '--standalone' do
          Configuration.configure(['--standalone'])
          Configuration.interactive?.must_equal(false)
        end
      end

      describe '#log' do
        it '--log' do
          Configuration.configure(['--log', '/tmp/vedeu_cli_test.log'])
          Configuration.log.must_equal('/tmp/vedeu_cli_test.log')
        end
      end

      describe '#once?' do
        it '--run-once' do
          Configuration.configure(['--run-once'])
          Configuration.once?.must_equal(true)
        end

        it '--run-many' do
          Configuration.configure(['--run-many'])
          Configuration.once?.must_equal(false)
        end
      end

      describe '#terminal_mode' do
        it '--cooked' do
          Configuration.configure(['--cooked'])
          Configuration.terminal_mode.must_equal(:cooked)
        end

        it '--raw' do
          Configuration.configure(['--raw'])
          Configuration.terminal_mode.must_equal(:raw)
        end
      end

      describe '#trace?' do
        it '--trace' do
          Configuration.configure(['--trace'])
          Configuration.trace?.must_equal(true)
        end
      end

    end # CLI

  end # Config

end # Vedeu
