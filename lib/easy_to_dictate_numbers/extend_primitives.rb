# frozen_string_literal: true

class Integer
  def to_dictable
    EasyToDictateNumbers::NumberToDictable.number_to_words(self)
  end
end

class String
  def to_dictable_number
    EasyToDictateNumbers::NumberToDictable.number_to_words(self)
  end
end
