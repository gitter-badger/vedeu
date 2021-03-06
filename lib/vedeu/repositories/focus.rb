module Vedeu

  # The Focus repository is simply a collection of interface names, this module
  # serving to store and manipulate the which interface is currently being
  # focussed.
  #
  # @api private
  module Focus

    include Repository
    extend self

    # System events which when called will change which interface is currently
    # focussed. When the interface is brought into focus, its cursor position
    # and visibility is restored.
    Vedeu.event(:_focus_by_name_) { |name| Vedeu::Focus.by_name(name) }
    Vedeu.event(:_focus_next_)    { Vedeu::Focus.next_item }
    Vedeu.event(:_focus_prev_)    { Vedeu::Focus.prev_item }

    # Add an interface name to the focus list unless it is already registered.
    #
    # @param attributes [String]
    # @return [Array]
    def add(attributes)
      validate_attributes!(attributes)

      return storage if registered?(attributes[:name])

      if attributes[:focus]
        storage.unshift(attributes[:name])

      else
        storage.push(attributes[:name])

      end
    end

    # Focus an interface by name.
    #
    # @param name [String]
    # @raise [InterfaceNotFound] When the interface cannot be found.
    # @return [String]
    def by_name(name)
      fail InterfaceNotFound unless storage.include?(name)

      storage.rotate!(storage.index(name))

      update
    end

    # Return the interface currently focussed.
    #
    # @raise [NoInterfacesDefined] When no interfaces are defined, we cannot
    #   make one focussed.
    # @return [String]
    def current
      fail NoInterfacesDefined if storage.empty?

      storage.first
    end

    # Returns a boolean indicating whether the named interface is focussed.
    #
    # @param name [String]
    # @return [Boolean]
    def current?(name)
      current == name
    end

    # Put the next interface relative to the current interfaces in focus.
    #
    # @return [String]
    def next_item
      storage.rotate!

      update
    end
    alias_method :next, :next_item

    # Put the previous interface relative to the current interface in focus.
    #
    # @return [String]
    def prev_item
      storage.rotate!(-1)

      update
    end
    alias_method :prev,     :prev_item
    alias_method :previous, :prev_item

    # Refresh the interface in focus.
    #
    # @return [Array]
    def refresh
      Vedeu.trigger("_refresh_#{current}_".to_sym)
    end

    private

    # Return the name of the interface in focus after triggering the refresh
    # event for that interface. Returns false if the storage is empty.
    #
    # @return [String|FalseClass]
    def update
      return false if storage.empty?

      Vedeu.log("Interface in focus: '#{current}'")

      refresh

      current
    end

    # Returns an empty collection ready for the storing of interface names.
    #
    # @return [Array]
    def in_memory
      []
    end

  end # Focus

end # Vedeu
