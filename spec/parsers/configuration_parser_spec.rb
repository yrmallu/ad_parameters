# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ConfigurationParser do
  include_context 'creatives and placements'

  subject(:operation) { -> { described_class.call(file_path) } }
  subject(:result) { operation.call }

  let(:file_path) { Pathname.new('.').join('spec', 'fixtures', 'configuration.xml') }

  describe '.call' do
    context 'with xml file' do
      it 'returns creatives and placements' do
        expect(result).to include(creatives, placements)
      end
    end
  end
end
