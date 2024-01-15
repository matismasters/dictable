# EasyToDictateNumbers

EasyToDictateNumbers is a Ruby gem that allows for easy conversion of numbers into their word representations. This gem is useful in scenarios where numbers need to be communicated clearly, such as in telephone conversations or when dictating information.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easy_to_dictate_numbers'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install easy_to_dictate_numbers
```

## Usage

To use EasyToDictateNumbers, simply call the `to_dictable` method on any `Integer`, this converts the number into its easy to dictate word representation.

```ruby
require 'easy_to_dictate_numbers'

puts 123.to_dictable
# Output: "one twenty three"

puts "1243".to_dictable_number
# Output: "twelve forty three"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub. This project aims to be a safe, welcoming space for collaboration, and contributors are expected to adhere to a code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
