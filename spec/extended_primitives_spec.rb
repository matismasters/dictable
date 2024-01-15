# frozen_string_literal: true

require 'spec_helper'
require 'easy_to_dictate_numbers'

# Disabling some Rubocop rules for this test as is the best way to test the
# extended primitives monkey patching
RSpec.describe 'Test for extended primitives' do # rubocop:disable RSpec/DescribeClass
  describe 'Integer#to_dictable' do
    it 'calls EasyToDictateNumbers::DictableNumber.number_to_words' do
      expect_any_instance_of(EasyToDictateNumbers::DictableNumber).to receive(:to_dictable) # rubocop:disable RSpec/AnyInstance
      123.to_dictable
    end
  end

  describe 'String#to_dictable_number' do
    it 'calls EasyToDictateNumbers::DictableNumber.number_to_words' do
      expect_any_instance_of(EasyToDictateNumbers::DictableNumber).to receive(:to_dictable) # rubocop:disable RSpec/AnyInstance
      '123'.to_dictable_number
    end
  end
end
