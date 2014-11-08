module Vedeu

  module API

    # Provides methods to be used to define interfaces or views.
    #
    # @api public
    class Interface < Vedeu::Interface

      include Helpers

      # Instructs Vedeu to calculate x and y geometry automatically based on the
      # centre character of the terminal, the width and the height.
      #
      # @param value [Boolean] Any value other than nil or false will evaluate
      #   to true.
      #
      # @example
      #   interface 'my_interface' do
      #     centred!
      #
      #   interface 'my_interface' do
      #     centred false
      #     ...
      #
      # @return [Boolean]
      def centred(value = true)
        attributes[:geometry][:centred] = !!(value)
      end
      alias_method :centred!, :centred

      # Set the cursor visibility on an interface.
      #
      # @param value [Boolean] Any value other than nil or false will evaluate
      #   to true.
      #
      # @example
      #   interface 'my_interface' do
      #     cursor true
      #     ...
      #
      #   view 'my_interface' do
      #     cursor true
      #     ...
      #
      # @return [Symbol]
      def cursor(value = true)
        attributes[:cursor] = if !!value
          :show

        else
          :hide

        end
      end

      # To maintain performance interfaces can be delayed from refreshing too
      # often, the reduces artefacts particularly when resizing the terminal
      # screen.
      #
      # @param value [Fixnum|Float]
      #
      # @example
      #   interface 'my_interface' do
      #     delay 0.5 # interface will not update more often than every 500ms.
      #     ...
      #
      # @return [Fixnum|Float]
      def delay(value)
        attributes[:delay] = value
      end

      # Specify this interface as being in focus when the application starts.
      # If multiple interfaces are defined, and this is included in each, then
      # the last defined will be the interface in focus.
      #
      # @return [String] The name of the interface in focus.
      def focus!
        attributes[:focus] = true
      end

      # Specify a group for an interface. Interfaces of the same group can be
      # targetted together; for example you may want to refresh multiple
      # interfaces at once.
      #
      # @param value [String]
      #
      # @example
      #   interface 'my_interface' do
      #     group 'main_screen'
      #     ...
      #
      # @return [String]
      def group(value)
        attributes[:group] = value
      end

      # Specify the number of characters/rows/lines tall the interface will be.
      #
      # @param value [Fixnum]
      #
      # @example
      #   interface 'my_interface' do
      #     height 8
      #     ...
      #
      # @return [Fixnum]
      def height(value)
        Vedeu.log(out_of_bounds('height')) if y_out_of_bounds?(value)

        attributes[:geometry][:height] = value
      end

      # @see Vedeu::API#keys
      def keys(&block)
        Keymap.keys(attributes[:name], &block)
      end

      # Specify a single line in a view.
      #
      # @param value [String]
      # @param block [Proc]
      #
      # @example
      #   view 'my_interface' do
      #     line 'This is a line of text...'
      #     line 'and so is this...'
      #     ...
      #
      #   view 'my_interface' do
      #     line do
      #       ... see {API::Line} and {API::Stream}
      #     end
      #   end
      #
      # @return [API::Line]
      def line(value = '', &block)
        if block_given?
          attributes[:lines] << API::Line
            .build({ parent: self.view_attributes }, &block)

        else
          attributes[:lines] << API::Line
            .build({ streams: { text: value }, parent: self.view_attributes })

        end
      end

      # The name of the interface. Used to reference the interface throughout
      # your application's execution lifetime.
      #
      # @param value [String]
      #
      # @example
      #   interface do
      #     name 'my_interface'
      #     ...
      #
      # @return [String]
      def name(value)
        attributes[:name] = value
      end

      # Use the specified interface; useful for sharing attributes with other
      # interfaces. Any public method of #{Vedeu::Interface} is available.
      #
      # @example
      #   interface 'my_interface' do
      #     use('my_other_interface').width # use the width of another interface
      #     ...
      #
      #   Vedeu.use('my_other_interface').width # can be used in your code to
      #                                         # get this value
      #
      # @param value [String]
      # @see Vedeu::API#use
      def use(value)
        Vedeu.use(value)
      end

      # Specify the number of characters/columns wide the interface will be.
      #
      # @param value [Fixnum]
      #
      # @example
      #   interface 'my_interface' do
      #     width 25
      #     ...
      #
      # @return [Fixnum]
      def width(value)
        Vedeu.log(out_of_bounds('width')) if x_out_of_bounds?(value)

        attributes[:geometry][:width] = value
      end

      # Specify the starting x position (column) of the interface.
      #
      # @param value [Fixnum]
      # @param block [Proc]
      #
      # @example
      #   interface 'my_interface' do
      #     x 7 # start on column 7.
      #
      #   interface 'other_interface' do
      #     x { use('my_interface').east } # start on column 8, if
      #                                    # `my_interface` changes position,
      #                                    # `other_interface` will too.
      #
      # @return [Fixnum]
      def x(value = 1, &block)
        return attributes[:geometry][:x] = block if block_given?

        Vedeu.log(out_of_bounds('x')) if x_out_of_bounds?(value)

        attributes[:geometry][:x] = value
      end

      # Specify the ending x position (column) of the interface.
      #
      # @todo Update this documentation.
      #
      # @param value [Fixnum]
      # @param block [Proc]
      #
      # @example
      #   interface 'my_interface' do
      #     x  7  # start on column 7.
      #     xn 17 # end on column 19.
      #
      #   interface 'other_interface' do
      #     xn { use('my_interface').west } # end on column 6, if
      #                                     # `my_interface` changes position,
      #                                     # `other_interface` will too.
      #
      # @return [Fixnum]
      def xn(value = 1, &block)
        return attributes[:geometry][:xn] = block if block_given?

        Vedeu.log(out_of_bounds('xn')) if x_out_of_bounds?(value)

        attributes[:geometry][:xn] = value
      end

      # Specify the starting y position (row/line) of the interface.
      #
      # @param value [Fixnum]
      # @param block [Proc]
      #
      # @example
      #   interface 'my_interface' do
      #     y  4
      #     ...
      #
      #   interface 'other_interface' do
      #     y  { use('my_interface').north } # start on row/line 3, if
      #     ...                              # `my_interface` changes position,
      #                                      # `other_interface` will too.
      #
      # @return [Fixnum]
      def y(value = 1, &block)
        return attributes[:geometry][:y] = block if block_given?

        Vedeu.log(out_of_bounds('y')) if y_out_of_bounds?(value)

        attributes[:geometry][:y] = value
      end

      # Specify the ending y position (row/line) of the interface.
      #
      # @todo Update this documentation.
      #
      # @param value [Fixnum]
      # @param block [Proc]
      #
      # @example
      #   interface 'my_interface' do
      #     y  14 # start on row 14.
      #     yn 15 # end on row 15.
      #
      #   interface 'other_interface' do
      #     yn { use('my_interface').top } # end on column 16, if
      #                                    # `my_interface` changes position,
      #                                    # `other_interface` will too.
      #
      # @return [Fixnum]
      def yn(value = 1, &block)
        return attributes[:geometry][:yn] = block if block_given?

        Vedeu.log(out_of_bounds('yn')) if y_out_of_bounds?(value)

        attributes[:geometry][:yn] = value
      end

      private

      # Returns the out of bounds error message for the given named attribute.
      #
      # @param name [String]
      # @return [String]
      def out_of_bounds(name)
        "Note: For this terminal, the value of '#{name}' may lead to content " \
        "that is outside the viewable area."
      end

      # Checks the value is within the terminal's confines.
      #
      # @param value [Fixnum]
      # @return [Boolean]
      def y_out_of_bounds?(value)
        value < 1 || value > Terminal.height
      end

      # Checks the value is within the terminal's confines.
      #
      # @param value [Fixnum]
      # @return [Boolean]
      def x_out_of_bounds?(value)
        value < 1 || value > Terminal.width
      end

    end # Interface

  end # API

end # Vedeu
