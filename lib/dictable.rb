# frozen_string_literal: true

# lib/dictable.rb
require_relative 'dictable/version'
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
    dictionary_path = File.join(__dir__, '../dictionaries', lang.to_s, "#{name}.yml")
    YAML.load_file(dictionary_path)
  end
end
