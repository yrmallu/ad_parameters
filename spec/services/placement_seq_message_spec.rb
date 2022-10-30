# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PlacementSeqMessage do
  include_context 'creatives and placements'

  before { allow(PlacementMessage).to receive(:all).and_return(build_placements) }

  let(:placement_seq) { FYBER::Userconfiguration::PlacementSeq.new(placement: build_placements) }

  let(:encoded_placements) { FYBER::Userconfiguration::PlacementSeq.encode(placement_seq) }

  describe '.call' do
    it 'calls the placement message service to get placements' do
      described_class.call

      expect(PlacementMessage).to have_received(:all)
    end

    it 'renders placements' do
      expect(described_class.call).to eq(placement_seq)
    end
  end

  describe '.serialize' do
    it 'renders encoded placements' do
      expect(described_class.serialize).to eq(encoded_placements)
    end
  end

  describe '.deserialize' do
    it 'renders encoded placements' do
      expect(described_class.deserialize(encoded_placements)).to eq(placement_seq)
    end
  end
end
