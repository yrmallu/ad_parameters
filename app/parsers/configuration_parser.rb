# frozen_string_literal: true

# It reads the input xml file and returns creatives and placements
class ConfigurationParser < Nokogiri::XML::SAX::Document
  attr_accessor :creatives, :placements

  class << self
    def call(file_path)
      parser = Nokogiri::XML::SAX::Parser.new(ConfigurationParser.new)
      parser.parse(File.open(file_path))
      [parser.document.creatives, parser.document.placements]
    end
  end

  private

  def start_document
    @creatives = []
    @placements = []
  end

  def start_element(name, attrs = [])
    attrs = attrs.to_h

    case name
    when 'Creative'
      @creatives << { id: attrs['id'], price: convert_currency_to_euro(attrs['currency'], attrs['price']) }
    when 'Placement'
      @placements << { id: attrs['id'], floor: convert_currency_to_euro(attrs['currency'], attrs['floor']) }
    end
  end

  def convert_currency_to_euro(currency, amount)
    Currency::Convert.call(currency, amount)
  end
end
