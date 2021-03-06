ENV['RAILS_ENV'] ||= 'test'

require_relative 'dummy/config/environment'
require 'rspec/rails'
require 'rspec/its'

require_relative '../lib/rails-pixrem'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
