module Vedeu

  class Width

    attr_reader :txn, :xn

    def initialize(attributes = {})
      @attributes = attributes

      @txn     = attributes[:txn] # should be: Terminal.xn / .yn

      @centred = attributes[:centred]
      @xn      = attributes[:xn]
      @x       = attributes[:x]
      @width   = attributes[:width]
    end

    def centred?; !!(@centred);     end
    def width?;   !!(@width);       end

    def width
      sanitize(@width)
    end

    def x?;       !!(@x);           end

    def x
      sanitize(@x)
    end

    def xn?;      !!(@xn);          end

    # Returns the starting coordinate
    #
    def first
      if centred?
        min_x = (txn / 2) - (size / 2)

        if min_x < 1
          1
        elsif min_x > txn
          1
        else
          min_x
        end

      elsif x?
        x

      elsif xn?
        if xn < 1 || xn > txn
          1

        else
          width? ? sanitize(xn - width) : sanitize(txn - xn)

        end

      else
        1

      end
    end

    # Returns the ending coordinate
    #
    def last
      if centred?
        (txn / 2) + (size / 2)

      elsif xn?
        xn

      else
        max

      end
    end

    def size
      return sanitize(xn - x) if x? && xn?

      if xn?
        width? ? sanitize((txn - xn) + width) : xn

      else
        max

      end
    end

    private

    def max
      if x? && width?
        sanitize(x + width)

      elsif x?
        sanitize(txn - x)

      elsif width?
        width

      else
        txn

      end
    end

    def sanitize(value)
      if value < 1
        1

      elsif value > txn
        txn

      else
        value

      end
    end

  end # Width

end # Vedeu
