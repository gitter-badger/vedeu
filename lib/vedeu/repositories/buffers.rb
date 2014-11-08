module Vedeu

  # Stores interface views to be later combined with interface geometry to be
  # displayed.
  #
  # @api private
  module Buffers

    include Repository
    extend self

    # Add an interface view into the back buffer. If the buffer is already
    # registered, then we preserve its front buffer; as this may be currently
    # being displayed.
    #
    # @param attributes [Hash]
    # @return [String] The name of the buffer that has been added.
    def add(attributes)
      validate_attributes!(attributes)

      name = attributes[:name]

      if registered?(name)
        Vedeu.log("Adding new content to existing buffer: '#{name}'")

        find(name).add(attributes)

      else
        Vedeu.log("Adding new buffer: '#{name}'")

        Buffer.new({ name: name }).add(attributes)

      end

      name
    end

    # Update the repository with the provided Buffer. Returns a boolean
    # indicating whether this was successful.
    #
    # @param buffer [Buffer]
    # @return [Boolean]
    def update(buffer)
      storage.store(buffer.name, buffer)

      true
    end

    private

    # @return [Hash]
    def in_memory
      {}
    end

    # @param name [String]
    # @raise [BufferNotFound] When the entity cannot be found with this name.
    # @return [BufferNotFound]
    def not_found(name)
      fail BufferNotFound, "Cannot find buffer: '#{name}'"
    end

  end # Buffers

end # Vedeu
