# Dictable

Ever encountered the challenge of ensuring your text-to-speech applications pronounce addresses just the way most people in the U.S. do? Dictable is here to bridge that gap. This Ruby Gem transforms addresses like `1234 N Lasalle Ave` into their spoken-word equivalents, such as `twelve thirty four north lasalle avenue`, optimizing them for clear and natural dictation.

Our approach to converting numbers into words is opinionated and intentionally avoids frequent use of "hundred" and "thousand" unless common usage dictates otherwise. The goal? To closely replicate the nuanced way addresses are articulated in everyday conversation across the U.S. Dive into the examples from our tests to see the difference in action.

In a landscape where text-to-voice platforms each have their unique way of pronouncing numbers, as of March 2024, Dictable hands you the reins for more consistent and predictable address dictation.

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

puts Dictable.address('2300 N Lincoln Park St')
# > 'twenthy three hundred North Lincoln Park Street'

```

## Example
List of samples from specs for addresses:

```
Dictable::StreetName
  converts 1234 N Lasalle Ave to 1234 north lasalle avenue
  converts 1234 E Chelsea Rd to 1234 east chelsea road
  converts 1234 s Chelsea st to 1234 south chelsea street
  converts 1234 w Chelsea Blvd to 1234 west chelsea boulevard
  converts 1234 N Clifford Dr to 1234 north clifford drive
  converts 1234 E Chelsea Ct to 1234 east chelsea court
  converts 1234 S Chelsea pl to 1234 south chelsea place
  converts 1234 S Chelsea Pl Gandalf to 1234 south chelsea place gandalf
  converts 1234 W Chelsea Ter to 1234 west chelsea terrace

Dictable::StreetNumber
  converts 0 to zero
  converts 5 to five
  converts 10 to ten
  converts 21 to twenty one
  converts 100 to one hundred
  converts 103 to one hundred three
  converts 303 to three hundred three
  converts 123 to one twenty three
  converts 323 to three twenty three
  converts 1000 to one thousand
  converts 4321 to forty three twenty one
  converts 4300 to forty three hundred
  converts 1900 to nineteen hundred
  converts 32323 to thirty two three twenty three

Dictable
  #address
    converts 1234 N Lasalle Ave to twelve thirty four north lasalle avenue
    converts 123 S Lasalle rd to one twenty three south lasalle road
    converts 1500 s Lasalle Rd to fifteen hundred south lasalle road

```

Please note that the numbers in quotes are treated as strings, which allows leading zeroes to be preserved.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub. This project aims to be a safe, welcoming space for collaboration, and contributors are expected to adhere to a code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).