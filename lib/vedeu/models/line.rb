module Vedeu

  # A Line represents a single row of the terminal. It is a container for
  # {Vedeu::Stream} objects. A line's width is determined by the
  # {Vedeu::Interface} it belongs to.
  #
  # @api private
  class Line

    include Coercions
    include Presentation

    attr_reader :attributes, :parent

    # Builds up a new Line object and returns the attributes.
    #
    # @param attributes [Hash]
    # @param block [Proc]
    # @return [Hash]
    def self.build(attributes = {}, &block)
      new(attributes, &block).attributes
    end

    # Returns a new instance of Line.
    #
    # @param attributes [Hash]
    # @param block [Proc]
    # @return [Line]
    def initialize(attributes = {}, &block)
      @attributes = defaults.merge!(attributes)
      @parent     = @attributes[:parent]

      # if block_given?
      #   @self_before_instance_eval = eval('self', block.binding)

      #   instance_eval(&block)
      # end
    end

    # Returns an array of all the characters with formatting for this line.
    #
    # @return [Array]
    # @see Vedeu::Stream
    def chars
      return [] if empty?

      @_chars ||= streams.map(&:chars).flatten
    end

    # Returns a boolean indicating whether the line has content.
    #
    # @return [Boolean]
    def empty?
      size == 0
    end

    # Returns the size of the content in characters without formatting.
    #
    # @return [Fixnum]
    def size
      streams.map(&:size).inject(0, :+) { |sum, x| sum += x }
    end

    # Returns a collection of streams associated with this line. This method
    # also has the alias_method :data, a convenience method to provide
    # Presentation with a consistent interface.
    #
    # @return [Array]
    def streams
      @streams ||= Stream.coercer(attributes[:streams])
    end
    alias_method :data, :streams

    private

    # The default values for a new instance of Line.
    #
    # @return [Hash]
    def defaults
      {
        colour:  {},
        streams: [],
        style:   [],
        parent:  nil,
      }
    end

    # @param method [Symbol] The name of the method sought.
    # @param args [Array] The arguments which the method was to be invoked with.
    # @param block [Proc] The optional block provided to the method.
    # @return []
    # def method_missing(method, *args, &block)
    #   Vedeu.log("Line#method_missing '#{method}' (args: #{args.inspect})")

    #   @self_before_instance_eval.send(method, *args, &block) if @self_before_instance_eval
    # end

  end # Line

end # Vedeu
