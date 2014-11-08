module Vedeu

  # A single keypress or combination of keypresses bound to a specific action.
  class Key

    # Returns a new instance of Key.
    #
    # @param input [String]
    # @param output [Proc]
    # @return [Key]
    def initialize(input, output)
      @input  = input
      @output = output
    end

    # @return []
    def press
      output.call
    end

    private

    attr_reader :input, :output

  end # Key

end # Vedeu
