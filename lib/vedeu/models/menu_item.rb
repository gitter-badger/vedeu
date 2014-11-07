module Vedeu

  class MenuItem

    def initialize(attributes = {})
      @attributes = defaults.merge!(attributes)


    end

    private

    def defaults
      {
        parent:   nil,
        child:    nil,
        value:    nil,
        label:    nil,
        selected: nil,
        current:  nil,
      }
    end

  end # MenuItem

end # Vedeu
