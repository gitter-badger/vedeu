require 'vedeu/instrumentation'
require 'vedeu/support/builder'
require 'vedeu/support/events'
require 'vedeu/support/geometry'
require 'vedeu/support/menu'
require 'vedeu/output/view'
require 'vedeu/launcher'

module Vedeu
  # :nocov:
  def self.debug?
    false
  end
  # :nocov:

  Vedeu::Instrumentation::Trace.call if debug?

  # :nocov:
  module API
    def interface(name, &block)
      Builder.build(name, &block)
    end

    def event(name, &block)
      Vedeu.events.on(name, &block)
    end
    alias_method :on, :event

    def run(name, *args)
      Vedeu.events.trigger(name, *args)
    end
    alias_method :trigger, :run

    def view(name)
      Persistence.query(name)
    end
  end

  def self.events
    @events ||= Events.new do
      on(:_exit_)        { fail StopIteration }
      on(:_log_)         { |message| Vedeu.log(message) }
      on(:_mode_switch_) { fail ModeSwitch    }

      on(:_keypress_) do |key|
        trigger(:key, key)
        trigger(:_log_, (' ' * 42) + "key: #{key}")
        trigger(:_mode_switch_) if key == :escape
      end
    end
  end

  def self.log(message)
    Vedeu::Instrumentation::Log.logger.debug(message)
  end

  def self.error(exception)
    Vedeu::Instrumentation::Log.error(exception)
  end

  # :nocov:
  def self.included(receiver)
    receiver.send(:include, API)
    receiver.extend(API)
  end
  # :nocov:

  extend API

  private

  def self.root_path
    File.expand_path('../..', __FILE__)
  end
  # :nocov:
end
