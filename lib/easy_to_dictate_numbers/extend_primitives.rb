# frozen_string_literal: true

class Integer
  def to_dictable
    EasyToDictateNumbers::DictableNumber.new(self).to_dictable
  end
end

class String
  def to_dictable_number
    EasyToDictateNumbers::DictableNumber.new(self).to_dictable
  end
end
