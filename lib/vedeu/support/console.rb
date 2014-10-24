module Vedeu

  # Provide access to Ruby's IO.console, or use the StringIO object provided.
  # This class also provides some mock methods for IO.console.
  #
  class Console

    attr_reader :attributes

    # @param attributes [Hash]
    # @option attributes :winsize [Array] A double containing the height in
    #   in lines and width in characters of the terminal.
    def initialize(attributes = {})
      @attributes = defaults.merge!(attributes)
    end

    def cooked
    end

    def getch
    end

    def gets
    end

    def print
    end

    def raw
    end

    def read_nonblock(args)
    end

    def winsize
      attributes[:winsize]
    end

    private

    def defaults
      {
        winsize: [25, 80],
      }
    end

  end # Console

end # Vedeu
