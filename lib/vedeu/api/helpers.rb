module Vedeu

  module API

    # Provides colour and style helpers for use in the {API::Interface},
    # {API::Line} and {API::Stream} classes.
    #
    # @api public
    module Helpers

      include Common

      # Define either or both foreground and background colours for an
      # interface, line, or a stream. When called with a block, will create a
      # new stream with the background/foreground colour specified; see
      # {Vedeu::API::Stream} for directives which are valid within the block.
      # When the block terminates, the background/foreground will return to that
      # of the parent.
      #
      # @param value [Hash|String]
      # @param block [Proc]
      #
      # @example
      #   interface 'my_interface' do
      #     colour background: '#000000', foreground: '#ffffff'
      #     background '#0022ff'
      #     foreground '#ffffff'
      #     ...
      #
      #   line do
      #     colour background: '#000000', foreground: '#ffffff'
      #     background '#0022ff'
      #     foreground '#ffffff'
      #     ...
      #
      #   stream do
      #     colour background: '#000000', foreground: '#ffffff'
      #     background '#0022ff'
      #     foreground '#ffffff'
      #     ...
      #
      #   background('#0022ff') { 'This will be on a blue background.' }
      #   foreground('#ffffff') { 'This will be white text.' }
      #
      # @raise [InvalidSyntax] When the values parameter does not contain
      #   required keys, or a non-empty String value.
      # @return [Hash]
      def colour(value, &block)
        fail InvalidSyntax, "##{__callee__} requires a value." unless defined_value?(value)

        if value.is_a?(Hash)
          unless value.key?(:foreground) || value.key?(:background)
            fail InvalidSyntax, "##{__callee__} expects a Hash containing " \
              ':foreground or :background or both.'
          end

          attributes[:colour] = value

        else
          if block_given?
            attributes[:streams] << API::Stream
              .build({ colour: { __callee__ => value },
                       parent: self.view_attributes }, &block)

          else
            attributes[:colour].merge!({ __callee__ => value })

          end
        end
      end
      alias_method :background, :colour
      alias_method :foreground, :colour

      # Define a style or styles for an interface, line or a stream.
      #
      # @param values [Array|String]
      # @param block  [Proc]
      #
      # @example
      #   interface 'my_interface' do
      #     style 'normal'
      #     ...
      #
      #   line do
      #     style ['bold', 'underline']
      #     ...
      #
      #   stream do
      #     style 'blink'
      #     ...
      #
      # @return [Array]
      def style(values = [], &block)
        if block_given?
          attributes[:streams] << API::Stream
                                    .build({ style: Array(values) }, &block)

        else
          Array(values).each { |value| attributes[:style] << value }

        end
      end

    end # Helpers

  end # API

end # Vedeu
