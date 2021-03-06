module Vedeu

  # The class represents one half (the other, can be found at
  # {Vedeu::Background}) of a terminal colour escape sequence.
  #
  # @api private
  class Foreground < ColourTranslator

    private

    # Returns an escape sequence for a named foreground colour.
    #
    # Valid names are: `:black`, `:red`, `:green`, `:yellow`, `:blue`,
    # `:magenta`, `:cyan`, `:white` and `:default`.
    #
    # @return [String]
    def named
      ["\e[", foreground_codes[colour], 'm'].join
    end

    # Returns an escape sequence.
    #
    # @return [String]
    def numbered
      ["\e[38;5;", css_to_numbered, 'm'].join
    end

    # Returns an escape sequence.
    #
    # @return [String]
    def rgb
      if Configuration.colour_mode == 16777216
        sprintf("\e[38;2;%s;%s;%sm", *css_to_rgb)

      else
        numbered

      end
    end

    # Produces the foreground named colour escape sequence hash from
    # {Vedeu::ColourTranslator#codes}
    #
    # @return [Hash]
    def foreground_codes
      Esc.codes
    end

  end # Foreground

end # Vedeu
