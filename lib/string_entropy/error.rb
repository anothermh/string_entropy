module StringEntropy

  class Error < StandardError; end

  class BadEncoding < Error
    def initialize
      super("The string could not be converted to ASCII_8BIT encoding")
    end
  end

  class StringMismatch < Error
    def initialize
      super("The string contains invalid ASCII_8BIT characters (only character codes 32..126 are valid)")
    end
  end

  class NilHasZeroEntropy < Error
    def initialize
      super("nil values cannot be evaluated as strings and have zero entropy")
    end
  end

end