# frozen_string_literal: true

# It returns PlacementSeq messages with placements
class PlacementSeqMessage
  class << self
    def call
      build_placement_seq
    end

    # Encode data into protobuf format
    def serialize
      FYBER::Userconfiguration::PlacementSeq.encode(build_placement_seq)
    end

    # Decodes the protobuf data
    def deserialize(data)
      FYBER::Userconfiguration::PlacementSeq.decode(data)
    end

    private

    def placement_messages
      @placement_messages ||= PlacementMessage.all
    end

    def build_placement_seq
      FYBER::Userconfiguration::PlacementSeq.new(placement: placement_messages)
    end
  end
end
