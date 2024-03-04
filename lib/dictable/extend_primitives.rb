# frozen_string_literal: true

class Integer
  def to_dictable
    Dictable::DictableNumber.new(self).to_dictable
  end
end

class String
  def to_dictable_number
    Dictable::DictableNumber.new(self).to_dictable
  end
end
