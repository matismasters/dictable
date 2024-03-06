# frozen_string_literal: true

module Dictable
  class StreetNumber
    def initialize(street_number, lang: :en)
      @street_number = street_number
      @dictionary = Dictable.load_dictionary(:numbers_to_words, lang: lang)
    end

    def to_dictable
      # less than 20 or multiples of 10
      @dictionary.key?(@street_number)
      return @dictionary[@street_number] if @dictionary.key?(@street_number)

      # 100, 200, ... 900 and 1000, 2000, ... 9000
      return plain_hundreds_or_thousands_to_words(@street_number) if hundreds_or_thousands?(@street_number)

      # 20 or more and less than 100
      return two_digit_number_to_words(@street_number) if @street_number.length == 2

      # 5 digit addresses are rare, and we'll be opinionated and pronounce them as two digits, one digit, and two digits
      return five_digit_number_to_words(@street_number) if @street_number.length == 5

      # now everythinge else
      parse_in_pairs(@street_number)
    end

    private

    def hundreds_or_thousands?(number)
      number[1..].to_i.zero? && (number.length == 3 || number.length == 4)
    end

    def plain_hundreds_or_thousands_to_words(number)
      "#{@dictionary[number[0]]} #{@dictionary[number[1..]]}"
    end

    def five_digit_number_to_words(number)
      [two_digit_number_to_words(number[0..1]), @dictionary[number[2]],
       two_digit_number_to_words(number[3..])].join(' ')
    end

    def two_digit_number_to_words(number)
      @dictionary[number] || "#{@dictionary["#{number[0]}0"]} #{@dictionary[number[1]]}"
    end

    def parse_in_pairs(number)
      parts = []

      # for 3 digit numbers, we extract the first digit and pronounce it as a single digit number
      if number.length == 3
        parts << @dictionary[number[0]]
        number = number[1..]
      end

      parts += number.scan(/../).map { |pair| two_digit_number_to_words(pair) }
      parts.join(' ')
    end
  end
end
