require 'spec_helper'

RSpec.describe Dictable do
  describe '#address' do
    [
      { address: '1234 N Lasalle Ave', dictable: 'twelve thirty four north lasalle avenue' },
      { address: '123 S Lasalle rd', dictable: 'one twenty three south lasalle road' },
      { address: '1500 s Lasalle Rd', dictable: 'fifteen hundred south lasalle road' }
    ].each do |test_case|
      it "converts #{test_case[:address]} to #{test_case[:dictable]}" do
        expect(described_class.address(test_case[:address])).to eq(test_case[:dictable])
      end
    end
  end

  describe '#load_dictionary' do
    it 'loads the english dictionary' do
      expect(described_class.load_dictionary(:address_abbreviations_exploded)).to be_a(Hash)
    end
  end
end
