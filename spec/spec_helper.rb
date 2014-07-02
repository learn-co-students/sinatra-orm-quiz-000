require_relative '../config/environment'
Bundler.require(:test)

require 'rack/test'
require 'capybara/rspec'
require 'capybara/dsl'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include Rack::Test::Methods
  config.include Capybara::DSL

  config.before do
    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.execute("DROP TABLE #{t}")
    end
  end

  config.after do
    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.execute("DROP TABLE #{t}")
    end
  end

  config.order = 'default'
end

def __
  raise "Replace the __ with code to make the test pass"
end