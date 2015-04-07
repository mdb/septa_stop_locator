require 'bundler/setup'

Bundler.require(:development)

require 'septa_stop_locator'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.configure_rspec_metadata!
  c.hook_into :webmock
end
