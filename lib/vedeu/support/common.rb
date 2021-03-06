module Vedeu

  # A module for common methods used throughout Vedeu.
  #
  # @api private
  module Common

    # Returns a boolean indicating whether a variable has a useful value.
    #
    # @param variable [String|Symbol|Array|Fixnum] The variable to check.
    # @return [Boolean]
    def defined_value?(variable)
      return true if variable.is_a?(Fixnum)
      return true unless variable.nil? || variable.empty?

      false
    end

  end # Common

end # Vedeu
