# spec/spec_helper.rb

# Require all the Ruby files that contain the classes used in your tests
require_relative '../app/models/item'
require_relative '../app/models/order'
require_relative '../app/customer'
require_relative '../app/services/order_processor'
require_relative '../app/services/discount_calculator'
# require_relative '../app/services/payment_processor'
# require_relative '../app/services/shipping_service'

# Configure RSpec
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.disable_monkey_patching!
  config.warnings = true

  config.default_formatter = 'doc' if config.files_to_run.one?
end
