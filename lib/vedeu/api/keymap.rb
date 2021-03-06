module Vedeu

  module API

    # Provides methods to be used to define keypress mapped to actions.
    #
    # @api public
    class Keymap < Vedeu::Keymap

      # Define keypress(es) to perform an action.
      #
      # @param value_or_values [String|Symbol] The key(s) pressed. Special keys
      #   can be found in {Vedeu::Input#specials}. When more than one key is
      #   defined, then the extras are treated as aliases.
      # @param block [Proc] The action to perform when this key is pressed. Can
      #   be a method call or event triggered.
      #
      # @example
      #   keys do
      #     key('s')        { trigger(:save) }
      #     key('h', :left) { trigger(:left) }
      #     key('j', :down) { trigger(:down) }
      #     ...
      #
      # @raise [InvalidSyntax] When the required block is not given, the
      #   value_or_values parameter is undefined, or when processing the
      #   collection, a member is undefined.
      # @return [Array] A collection containing the keypress(es).
      def key(*value_or_values, &block)
        fail InvalidSyntax,
          'No action defined for `key`.' unless block_given?
        fail InvalidSyntax, 'No keypress(es) defined for `key`.' unless
          defined_value?(value_or_values)

        value_or_values.each do |value|
          fail InvalidSyntax,
            'An invalid value for `key` was encountered.' unless
              defined_value?(value)

          attributes[:keys] << { key: value, action: block }
        end
      end

      # The interface(s) which will handle these keys.
      #
      # @param name_or_names [String] The name or names of the interface(s)
      # which will handle these keys.
      #
      # @example
      #   keys do
      #     interface 'my_interface'
      #     key('s')  { :something }
      #     name      'my_keymap'
      #     ...
      #
      #   keys do
      #     interface('main', 'other')
      #     key('s')  { :something }
      #     ...
      #
      #   keys do
      #     interfaces('main', 'other')
      #     ...
      #
      # @return [Array]
      def interface(*name_or_names)
        attributes[:interfaces] = name_or_names
      end
      alias_method :interfaces, :interface

    end # Keymap

  end # API

end # Vedeu
