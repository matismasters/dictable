# frozen_string_literal: true

require 'spec_helper'
require 'easy_to_dictate_numbers'

RSpec.describe EasyToDictateNumbers::NumberToDictable do
  describe '.number_to_words' do
    context 'with single-digit numbers' do
      it 'converts 0 to zero' do
        expect(described_class.number_to_words(0)).to eq('zero')
      end

      it 'converts 5 to five' do
        expect(described_class.number_to_words(5)).to eq('five')
      end
    end

    context 'with two-digit numbers' do
      it 'converts 10 to ten' do
        expect(described_class.number_to_words(10)).to eq('ten')
      end

      it 'converts 21 to twenty one' do
        expect(described_class.number_to_words(21)).to eq('twenty one')
      end
    end

    context 'with three-digit numbers' do
      it 'converts 100 to one hundred' do
        expect(described_class.number_to_words(100)).to eq('one hundred')
      end

      it 'converts 123 to one hundred twenty three' do
        expect(described_class.number_to_words(123)).to eq('one hundred twenty three')
      end
    end

    context 'with four-digit numbers' do
      it 'converts 1000 to ten hundred' do
        expect(described_class.number_to_words(1000)).to eq('ten hundred')
      end

      it 'converts 4321 to forty three hundred twenty one' do
        expect(described_class.number_to_words(4321)).to eq('forty three hundred twenty one')
      end
    end

    context 'with large numbers' do
      it 'converts 123456 to one two three, four five six' do
        expect(described_class.number_to_words(123_456)).to eq('one two three, four five six')
      end
    end

    context 'with invalid input' do
      it 'raises an error for negative numbers' do
        expect { described_class.number_to_words(-1) }.to raise_error(EasyToDictateNumbers::Error)
      end
    end
  end
end
