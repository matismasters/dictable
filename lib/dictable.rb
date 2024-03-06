# frozen_string_literal: true

# lib/dictable.rb
require_relative 'dictable/version'
require_relative 'dictable/exceptions'
require_relative 'dictable/street_name'
require_relative 'dictable/street_number'
require 'yaml'

# We are going to change the design of the gem to make it more flexible.
module Dictable
  def self.address(address, lang: :en)
    address_parts = address.split
    street_number = address_parts.shift
    street_address = address_parts.join(' ')

    [
      number_to_words(street_number, lang: lang),
      explode_abberviations(street_address, lang: lang)
    ].join(' ')
  end

  def self.number_to_words(street_number, lang:)
    StreetNumber.new(street_number, lang: lang).to_dictable
  end

  def self.explode_abberviations(address, lang:)
    StreetName.new(address, lang: lang).to_dictable
  end

  def self.load_dictionary(name, lang: :en)
    YAML.load_file("dictionaries/#{lang}/#{name}.yml")
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
