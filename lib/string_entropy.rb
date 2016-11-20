require "string_entropy/error"
require "string_entropy/info"
require "string_entropy/version"
require "string_entropy/string"

module StringEntropy
 
  def self.info(string)
    StringEntropy::Info.new(string)
  end

  def self.example
    StringEntropy::Info.new("password")
  end

end
