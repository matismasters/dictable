# frozen_string_literal: true

# lib/dictable.rb
require_relative 'dictable/version'
require_relative 'dictable/extend_primitives'
require_relative 'dictable/exceptions'
require_relative 'dictable/dictable_number'

# We are going to change the design of the gem to make it more flexible.

module DictableNumber
  class Base
    def initialize(number:)
      @number = number
    end

    def to_dictable
      raise NotImplementedError
    end
  end
end

#
# module DictableNumber; end
# class DictableNumber::Base; end
#
# Each language will have a dictionary
# module DictableNumber::English; end
# module DictableNumber::Spanish; end
#
# this is the explanation of the adapter pattern
# https://refactoring.guru/design-patterns/adapter/ruby/example
#
#
