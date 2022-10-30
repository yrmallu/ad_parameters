# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlacementMessage do
  include_context 'creatives and placements'
  let!(:operation) { described_class.call(creatives, placements) }

  describe '.all' do
    it 'renders placements with respected eligible creatives' do
      expect(described_class.all).to include(*build_placements)
    end
  end
end
