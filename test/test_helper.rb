require 'simplecov'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride' unless ENV['NO_COLOR']
require 'minitest/hell'

SimpleCov.start do
  command_name 'MiniTest::Spec'
  add_filter   '/test/'
end unless ENV['no_simplecov']

module MiniTest
  class Spec
    # parallelize_me! # uncomment to unleash hell

    class << self
      alias_method :context, :describe
    end # Spec eigenclass
  end
end

require 'mocha/setup'

GC.disable

require 'vedeu'

def test_configuration
  Vedeu.configure do
    debug!
    colour_mode 16777216
    log         '/tmp/vedeu_test_helper.log'
  end
end

test_configuration

# commented out by default (makes tests slower)
# require 'minitest/reporters'
# Minitest::Reporters.use!(
  # Minitest::Reporters::DefaultReporter.new({ color: true, slow_count: 5 }),
  # Minitest::Reporters::SpecReporter.new
# )

# trace method execution with (optionally) local variables
# require 'vedeu/support/log'
# Vedeu::Trace.call({ watched: 'call', klass: /^Vedeu/ })
