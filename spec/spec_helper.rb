# encoding: utf-8

require 'webmock/rspec'
require 'simplecov'
SimpleCov.start
RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  config.before(:all) do
    FactoryGirl.reload
  end
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
