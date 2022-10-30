# frozen_string_literal: true

# It will convert prices into one unique reference currency (EUR)
module Currency
  class Convert
    DEFAULT_CURRENCY = 'eur'

    class << self
      def call(currency, amount)
        return amount.to_f if currency.downcase.eql?(DEFAULT_CURRENCY)

        (amount.to_f / rates[currency.downcase.to_sym]).round(4)
      end

      private

      def rates
        {
          usd: 1.13,
          tyr: 3.31,
          sek: 21.31
        }
      end
    end
  end
end
