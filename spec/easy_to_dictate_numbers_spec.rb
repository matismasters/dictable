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

      it 'converts 09 to zero nine' do
        expect(described_class.number_to_words('09')).to eq('zero nine')
      end
    end

    context 'with three-digit numbers' do
      it 'converts 000 to zero zero zero' do
        expect(described_class.number_to_words('000')).to eq('zero zero zero')
      end

      it 'converts 100 to one hundred' do
        expect(described_class.number_to_words(100)).to eq('one hundred')
      end

      it 'converts 123 to one twenty three' do
        expect(described_class.number_to_words(123)).to eq('one twenty three')
      end

      it 'converts 001 to zero zero one' do
        expect(described_class.number_to_words('001')).to eq('zero zero one')
      end

      it 'converts 010 to zero ten' do
        expect(described_class.number_to_words('010')).to eq('zero ten')
      end
    end

    context 'with four-digit numbers' do
      it 'converts 0000 to zero zero zero zero' do
        expect(described_class.number_to_words('0000')).to eq('zero zero zero zero')
      end

      it 'converts 1000 to one thousand' do
        expect(described_class.number_to_words(1000)).to eq('one thousand')
      end

      it 'converts 4321 to forty three twenty one' do
        expect(described_class.number_to_words(4321)).to eq('forty three twenty one')
      end

      it 'converts 4300 to forty three hundred' do
        expect(described_class.number_to_words(4300)).to eq('forty three hundred')
      end

      it 'converts 0001 to zero zero zero one' do
        expect(described_class.number_to_words('0001')).to eq('zero zero zero one')
      end

      it 'converts 0010 to zero zero ten' do
        expect(described_class.number_to_words('0010')).to eq('zero zero ten')
      end

      it 'converts 0100 to zero one hundred' do
        expect(described_class.number_to_words('0100')).to eq('zero one hundred')
      end
    end

    context 'with large numbers' do
      it 'converts 123456 to one two three, four five six' do
        expect(described_class.number_to_words(123_456)).to eq('one two three, four five six')
      end
    end

    context 'with non-number characters in the string' do
      it 'raises an error for strings with non-number characters' do
        expect do
          described_class.number_to_words('AB00123')
        end.to raise_error(EasyToDictateNumbers::NonNumberCharactersPresent)
      end
    end
  end
end
