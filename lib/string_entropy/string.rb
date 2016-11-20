class String
  def entropy
    StringEntropy::Info.new(self).information_entropy
  end
end
