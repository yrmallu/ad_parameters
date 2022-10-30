# frozen_string_literal: true

require 'nokogiri'

root = Pathname.new(Dir.pwd)

Dir[root.join('config', '**', '*.rb')].each { |file| require file }
Dir[root.join('app', '**', '*.rb')].each { |file| require file }
