# frozen_string_literal: true

module Dictable
  class StreetName
    def initialize(street_number, lang: :en)
      @street_number = street_number.downcase
      @dictionary = Dictable.load_dictionary(:address_abbreviations_exploded, lang: lang)
    end

    def to_dictable
      @street_number.split.map { |word| @dictionary[word.downcase] || word }.join(' ')
    end
  end
end
