ENV["QUIZ_ENV"] ||= "development"

require 'uri'
require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['QUIZ_ENV']}.sqlite"
)