# frozen_string_literal: true

require 'spec_helper'
require 'easy_to_dictate_numbers'

RSpec.describe 'Test for extended primitives' do
  describe 'Integer#to_dictable' do
    it 'should call EasyToDictateNumbers::NumberToDictable.number_to_words' do
      expect(EasyToDictateNumbers::NumberToDictable).to receive(:number_to_words).with(123)
      123.to_dictable
    end
  end

  describe 'String#to_dictable_number' do
    it 'should call EasyToDictateNumbers::NumberToDictable.number_to_words' do
      expect(EasyToDictateNumbers::NumberToDictable).to receive(:number_to_words).with('123')
      '123'.to_dictable_number
    end
  end
end
