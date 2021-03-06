module Vedeu

  # This module allows the sharing of presentation concerns between the models:
  # Interface, Line and Stream.
  #
  # @api private
  module Presentation

    # Returns the colour and style attributes of the receiving class.
    #
    # @return [Hash]
    def view_attributes
      {
        colour: attributes[:colour],
        style:  attributes[:style],
      }
    end

    # Returns a new Colour instance.
    #
    # @return [Colour]
    def colour
      @colour ||= Colour.new(attributes[:colour])
    end

    # Returns a new Style instance.
    #
    # @return [Style]
    def style
      @style ||= Style.new(attributes[:style])
    end

    # Converts the colours and styles to escape sequences, and if the parent
    # model has previously set the colour and style, reverts back to that for
    # consistent formatting.
    #
    # @return [String]
    def to_s
      render_colour do
        render_style do
          data
        end
      end
    end

    private

    # Renders the colour attributes of the receiver, yields (to then render the
    # the styles) and once returned, attempts to set the colours back to the
    # those of the receiver's parent.
    #
    # @return [String]
    def render_colour(&block)
      [ colour.to_s, yield, parent_colour ].join
    end

    # Renders the style attributes of the receiver, yields (to then render the
    # next model, or finally, the content) and once returned, attempts to set
    # the colours back to those of the receiver's parent.
    #
    # @return [String]
    def render_style(&block)
      [ style.to_s, yield, parent_style ].join
    end

    # Returns the parent colour as an escape sequence if set.
    #
    # @return [String]
    def parent_colour
      return '' if parent.nil?

      Colour.new(parent[:colour]).to_s
    end

    # Returns the parent style as an escape sequence if set.
    #
    # @return [String]
    def parent_style
      return '' if parent.nil?

      Style.new(parent[:style]).to_s
    end

  end # Presentation

end # Vedeu
