# frozen_string_literal: true

# lib/easy_to_dictate_numbers.rb
require_relative 'easy_to_dictate_numbers/version'
require_relative 'easy_to_dictate_numbers/extend_primitives'

module EasyToDictateNumbers
  class Error < StandardError; end

  class NumberToDictable
    ONES = %w[zero one two three four five six seven eight nine].freeze
    TEENS = %w[ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen].freeze
    TENS = %w[twenty thirty forty fifty sixty seventy eighty ninety].freeze

    def self.number_to_words(number)
      validate_number(number)

      case number.digits.count
      when 1, 2 then two_digit_number_to_words(number)
      when 3 then three_digit_number_to_words(number)
      when 4 then four_digit_number_to_words(number)
      else large_number_to_words(number)
      end
    end

    def self.validate_number(number)
      raise Error, 'Please enter a non-negative number' if number.negative?
    end

    def self.two_digit_number_to_words(number)
      return ONES[number] if number < 10
      return TEENS[number - 10] if number < 20

      div, mod = number.divmod(10)
      TENS[div - 2] + (mod.zero? ? '' : " #{ONES[mod]}")
    end

    def self.three_digit_number_to_words(number)
      first_digit, remainder = number.divmod(100)
      words = [ONES[first_digit], 'hundred']
      words << two_digit_number_to_words(remainder) unless remainder.zero?
      words.join(' ')
    end

    def self.four_digit_number_to_words(number)
      high_pair, low_pair = number.divmod(100)
      words = []
      words << "#{two_digit_number_to_words(high_pair)} hundred" unless high_pair.zero?
      words << two_digit_number_to_words(low_pair) unless low_pair.zero? || high_pair.zero?
      words.join(' ')
    end

    def self.large_number_to_words(number)
      number.to_s.chars.map { |digit| ONES[digit.to_i] }.each_slice(3).map { |digit| digit.join(' ') }.join(', ')
    end
  end
end
