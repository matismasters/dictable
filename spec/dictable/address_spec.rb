# frozen_string_literal: true

require 'spec_helper'
require 'dictable'

RSpec.describe Dictable::Address do
  describe '.number_to_words' do
    context 'with single-digit numbers' do
      it 'converts 0 to zero' do
        expect(described_class.new(0).to_dictable).to eq('zero')
      end

      it 'converts 5 to five' do
        expect(described_class.new(5).to_dictable).to eq('five')
      end
    end

    context 'with two-digit numbers' do
      it 'converts 10 to ten' do
        expect(described_class.new(10).to_dictable).to eq('ten')
      end

      it 'converts 21 to twenty one' do
        expect(described_class.new(21).to_dictable).to eq('twenty one')
      end

      it 'converts 09 to zero nine' do
        expect(described_class.new('09').to_dictable).to eq('zero nine')
      end
    end

    context 'with three-digit numbers' do
      it 'converts 000 to zero zero zero' do
        expect(described_class.new('000').to_dictable).to eq('zero zero zero')
      end

      it 'converts 100 to one hundred' do
        expect(described_class.new(100).to_dictable).to eq('one hundred')
      end

      it 'converts 123 to one twenty three' do
        expect(described_class.new(123).to_dictable).to eq('one twenty three')
      end

      it 'converts 001 to zero zero one' do
        expect(described_class.new('001').to_dictable).to eq('zero zero one')
      end

      it 'converts 010 to zero ten' do
        expect(described_class.new('010').to_dictable).to eq('zero ten')
      end
    end

    context 'with four-digit numbers' do
      it 'converts 0000 to zero zero zero zero' do
        expect(described_class.new('0000').to_dictable).to eq('zero zero zero zero')
      end

      it 'converts 1000 to one thousand' do
        expect(described_class.new(1000).to_dictable).to eq('one thousand')
      end

      it 'converts 4321 to forty three twenty one' do
        expect(described_class.new(4321).to_dictable).to eq('forty three twenty one')
      end

      it 'converts 4300 to forty three hundred' do
        expect(described_class.new(4300).to_dictable).to eq('forty three hundred')
      end

      it 'converts 0001 to zero zero zero one' do
        expect(described_class.new('0001').to_dictable).to eq('zero zero zero one')
      end

      it 'converts 0010 to zero zero ten' do
        expect(described_class.new('0010').to_dictable).to eq('zero zero ten')
      end

      it 'converts 0100 to zero one hundred' do
        expect(described_class.new('0100').to_dictable).to eq('zero one hundred')
      end
    end

    context 'with non-number characters in the string' do
      it 'raises an error for strings with non-number characters' do
        expect do
          described_class.new('AB00123')
        end.to raise_error(Dictable::NonNumberCharactersPresent)
      end
    end
  end
end
