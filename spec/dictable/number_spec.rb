# frozen_string_literal: true

require 'spec_helper'
require 'dictable'

RSpec.describe Dictable::Number do
  context 'with large numbers' do
    it 'converts 123456 to one two three, four five six' do
      expect(described_class.to_dictable(123_456, chunk_size: 2)).to eq('one two, three four, five six')
    end
  end
end
