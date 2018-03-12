# frozen_string_literal: true

require 'vcr'

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = 'spec/support/cassettes'
  c.configure_rspec_metadata!
end
WebMock.disable_net_connect!
