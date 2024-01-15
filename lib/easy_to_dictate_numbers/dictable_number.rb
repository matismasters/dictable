# frozen_string_literal: true

module EasyToDictateNumbers
  class DictableNumber
    attr_reader :number_to_dictate, :dictable_number_in_words

    ONES = %w[zero one two three four five six seven eight nine].freeze
    TEENS = %w[ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen].freeze
    TENS = %w[twenty thirty forty fifty sixty seventy eighty ninety].freeze

    def initialize(number_to_dictate)
      @number_to_dictate = number_to_dictate.to_s
      validate_number(@number_to_dictate)
    end

    def to_dictable
      @to_dictable ||= number_to_words
    end

    private

    def number_to_words
      number_as_string = @number_to_dictate

      leading_zeroes_words = leading_zeroes_to_words(number_as_string)

      number_without_leading_zeroes = number_without_leading_zeroes(number_as_string)
      number_without_leading_zeroes_words = number_without_leading_zeroes_to_words(number_without_leading_zeroes)

      [leading_zeroes_words, number_without_leading_zeroes_words].reject(&:empty?).join(' ')
    end

    def validate_number(number_as_string)
      raise NonNumberCharactersPresent if number_as_string.match?(/[^0-9]/)
    end

    def number_without_leading_zeroes_to_words(number_as_string)
      case number_as_string.length
      when 1 then one_digit_number_to_words(number_as_string)
      when 2 then two_digit_number_to_words(number_as_string)
      when 3 then three_digit_number_to_words(number_as_string)
      when 4 then four_digit_number_to_words(number_as_string)
      else large_number_to_words(number_as_string)
      end
    end

    def repeat_zeroes(number_of_zeroes)
      Array.new(number_of_zeroes) { ONES[0] }.join(' ')
    end

    def leading_zeroes_to_words(number_as_string)
      leading_zeroes = number_as_string.match(/^0+/).to_s
      return '' if leading_zeroes.empty?

      repeat_zeroes(leading_zeroes.length)
    end

    def number_without_leading_zeroes(number_as_string)
      number_as_string.sub(/^0+/, '')
    end

    def single_thousands_to_words(number_as_string)
      number = number_as_string.to_i / 1000

      [one_digit_number_to_words(number), 'thousand'].join(' ')
    end

    def one_digit_number_to_words(number_as_string)
      number = number_as_string.to_i
      return repeat_zeroes(1) if number.zero?

      ONES[number]
    end

    def two_digit_number_to_words(number_as_string)
      number = number_as_string.to_i

      return repeat_zeroes(2) if number.zero?
      return TEENS[number - 10] if number < 20

      div, mod = number.divmod(10)
      TENS[div - 2] + (mod.zero? ? '' : " #{ONES[mod]}")
    end

    def three_digit_number_to_words(number_as_string)
      number = number_as_string.to_i
      return repeat_zeroes(3) if number.zero?

      first_digit, remainder = number.divmod(100)
      words = [ONES[first_digit]]
      words << (remainder.zero? ? 'hundred' : two_digit_number_to_words(remainder))
      words.join(' ')
    end

    def four_digit_number_to_words(number_as_string)
      number = number_as_string.to_i

      return repeat_zeroes(4) if number.zero?
      return single_thousands_to_words(number_as_string) if (number % 1000).zero?

      high_pair = number_as_string[0..1]
      low_pair = number_as_string[2..3]

      [
        two_digit_number_to_words(high_pair),
        low_pair.to_i.zero? ? 'hundred' : two_digit_number_to_words(low_pair)
      ].join(' ')
    end

    def large_number_to_words(number_as_string)
      number_as_string.chars.map { |digit| ONES[digit.to_i] }.each_slice(3).map { |digit| digit.join(' ') }.join(', ')
    end
  end
end
