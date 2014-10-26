module Vedeu
  class Centre
    def initialize(attributes = {})
      @attributes = attributes

      @centred = @attributes[:centred]
      @tvn     = @attributes[:tvn]
      @width   = @attributes[:width]
    end

    def first
      if centred?
        if width?
          (tvn / 2) - (width / 2)
        else
          1
        end
      else
        if width?
        else
          1
        end
      end
    end

    def last
      if centred?
        if width?
          (tvn / 2) + (width / 2)
        else
          tvn
        end
      else
        if width?


        else
          tvn
        end
      end
    end

    def size
      if centred?
        if width?
          (tvn / 2) + (width / 2)
        else
          tvn
        end
      else
        if width?
          if width > tvn
            tvn
          elsif width < 1
            1
          else
            width
          end
        else
          tvn
        end
      end
    end

    private

    attr_reader :centred, :tvn, :width

    def centred?
      !!(centred)
    end

    def width?
      !!(width)
    end
  end



  class Untitled
    def initialize(attributes = {})
      @attributes = attributes

      @v       = @attributes[:v]
      @vn      = @attributes[:vn]
      @width   = @attributes[:width]
      @centred = @attributes[:centred]
      @tvn     = @attributes[:tvn]
    end

    def first
    end

    def last
    end

    def size
    end

    private

    attr_reader :tvn

    def sanitize(value)
      if value < 1
        1
      elsif value > tvn
        tvn
      else
        value
      end
    end

    def centred?
      !!(@centred)
    end

    def width
      if width?
        sanitize(@width)
      else
        0
      end
    end

    def width?
      !!(@width)
    end

  end #

end # Vedeu
