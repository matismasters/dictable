# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Dictable::StreetName do
  [
    { street_name: '1234 N Lasalle Ave', exploded: '1234 north lasalle avenue' },
    { street_name: '1234 E Chelsea Rd', exploded: '1234 east chelsea road' },
    { street_name: '1234 s Chelsea st', exploded: '1234 south chelsea street' },
    { street_name: '1234 w Chelsea Blvd', exploded: '1234 west chelsea boulevard' },
    { street_name: '1234 N Clifford Dr', exploded: '1234 north clifford drive' },
    { street_name: '1234 E Chelsea Ct', exploded: '1234 east chelsea court' },
    { street_name: '1234 S Chelsea pl', exploded: '1234 south chelsea place' },
    { street_name: '1234 S Chelsea Pl Gandalf', exploded: '1234 south chelsea place gandalf' },
    { street_name: '1234 W Chelsea Ter', exploded: '1234 west chelsea terrace' }
  ].each do |test_case|
    it "converts #{test_case[:street_name]} to #{test_case[:exploded]}" do
      expect(described_class.new(test_case[:street_name]).to_dictable).to eq(test_case[:exploded])
    end
  end
end
