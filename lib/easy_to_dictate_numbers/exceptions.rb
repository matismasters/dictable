# frozen_string_literal: true

module EasyToDictateNumbers
  class Error < StandardError; end

  class NonNumberCharactersPresent < StandardError
    def initialize
      super('Non-number characters present')
    end
  end
end
