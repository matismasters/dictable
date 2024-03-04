# frozen_string_literal: true

module Dictable
  class Number
    ONES = %w[zero one two three four five six seven eight nine].freeze

    def self.to_dictable(number, chunk_size: 3, separator: ',')
      digits_char_map = number.to_s.chars.map do |digit|
        ONES[digit.to_i]
      end

      digits_char_map.each_slice(chunk_size).map do |digit|
        digit.join(' ')
      end.join("#{separator} ")
    end
  end
end
