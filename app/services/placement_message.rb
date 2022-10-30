# frozen_string_literal: true

# It returns Placement messages with respective sequence of creatives;
# It takes the creatives and placements as arguments
class PlacementMessage
  class << self
    attr_accessor :creatives, :placements

    def call(creatives, placements)
      @creatives = creatives
      @placements = placements
    end

    def all
      build_placements
    end

    private

    def build_placements
      placements.map do |placement|
        placement_msg = FYBER::Userconfiguration::Placement.new
        placement_msg.id = placement[:id]
        creatives.select { |creative| creative[:price] >= placement[:floor] }.map do |creative|
          placement_msg.creative.push(FYBER::Userconfiguration::Creative.new(id: creative[:id],
                                                                             price: creative[:price]))
        end
        placement_msg
      end
    end
  end
end
