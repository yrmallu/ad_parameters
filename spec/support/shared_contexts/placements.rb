# frozen_string_literal: true

RSpec.shared_context 'creatives and placements' do
  let(:creatives) do
    [
      {
        id: 'Video-1',
        price: 6.4567
      },
      {
        id: 'Video-4',
        price: 0.9942
      },
      {
        id: 'Video-7',
        price: 2.5867
      }
    ]
  end

  let(:placements) do
    [
      {
        id: 'plc-1',
        floor: 1.3456
      },
      {
        id: 'plc-2',
        floor: 4.2344
      },
      {
        id: 'plc-3',
        floor: 2.5205
      },
      {
        id: 'plc-4',
        floor: 18.1947
      }
    ]
  end

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
