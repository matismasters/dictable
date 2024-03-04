# Dictable

GitHub Copilot: Dictable is an opinionated Ruby gem designed to convert numbers into their spoken equivalents. This gem is particularly useful in situations where precise verbal communication of numbers is required, such as during phone calls or dictation. It makes certain decisions about the "best" way to pronounce numbers, which may be subject to debate.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dictable'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install dictable
```

## Usage

To use Dictable, simply call the `to_dictable` method on any `Integer`, this converts the number into its easy to dictate word representation.

```ruby
require 'dictable'

puts 123.to_dictable
# Output: "one twenty three"

puts "1243".to_dictable_number
# Output: "twelve forty three"
```

## Example
List of samples from specs:

- `100` is converted to `one hundred`
- `123` is converted to `one twenty three`
- `'001'` is converted to `zero zero one`
- `'010'` is converted to `zero ten`
- `'0000'` is converted to `zero zero zero zero`
- `1000` is converted to `one thousand`
- `4321` is converted to `forty three twenty one`
- `4300` is converted to `forty three hundred`
- `'0001'` is converted to `zero zero zero one`
- `'0010'` is converted to `zero zero ten`
- `'0100'` is converted to `zero one hundred`

Please note that the numbers in quotes are treated as strings, which allows leading zeroes to be preserved.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub. This project aims to be a safe, welcoming space for collaboration, and contributors are expected to adhere to a code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
