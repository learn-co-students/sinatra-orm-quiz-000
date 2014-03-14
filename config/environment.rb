require 'uri'
require 'bundler/setup'
Bundler.require

if ENV["QUIZ_ENV"]
  ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/#{ENV['QUIZ_ENV']}.sqlite"
  )
end