module Vedeu

  #
  #
  # @note Refer to UTF-8 U+2500 to U+257F for border characters. More details
  #   can be found at: http://en.wikipedia.org/wiki/Box-drawing_character
  #
  class Border

    include Presentation

    # Returns a new instance of Border.
    #
    # @param attributes [Hash]
    # @return [Border]
    def initialize(attributes = {})
      @attributes = defaults.merge!(attributes)
    end

    private

    # The default values for a new instance of Border.
    #
    # @return [Hash]
    def defaults
      {
        bottom_left:  '',
        bottom_right: '',
        colour:       {},
        horizontal:   '',
        style:        [],
        top_left:     '',
        top_right:    '',
        vertical:     '',
      }
    end

  end # Border

end # Vedeu
