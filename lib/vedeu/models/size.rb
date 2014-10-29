module Vedeu

  class Size

    # @param attributes [Hash]
    # @option attributes :centred [Boolean]
    # @option attributes :tvn [Fixnum] The width or height of the Terminal.
    # @option attributes :value [Fixnum] The width or height of the interface.
    # @option attributes :v [Fixnum] The starting value for this object;
    #   equivalent to x or y in {Vedeu::Geometry}.
    # @option attributes :vn [Fixnum] The ending value for this object;
    #   equivalent to xn or yn in {Vedeu::Geometry}.
    def initialize(attributes = {})
      @attributes = attributes


      @centred = @attributes[:centred]
      @tvn     = @attributes[:tvn]
      @value   = @attributes[:value]
      @v       = @attributes[:v]
      @vn      = @attributes[:vn]
    end

    def first
      return 1 if full?

    end

    def last
      return tvn if full?

    end

    private

    attr_reader :attributes, :tvn, :value, :vn, :v

    def full?
      if v? && vn? && (vn - v) >= tvn
        true

      elsif value? && value >= tvn
        true

      else
        false
      end
    end

    #   if centred?
    #     if value?
    #       # (value / 2) > (tvn / 2) ||
    #       value >= tvn

    #     else
    #       :centred_no_value

    #     end

    #   else
    #     if value?
    #       value >= tvn

    #     else
    #       :not_centred_no_value

    #     end

    #   end
    # end

    def centred?
      !!(attributes[:centred])
    end

    def value?
      !!(attributes[:value])
    end

    def vn?
      !!(attributes[:vn])
    end

    def v?
      !!(attributes[:v])
    end

    def terminal_value
      @tvn
    end

  end # Size

end # Vedeu
