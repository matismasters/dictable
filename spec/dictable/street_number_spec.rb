# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Dictable::StreetNumber do
  [
    { number: '0', words: 'zero' },
    { number: '5', words: 'five' },
    { number: '10', words: 'ten' },
    { number: '21', words: 'twenty one' },
    { number: '100', words: 'one hundred' },
    { number: '103', words: 'one hundred three' },
    { number: '303', words: 'three hundred three' },
    { number: '123', words: 'one twenty three' },
    { number: '323', words: 'three twenty three' },
    { number: '1000', words: 'one thousand' },
    { number: '4321', words: 'forty three twenty one' },
    { number: '4300', words: 'forty three hundred' },
    { number: '1900', words: 'nineteen hundred' },
    { number: '32323', words: 'thirty two three twenty three' }
  ].each do |test_case|
    it "converts #{test_case[:number]} to #{test_case[:words]}" do
      expect(described_class.new(test_case[:number]).to_dictable).to eq(test_case[:words])
    end
  end
end
