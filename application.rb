# frozen_string_literal: true

require_relative 'config/environment'

if File.exist?(ARGV[0]) && File.extname(ARGV[0]).eql?('.xml')
  creatives, placements = ConfigurationParser.call(ARGV[0])

  PlacementMessage.call(creatives, placements)
  $stdout.puts PlacementSeqMessage.serialize
else
  $stdout.puts 'Please provide correct file path'
end
