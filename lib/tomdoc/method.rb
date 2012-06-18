module TomDoc
  # A Method can be instance or class level.
  class Method
    attr_accessor :name, :comment, :args

    def initialize(name, comment = '', args = [])
      @name    = name
      @comment = comment
      @args    = args || []
    end
    alias_method :to_s, :name

    def tomdoc
      @tomdoc ||= TomDoc.new(@comment)
    end

    def inspect
      "#{name}(#{args.join(', ')})"
    end
  end
end
