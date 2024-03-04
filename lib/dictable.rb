# frozen_string_literal: true

# lib/dictable.rb
require_relative 'dictable/version'
require_relative 'dictable/exceptions'
require_relative 'dictable/address'
require_relative 'dictable/number'

# We are going to change the design of the gem to make it more flexible.
module Dictable
  def self.address(address)
    Address.new(address).to_dictable
  end

  def self.number(number, chunk_size: 3, separator: ',')
    Number.new(number, chunk_size: chunk_size, separator: separator).to_dictable
  end
end

#
# module Number; end
# class Number::Base; end
#
# Each language will have a dictionary
# module Number::English; end
# module Number::Spanish; end
#
# this is the explanation of the adapter pattern
# https://refactoring.guru/design-patterns/adapter/ruby/example
#
#
