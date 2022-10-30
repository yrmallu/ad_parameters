# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Currency::Convert do
  subject(:operation) { -> { described_class.call(currency, amount) } }
  subject(:result) { operation.call }

  let(:rates) do
    {
      usd: 1.13,
      tyr: 3.31,
      sek: 21.31
    }
  end

  describe '.call' do
    context 'when EURO' do
      let(:currency) { 'EUR' }
      let(:amount) { rand(100).to_f }

      it 'renders the same amount' do
        expect(result).to eq(amount)
      end
    end

    %w[USD SEK TYR].each do |currency|
      context "when #{currency}" do
        let(:currency) { currency }
        let(:amount) { rand(100).to_f }

        it 'returns the converted amount into EURO' do
          expect(result).to eq((amount / rates[currency.downcase.to_sym]).round(4))
        end
      end
    end
  end
end
