module StringEntropy
  class Info

    attr_reader :string,
                :encoding,
                :count,
                :frequency,
                :information_entropy,
                :shannon_entropy,
                :metric_entropy

    # The common defintion of "entropy" when working with strings
    alias_method :entropy, :information_entropy

    # Supports only ASCII_8BIT encoding
    POSSIBLE_CHARS = 95.freeze

    def initialize(string=nil)
      @string    = ascii(string)
      @count     = @string.split("").each.with_object(Hash.new(0.to_f)) { |char, hash| hash[char] += 1 }.freeze
      @frequency = @count.each_with_object(Hash.new) { |(char,count),frequency| frequency[char] = (count / @string.length) }.freeze

      @information_entropy = Math.log2(POSSIBLE_CHARS**@string.length).freeze
      @shannon_entropy     = -(@frequency.values.map { |x| x * Math.log2(x) }.inject(:+)).freeze
      @metric_entropy      = (@shannon_entropy / @string.length).freeze

      @shannon_formulas    = shannon_formulas

      self.freeze
    end

    # Show the math behind calculating Shannon Entropy as an array of the steps taken
    def shannon_formulas
      formulas = []
      formulas << @frequency.values.map { |x| "(#{x} * Math.log2(#{x}))" }.join("+")
      formulas << @frequency.values.map { |x| "(#{x * Math.log2(x)})" }.join("+")
      formulas << "#{@frequency.values.map { |x| x * Math.log2(x) }.inject(:+)}"
      formulas.map! { |x| "-[ (#{x}) ]" }
      formulas << "#{@shannon_entropy}"
      formulas.map! { |x| "H(X) = #{x}"}
      formulas.freeze
    end

    private

    def ascii(string)
      raise NilHasZeroEntropy unless string

      begin
        ascii = string.encode(Encoding::ASCII_8BIT)
      rescue Encoding::UndefinedConversionError
        raise BadEncoding
      end

      safe_ascii = ascii.split("").select { |x| true if (32..126) === x.ord }.join("")
      raise StringMismatch unless ascii == safe_ascii && ascii == string

      @encoding = Encoding::ASCII_8BIT.name

      safe_ascii.freeze
    end

  end
end
