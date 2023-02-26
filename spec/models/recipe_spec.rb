# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe do
  describe '.parsed_ingredients_list' do
    let(:ingredients_list) { ['Tablespoon fresh', 'white rice', 'potato'] }

    it 'returns parsed ingredients list' do
      expect(described_class.parsed_ingredients_list(ingredients_list)).to eq('Tablespoon<->fresh white<->rice potato')
    end
  end
end
