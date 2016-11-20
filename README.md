# string_entropy

Outputs the information entropy, Shannon entropy, and metric entropy of any given `ASCII_8BIT` string.

More information on entropy:

* https://en.wikipedia.org/wiki/Entropy_%28information_theory%29
* https://en.wikibooks.org/wiki/An_Intuitive_Guide_to_the_Concept_of_Entropy_Arising_in_Various_Sectors_of_Science

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'string_entropy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install string_entropy

## Usage

As an extension to the `String` class:

```ruby
"password".entropy
=> 52.55884486664758
```

With the `StringEntropy::Info` class:

```ruby
string_entropy = StringEntropy.info("password")
=> #<StringEntropy::Info:0x007fb864091590 @string="password", @count={"p"=>1.0, "a"=>1.0, "s"=>2.0, "w"=>1.0, "o"=>1.0, "r"=>1.0, "d"=>1.0}, @frequency={"p"=>0.125, "a"=>0.125, "s"=>0.25, "w"=>0.125, "o"=>0.125, "r"=>0.125, "d"=>0.125}, @information_entropy=52.55884486664758, @shannon_entropy=2.75, @metric_entropy=0.34375, @shannon_formulas=["H(X) = -[ ((0.125 * Math.log2(0.125))+(0.125 * Math.log2(0.125))+(0.25 * Math.log2(0.25))+(0.125 * Math.log2(0.125))+(0.125 * Math.log2(0.125))+(0.125 * Math.log2(0.125))+(0.125 * Math.log2(0.125))) ]", "H(X) = -[ ((-0.375)+(-0.375)+(-0.5)+(-0.375)+(-0.375)+(-0.375)+(-0.375)) ]", "H(X) = -[ (-2.75) ]", "H(X) = 2.75"]>

# Original string
string_entropy.string
=> "password"

# String encoding, currently only supports ASCII_8BIT
string_entropy.encoding
=> "ASCII-8BIT"

# The commonly described "entropy" of a string; Math.log2(total_possible_chars^string_length)
string_entropy.entropy
=> 52.55884486664758

# Alias for .entropy method
string_entropy.information_entropy
=> 52.55884486664758

# The Shannon entropy value
string_entropy.shannon_entropy
=> 2.75

# The metric entropy value (Shannon entropy divided by string length)
string_entropy.metric_entropy
=> 0.34375

# The count of each character
string_entropy.count
=> {
    "p" => 1.0,
    "a" => 1.0,
    "s" => 2.0,
    "w" => 1.0,
    "o" => 1.0,
    "r" => 1.0,
    "d" => 1.0
}

# The frequency/percentage of each character
string_entropy.frequency
=> {
    "p" => 0.125,
    "a" => 0.125,
    "s" => 0.25,
    "w" => 0.125,
    "o" => 0.125,
    "r" => 0.125,
    "d" => 0.125
}

# This is how the Shannon entropy is calculated
string_entropy.shannon_formulas
=> [
    [0] "H(X) = -[ ((0.125 * Math.log2(0.125))+(0.125 * Math.log2(0.125))+(0.25 * Math.log2(0.25))+(0.125 * Math.log2(0.125))+(0.125 * Math.log2(0.125))+(0.125 * Math.log2(0.125))+(0.125 * Math.log2(0.125))) ]",
    [1] "H(X) = -[ ((-0.375)+(-0.375)+(-0.5)+(-0.375)+(-0.375)+(-0.375)+(-0.375)) ]",
    [2] "H(X) = -[ (-2.75) ]",
    [3] "H(X) = 2.75"
]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Credits

Inspired by http://www.shannonentropy.netmark.pl.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/anothermh/string_entropy.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
