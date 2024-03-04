# frozen_string_literal: true

module Dictable
  class Error < StandardError; end

  class NonNumberCharactersPresent < StandardError
    def initialize
      super('Non-number characters present')
    end
  end
end
