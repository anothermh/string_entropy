require "spec_helper"
require "string_entropy"

describe StringEntropy do
  it "has a version number" do
    expect(StringEntropy::VERSION).not_to be nil
  end

  it "returns the example string" do
    expect(StringEntropy.example.string).to eq("password")
  end

  it "returns the example encoding as ASCII" do
    expect(StringEntropy.example.encoding).to eq("ASCII-8BIT")
  end

  it "returns the example count" do
    count = {
      "p" => 1.0,
      "a" => 1.0,
      "s" => 2.0,
      "w" => 1.0,
      "o" => 1.0,
      "r" => 1.0,
      "d" => 1.0
    }
    expect(StringEntropy.example.count).to eq(count)
  end

  it "returns the example frequency" do
    frequency = {
      "p" => 0.125,
      "a" => 0.125,
      "s" => 0.25,
      "w" => 0.125,
      "o" => 0.125,
      "r" => 0.125,
      "d" => 0.125
    }
    expect(StringEntropy.example.frequency).to eq(frequency)
  end

  it "returns the example information_entropy" do
    expect(StringEntropy.example.information_entropy).to eq(52.55884486664758)
  end

  it "returns the example shannon_entropy" do
    expect(StringEntropy.example.shannon_entropy).to eq(2.75)
  end

  it "returns the example metric_entropy" do
    expect(StringEntropy.example.metric_entropy).to eq(0.34375)
  end

  it "returns the example shannon_formulas" do
    shannon_formulas = [
      "H(X) = -[ ((0.125 * Math.log2(0.125))+(0.125 * Math.log2(0.125))+(0.25 * Math.log2(0.25))+(0.125 * Math.log2(0.125))+(0.125 * Math.log2(0.125))+(0.125 * Math.log2(0.125))+(0.125 * Math.log2(0.125))) ]",
      "H(X) = -[ ((-0.375)+(-0.375)+(-0.5)+(-0.375)+(-0.375)+(-0.375)+(-0.375)) ]",
      "H(X) = -[ (-2.75) ]",
      "H(X) = 2.75"
    ]
    expect(StringEntropy.example.shannon_formulas).to eq(shannon_formulas)
  end

  it "returns the same values for .entropy and .information_entropy" do
    expect(StringEntropy.example.entropy).to eq(StringEntropy.example.information_entropy)
  end

  it "correctly evaluates the xkcd password" do
    expect(StringEntropy::Info.new("correct horse battery staple").information_entropy).to eq(183.95595703326654)
  end

  it "monkeypatches the String core class with .entropy method" do
    expect("password".entropy).to eq(52.55884486664758)
  end
end
