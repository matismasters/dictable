## [Unreleased]

## [0.1.0] - 2023-12-08

- Initial release

## [0.1.1] - 2024-01-14

- Change documentation

## [0.1.2] - 2024-01-14

- Moved extend primitives require to lib/dictable.rb.

## [0.1.3] - 2024-01-14

- Refactored to cover special cases:
  - 100  -> one hundred
  - 1000 -> one thousand
  - 2334 -> twenty three thirty four
- Extended string with `to_dictable_number`
- Add support for leading zeroes

## [0.1.4] - 2024-01-14

- Refactor to use instance methods to avoid exposing so many
- Added rubocop and fixed all errors